import 'package:flutter/material.dart';
import 'package:mobile_apps/features/auth/data/models/property.dart';
import 'package:mobile_apps/features/auth/presentation/widgets/properties/property_widget.dart';

// ignore: use_key_in_widget_constructors
class PropertyList extends StatelessWidget {
  final List<Property> products = [
    Property(
      name: "Apartemen",
      address: "Jalan Raya",
      descriptions: "Apartemen",
      images: "assets/hero/dummy.png",
      created_at: DateTime.now(),
      updated_at: DateTime.now(),
    ),
    Property(
      name: "Apartemen",
      address: "Jalan Raya",
      descriptions: "Apartemen",
      images: "assets/hero/dummy.png",
      created_at: DateTime.now(),
      updated_at: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Row
          Row(
            children: const [
              Text(
                "Pilihan Untukmu",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8), // Space between text and icon
              Icon(Icons.local_fire_department, color: Colors.orange),
            ],
          ),
          // Reduce the gap here
          const SizedBox(height: 0), // Control the spacing explicitly

          // Product List Widget
          ProductListWidget(products: products),
        ],
      ),
    );
  }
}
