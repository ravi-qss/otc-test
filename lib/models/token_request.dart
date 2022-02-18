import 'package:flutter_deriv_api/basic_api/request.dart';

// Authorize request class.
class TokenRequest extends Request {
  /// Initialize AuthorizeRequest.
  const TokenRequest({
    required this.authorize,
    int? reqId,
  }) : super(
    msgType: 'authorize',
    reqId: reqId,
  );

  /// Creates an instance from JSON.
  factory TokenRequest.fromJson(Map<String, dynamic> json) =>
      TokenRequest(
        authorize: json['authorize'] as String?,
        reqId: json['req_id'] as int?,
      );

  final String? authorize;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
    'authorize': authorize,
    'req_id': reqId,
  };

  /// Creates a copy of instance with given parameters
  @override
  TokenRequest copyWith({
    String? authorize,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TokenRequest(
        authorize: authorize ?? this.authorize,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
