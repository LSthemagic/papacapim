class SessionDto {
  final String userLogin;
  final String token;
  final String ip;

  SessionDto({
    required this.userLogin,
    required this.token,
    required this.ip,
  });

  factory SessionDto.fromJson(Map<String, dynamic> json) {
    return SessionDto(
      userLogin: json['user_login'],
      token: json['token'],
      ip: json['ip'],
    );
  }
}