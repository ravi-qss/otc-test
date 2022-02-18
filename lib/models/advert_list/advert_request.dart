import 'package:flutter_deriv_api/basic_api/request.dart';

class AdvertRequest extends Request {
  const AdvertRequest({
    this.counterpartyType,
    this.limit,
    this.offset,
    this.p2pAdvertList = 1,
    this.sortBy,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'advert_list',
          passthrough: passthrough,
          reqId: reqId,
        );

  factory AdvertRequest.fromJson(Map<String, dynamic> json) => AdvertRequest(
        counterpartyType: json['counterparty_type'] as String?,
        limit: json['limit'] as int?,
        offset: json['offset'] as int?,
        p2pAdvertList: json['p2p_advert_list'] ?? null,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
        sortBy: json['sort_by'] as String?,
      );

  final String? counterpartyType;

  final int? limit;

  final int? offset;

  final int? p2pAdvertList;

  final String? sortBy;

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'counterparty_type': counterpartyType,
        'limit': limit,
        'offset': offset,
        'sort_by': sortBy,
        'p2p_advert_list': p2pAdvertList ?? 1,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  @override
  AdvertRequest copyWith({
    String? counterpartyType,
    int? limit,
    int? offset,
    int? p2pAdvertList,
    String? sortBy,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      AdvertRequest(
        counterpartyType: counterpartyType ?? this.counterpartyType,
        limit: limit ?? this.limit,
        offset: offset ?? this.offset,
        p2pAdvertList: p2pAdvertList ?? this.p2pAdvertList,
        passthrough: passthrough ?? this.passthrough,
        sortBy: sortBy ?? this.sortBy,
        reqId: reqId ?? this.reqId,
      );

  @override
  List<Object?> get props => <Object?>[];
}
