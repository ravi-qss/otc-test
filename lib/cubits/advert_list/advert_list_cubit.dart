import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otc_test/cubits/advert_list/advert_list_state.dart';
import 'package:otc_test/cubits/connection/connection_cubit.dart';
import 'package:otc_test/cubits/connection/connection_state.dart';
import 'package:otc_test/models/advert_list/advert_list_response.dart';
import 'package:otc_test/models/advert_list/advert_request.dart';
import 'package:otc_test/models/token_request.dart';

class AdvertListCubit extends Cubit<AdvertListState> {
  final ConnectionCubit connectionCubit;
  static const int limit = 5;
  int pageOffset = 0;
  bool isNextPageLoading = false;
  List<AdvertList>? list = [];
  late Timer? timer;
  final int periodicFetchTime = 60; // periodic fetch after every one minute
  String? sortType;

  AdvertListCubit({required this.connectionCubit})
      : super(AdvertListInitialState()) {
    _subscribeToPeriodicFetch();
  }

  Future<void> _authorizeAPI() async {
    try {
      var authResponse = await connectionCubit.api
          .call(request: const TokenRequest(authorize: 'fAXu3jT11YEGoZ8'));
    } catch (e) {
      emit(AdvertListErrorState(e.toString()));
    }
  }

  void authorizeAndFetchAdvertList() async {
    await _authorizeAPI();
    _fetchAdvertList();
  }

  void _fetchAdvertList({bool periodicFetch = false}) async {
    try {
      var response = await connectionCubit.api.call(
          request: AdvertRequest(
              counterpartyType: 'buy',
              p2pAdvertList: 1,
              limit: periodicFetch ? getTotalPageLimit() : limit,
              sortBy: sortType,
              offset: pageOffset));
      AdvertListResponse advertListResponse =
          AdvertListResponse.fromJson(response.toJson());
      if (periodicFetch || pageOffset == 0) {
        list = advertListResponse.p2pAdvertList?.list ?? [];
      } else {
        list?.addAll(advertListResponse.p2pAdvertList?.list ?? []);
      }
      isNextPageLoading = false;
      emit(AdvertListLoadedState(list ?? [], isNextPageLoading));
    } catch (e) {
      isNextPageLoading = false;
      emit(AdvertListErrorState(e.toString()));
    }
  }

  void fetchNextPage() {
    if (state is AdvertListLoadedState) {
      pageOffset++;
      isNextPageLoading = true;
      emit(AdvertListLoadedState(list ?? [], isNextPageLoading));
      _fetchAdvertList();
    }
  }

  void _subscribeToPeriodicFetch() {
    initTimer();
    connectionCubit.stream.listen((ConnectionsState state) {
      if (state is! ConnectedState && (timer?.isActive ?? false)) {
        timer?.cancel();
      } else {
        initTimer();
      }
    });
  }

  void initTimer() {
    timer = Timer.periodic(Duration(seconds: periodicFetchTime),
        (Timer t) => _checkForNewAdvertListUpdates());
  }

  void _checkForNewAdvertListUpdates() {
    if (state is AdvertListLoadedState && !isNextPageLoading) {
      _fetchAdvertList(periodicFetch: true);
    }
  }

  void sortAdvertListBy(String type) {
    sortType = type;
    pageOffset = 0;
    _fetchAdvertList();
  }

  int getTotalPageLimit() {
    return (pageOffset + 1) * limit;
  }
}
