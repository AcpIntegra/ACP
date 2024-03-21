class Login {
  String username;
  String password;
  String clientId;
  String clientSecret;
  GrantType grantType;

  Login(
      {required this.username,
      required this.password,
      required this.clientId,
      required this.clientSecret,
      this.grantType = GrantType.password});

  factory Login.empty() =>
      Login(username: '', password: '', clientId: '', clientSecret: '');

  factory Login.emptyWithClient() => Login(
      username: '',
      password: '',
      clientId: '0C432C2D-3D9F-481B-9184-F4A1DA6EEA77',
      clientSecret: '317C368C-A6C3-4DC8-AA9D-3F25E602313A');

  factory Login.fromJson(Map<String, dynamic> json) => Login(
      username: json['username'],
      password: json['password'],
      clientId: json['client_id'],
      clientSecret: json['client_secret'],
      grantType: json['grant_type'] == GrantType.password
          ? GrantType.password
          : GrantType.other);

  Map<String, dynamic> toMap() => {
        "client_id": clientId,
        "client_secret": clientSecret,
        "grant_type": grantType.name,
        "password": password,
        "username": username,
      };
}

enum GrantType {
  password('password'),
  other('other');

  const GrantType(this.name);
  final String name;
}
