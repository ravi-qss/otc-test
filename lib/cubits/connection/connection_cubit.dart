import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otc_test/cubits/connection/connection_state.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/binary_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/basic_api/generated/ping_send.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/api/common/ping/ping.dart';
import 'package:flutter_deriv_api/basic_api/generated/ping_receive.dart';

class ConnectionCubit extends Cubit<ConnectionsState> {
  ConnectionCubit() : super(InitialConnectionState()) {
    _initialize();
  }

  late final BinaryAPI api;
  final UniqueKey _uniqueKey = UniqueKey();
  static late ConnectionInformation _connectionInformation;

  void _initialize() async {
    api = BinaryAPI(_uniqueKey);

    // close();

    _connectionInformation = ConnectionInformation(
      language: 'en',
      appId: '1089',
      brand: 'deriv',
      endpoint: 'frontend.binaryws.com',
    );
    if (state is! ConnectingState) {
      emit(ConnectingState(api));
    }

    await api.connect(
      _connectionInformation,
      onDone: (UniqueKey uniqueKey) async {
        if (_uniqueKey == uniqueKey) {
          await api.disconnect();

          emit(DisConnectedState());
        }
      },
      onOpen: (UniqueKey uniqueKey) {
        if (_uniqueKey == uniqueKey && state is! ConnectedState) {
          emit(ConnectedState(api));
        }
      },
      onError: (UniqueKey uniqueKey) {
        if (_uniqueKey == uniqueKey) {
          emit(DisConnectedState());
        }
      },
    );

    final PingResponse response =
        await api.call<PingResponse>(request: const PingRequest());
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ${response.msgType}');
  }

  @override
  Future<void> close() async {
    await api.disconnect();
    return super.close();
  }
}
