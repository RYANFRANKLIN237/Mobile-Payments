class PayStackAuthResponse {
  final String authorization_url;
  final String access_code;
  final String reference;

  PayStackAuthResponse(
      {required this.authorization_url,
      required this.access_code,
      required this.reference});

  factory PayStackAuthResponse.fromJson(Map<String, dynamic> json) {
    return PayStackAuthResponse(
        authorization_url: json['authorization_url'],
        reference: json['reference'],
        access_code: json['access_code']);
  }

  Map<String, dynamic> toJson() {
    return {
      'authorization_url': authorization_url,
      'reference': reference,
      'access_code': access_code,
    };
  }
}
