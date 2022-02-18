import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:otc_test/cubits/advert_list/advert_list_cubit.dart';
import 'package:otc_test/cubits/advert_list/advert_list_state.dart';
import 'package:otc_test/cubits/connection/connection_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:otc_test/cubits/connection/connection_state.dart';

class MockConnectionCubit extends MockCubit<ConnectionsState>
    implements ConnectionCubit {}

class MockAdvertListCubit extends MockCubit<AdvertListState>
    implements AdvertListCubit {}

void main() {

  late MockConnectionCubit mockConnectionCubit;
  late MockAdvertListCubit mockAdvertListCubit;

  setUpAll(() => APIInitializer().initialize(isMock: true));
  setUp(() {
    mockConnectionCubit = MockConnectionCubit();
    mockAdvertListCubit = MockAdvertListCubit();
  });


  group('Test Advert List functions', () {
    test('description', () {
      expect(mockAdvertListCubit.getTotalPageLimit(), 5);
    });
  });

  tearDown(() {
    mockConnectionCubit.close();
    mockAdvertListCubit.close();
  });
}
