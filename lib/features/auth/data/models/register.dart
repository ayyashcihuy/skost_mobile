class RegisterAlbum {
  final String? full_name;
  final String? gender;
  final String? email;
  final String? phone;
  final String? occupation;

  const RegisterAlbum({
    required this.full_name,
    required this.gender,
    required this.email,
    required this.phone,
    required this.occupation,
  });

  factory RegisterAlbum.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'full_name': String full_name,
        'gender': String gender,
        'email': String email,
        'phone': String phone,
        'occupation': String occupation,
      } => 
        RegisterAlbum(
          full_name: full_name,
          gender: gender,
          email: email,
          phone: phone,
          occupation: occupation,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }

  Map<String, dynamic> toJson() => {
    'full_name': full_name,
    'gender': gender,
    'email': email,
    'phone': phone,
    'occupation': occupation,
  };
}