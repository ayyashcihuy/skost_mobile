class OtpSubmissionAlbum {
  final String? email;
  final String? otp;
  final String? password;

  const OtpSubmissionAlbum({
    required this.email,
    required this.otp,
    this.password,
  });

  factory OtpSubmissionAlbum.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'email': String email,
        'otp': String otp,
        'password': String? password,
      } => 
        OtpSubmissionAlbum(
          email: email,
          otp: otp,
          password: password,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }

  Map<String, dynamic> toJson() => {
    'email': email,
    'otp': otp,
    'password': password,
  };
}