
import 'package:otc_test/models/advert_list/advert_list_response.dart';

abstract class AdvertListState {}

class AdvertListInitialState extends AdvertListState {
  @override
  String toString() => 'AdvertListInitialState{}';
}

class AdvertListLoadingState extends AdvertListState {
  @override
  String toString() => 'AdvertListLoadingState{}';
}

class AdvertListErrorState extends AdvertListState {
   final String error;
   AdvertListErrorState(this.error);

  @override
  String toString() => 'AdvertListInitialState{}';
}


class AdvertListLoadedState extends AdvertListState {
  final List<AdvertList> list;
  final bool isLoading;

  AdvertListLoadedState(this.list, this.isLoading);

  @override
  String toString() {
    return 'AdvertListLoadedState{list: $list}';
  }
}

