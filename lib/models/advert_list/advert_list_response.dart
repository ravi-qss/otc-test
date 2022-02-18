import 'package:flutter_deriv_api/basic_api/response.dart';

/// Advert response class to catch the Advert API result
// ignore: must_be_immutable
class AdvertListResponse extends Response {
  @override
  // ignore: overridden_fields
  String? msgType;
  P2pAdvertList? p2pAdvertList;

  AdvertListResponse({
    p2pAdvertList,
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

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['msg_type'] = msgType;
    if (p2pAdvertList != null) {
      data['p2p_advert_list'] = p2pAdvertList!.toJson();
    }
    return data;
  }
}

class EchoReq {
  String? counterpartyType;
  int? p2pAdvertList;

  EchoReq({counterpartyType, p2pAdvertList});

  EchoReq.fromJson(Map<String, dynamic> json) {
    counterpartyType = json['counterparty_type'];
    p2pAdvertList = json['p2p_advert_list'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['counterparty_type'] = counterpartyType;
    data['p2p_advert_list'] = p2pAdvertList;
    return data;
  }
}

class P2pAdvertList {
  List<AdvertList>? list;

  P2pAdvertList({list});

  P2pAdvertList.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <AdvertList>[];
      json['list'].forEach((v) {
        list!.add(AdvertList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
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
      {accountCurrency,
      advertiserDetails,
      counterpartyType,
      country,
      createdTime,
      description,
      id,
      isActive,
      isVisible,
      localCurrency,
      maxOrderAmountLimit,
      maxOrderAmountLimitDisplay,
      minOrderAmountLimit,
      minOrderAmountLimitDisplay,
      paymentMethod,
      price,
      priceDisplay,
      rate,
      rateDisplay,
      type});

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['account_currency'] = accountCurrency;
    if (advertiserDetails != null) {
      data['advertiser_details'] = advertiserDetails!.toJson();
    }
    data['counterparty_type'] = counterpartyType;
    data['country'] = country;
    data['created_time'] = createdTime;
    data['description'] = description;
    data['id'] = id;
    data['is_active'] = isActive;
    data['is_visible'] = isVisible;
    data['local_currency'] = localCurrency;
    data['max_order_amount_limit'] = maxOrderAmountLimit;
    data['max_order_amount_limit_display'] = maxOrderAmountLimitDisplay;
    data['min_order_amount_limit'] = minOrderAmountLimit;
    data['min_order_amount_limit_display'] = minOrderAmountLimitDisplay;
    data['payment_method'] = paymentMethod;
    data['price'] = price;
    data['price_display'] = priceDisplay;
    data['rate'] = rate;
    data['rate_display'] = rateDisplay;
    data['type'] = type;
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
      {completedOrdersCount,
      firstName,
      id,
      lastName,
      name,
      totalCompletionRate});

  AdvertiserDetails.fromJson(Map<String, dynamic> json) {
    completedOrdersCount = json['completed_orders_count'];
    firstName = json['first_name'];
    id = json['id'];
    lastName = json['last_name'];
    name = json['name'];
    totalCompletionRate = json['total_completion_rate'] != null
        ? json['total_completion_rate'].toDouble()
        : 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['completed_orders_count'] = completedOrdersCount;
    data['first_name'] = firstName;
    data['id'] = id;
    data['last_name'] = lastName;
    data['name'] = name;
    data['total_completion_rate'] = totalCompletionRate;
    return data;
  }
}
