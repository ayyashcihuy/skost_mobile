class Property {
  final String name;
  final String address;
  final String descriptions;
  final String images;
  final DateTime created_at;
  final DateTime updated_at;

  const Property({
    required this.name,
    required this.address,
    required this.descriptions,
    required this.images,
    required this.created_at,
    required this.updated_at,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'name': String name,
        'address': String address,
        'descriptions': String descriptions,
        'images': String images,
        'created_at': DateTime created_at,
        'updated_at': DateTime updated_at,
      } => 
        Property(
          name: name,
          address: address,
          descriptions: descriptions,
          images: images,
          created_at: created_at,
          updated_at: updated_at,
        ),
      _ => throw const FormatException('Failed to load property.'),
    };
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'address': address,
    'descriptions': descriptions,
    'images': images,
    'created_at': created_at,
    'updated_at': updated_at,
  };
}