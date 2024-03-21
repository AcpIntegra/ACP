class LoginResponse {
  final String accessToken;
  final String refreshToken;
  final String created;
  final String expires;
  final String applicationName;
  final String userId;
  final String username;
  final String ipAddress;
  final String tokenType;
  final bool active;
  final String legacyEncryption;
  final int expiresIn;
  final String message;

  LoginResponse(
      {required this.accessToken,
      required this.refreshToken,
      required this.created,
      required this.expires,
      required this.applicationName,
      required this.userId,
      required this.username,
      required this.ipAddress,
      required this.tokenType,
      required this.active,
      required this.legacyEncryption,
      required this.expiresIn,
      required this.message});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
      accessToken: json['access_token'] ?? '',
      refreshToken: json['refresh_token'] ?? '',
      created: json['created'] ?? '',
      expires: json['expires'] ?? '',
      applicationName: json['application_name'] ?? '',
      userId: json['user_id'] ?? '',
      username: json['username'] ?? '',
      ipAddress: json['ip_address'] ?? '',
      tokenType: json['token_type'] ?? '',
      active: json['active'] ?? false,
      legacyEncryption: json['legacy_encryption'] ?? '',
      expiresIn: json['expires_in'] ?? 0,
      message: json['Message'] ?? '');

  factory LoginResponse.empty() => LoginResponse(
      accessToken: '',
      refreshToken: '',
      created: '',
      expires: '',
      applicationName: '',
      userId: '',
      username: '',
      ipAddress: '',
      tokenType: '',
      active: false,
      legacyEncryption: '',
      expiresIn: 0,
      message: '');

  Map<String, dynamic> toJson() => {
        'access_token': accessToken,
        'refresh_token': refreshToken,
        'created': created,
        'expires': expires,
        'application_name': applicationName,
        'user_id': userId,
        'username': username,
        'ip_address': ipAddress,
        'token_type': tokenType,
        'active': active,
        'legacy_encryption': legacyEncryption,
        'expires_in': expiresIn,
        'message': message
      };
}
