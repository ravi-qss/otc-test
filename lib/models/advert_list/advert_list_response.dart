import 'package:flutter_deriv_api/basic_api/response.dart';

class AdvertListResponse extends Response {
  String? msgType;
  P2pAdvertList? p2pAdvertList;

  AdvertListResponse({
    this.p2pAdvertList,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  AdvertListResponse.fromJson(Map<String, dynamic> json) {
    msgType = json['msg_type'];
    p2pAdvertList = json['p2p_advert_list'] != null
        ? P2pAdvertList.fromJson(json['p2p_advert_list'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['msg_type'] = this.msgType;
    if (this.p2pAdvertList != null) {
      data['p2p_advert_list'] = this.p2pAdvertList!.toJson();
    }
    return data;
  }
}

class EchoReq {
  String? counterpartyType;
  int? p2pAdvertList;

  EchoReq({this.counterpartyType, this.p2pAdvertList});

  EchoReq.fromJson(Map<String, dynamic> json) {
    counterpartyType = json['counterparty_type'];
    p2pAdvertList = json['p2p_advert_list'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['counterparty_type'] = this.counterpartyType;
    data['p2p_advert_list'] = this.p2pAdvertList;
    return data;
  }
}

class P2pAdvertList {
  List<AdvertList>? list;

  P2pAdvertList({this.list});

  P2pAdvertList.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <AdvertList>[];
      json['list'].forEach((v) {
        list!.add(AdvertList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AdvertList {
  String? accountCurrency;
  AdvertiserDetails? advertiserDetails;
  String? counterpartyType;
  String? country;
  int? createdTime;
  String? description;
  String? id;
  int? isActive;
  int? isVisible;
  String? localCurrency;
  double? maxOrderAmountLimit;
  String? maxOrderAmountLimitDisplay;
  int? minOrderAmountLimit;
  String? minOrderAmountLimitDisplay;
  String? paymentMethod;
  double? price;
  String? priceDisplay;
  double? rate;
  String? rateDisplay;
  String? type;

  AdvertList(
      {this.accountCurrency,
      this.advertiserDetails,
      this.counterpartyType,
      this.country,
      this.createdTime,
      this.description,
      this.id,
      this.isActive,
      this.isVisible,
      this.localCurrency,
      this.maxOrderAmountLimit,
      this.maxOrderAmountLimitDisplay,
      this.minOrderAmountLimit,
      this.minOrderAmountLimitDisplay,
      this.paymentMethod,
      this.price,
      this.priceDisplay,
      this.rate,
      this.rateDisplay,
      this.type});

  AdvertList.fromJson(Map<String, dynamic> json) {
    accountCurrency = json['account_currency'];
    advertiserDetails = json['advertiser_details'] != null
        ? AdvertiserDetails.fromJson(json['advertiser_details'])
        : null;
    counterpartyType = json['counterparty_type'];
    country = json['country'];
    createdTime = json['created_time'];
    description = json['description'];
    id = json['id'];
    isActive = json['is_active'];
    isVisible = json['is_visible'];
    localCurrency = json['local_currency'];
    maxOrderAmountLimit = json['max_order_amount_limit'] != null
        ? json['max_order_amount_limit'].toDouble()
        : 0.0;
    maxOrderAmountLimitDisplay = json['max_order_amount_limit_display'];
    minOrderAmountLimit = json['min_order_amount_limit'];
    minOrderAmountLimitDisplay = json['min_order_amount_limit_display'];
    paymentMethod = json['payment_method'];
    price = json['price'] != null ? json['price'].toDouble() : 0.0;
    priceDisplay = json['price_display'];
    rate = json['rate'] != null ? json['rate'].toDouble() : 0.0;
    rateDisplay = json['rate_display'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['account_currency'] = this.accountCurrency;
    if (this.advertiserDetails != null) {
      data['advertiser_details'] = this.advertiserDetails!.toJson();
    }
    data['counterparty_type'] = this.counterpartyType;
    data['country'] = this.country;
    data['created_time'] = this.createdTime;
    data['description'] = this.description;
    data['id'] = this.id;
    data['is_active'] = this.isActive;
    data['is_visible'] = this.isVisible;
    data['local_currency'] = this.localCurrency;
    data['max_order_amount_limit'] = this.maxOrderAmountLimit;
    data['max_order_amount_limit_display'] = this.maxOrderAmountLimitDisplay;
    data['min_order_amount_limit'] = this.minOrderAmountLimit;
    data['min_order_amount_limit_display'] = this.minOrderAmountLimitDisplay;
    data['payment_method'] = this.paymentMethod;
    data['price'] = this.price;
    data['price_display'] = this.priceDisplay;
    data['rate'] = this.rate;
    data['rate_display'] = this.rateDisplay;
    data['type'] = this.type;
    return data;
  }
}

class AdvertiserDetails {
  int? completedOrdersCount;
  String? firstName;
  String? id;
  String? lastName;
  String? name;
  double? totalCompletionRate;

  AdvertiserDetails(
      {this.completedOrdersCount,
      this.firstName,
      this.id,
      this.lastName,
      this.name,
      this.totalCompletionRate});

  AdvertiserDetails.fromJson(Map<String, dynamic> json) {
    completedOrdersCount = json['completed_orders_count'];
    firstName = json['first_name'];
    id = json['id'];
    lastName = json['last_name'];
    name = json['name'];
    totalCompletionRate = json['total_completion_rate']!= null ?json['total_completion_rate'].toDouble() : 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['completed_orders_count'] = this.completedOrdersCount;
    data['first_name'] = this.firstName;
    data['id'] = this.id;
    data['last_name'] = this.lastName;
    data['name'] = this.name;
    data['total_completion_rate'] = this.totalCompletionRate;
    return data;
  }
}
