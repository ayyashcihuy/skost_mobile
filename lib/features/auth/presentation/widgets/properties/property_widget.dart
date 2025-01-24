import 'package:flutter/material.dart';
import 'package:mobile_apps/features/auth/data/models/property.dart';

class ProductListWidget extends StatelessWidget {
  final List<Property> products;

  const ProductListWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true, // Ensures the list doesn't take extra space
      physics: const NeverScrollableScrollPhysics(), // Prevent scrolling within this widget
      itemCount: products.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16), // Add small spacing between items
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(product: product);
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final Property product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image with labels
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 396 / 200, // Ensures consistent image sizing
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.asset(
                    product.images,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Top-left labels
            ],
          ),
          // Product description
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and address
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product.address,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create labels
  // Widget _buildLabel(String text, Color backgroundColor, {Color textColor = Colors.black}) {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  //     decoration: BoxDecoration(
  //       color: backgroundColor,
  //       borderRadius: BorderRadius.circular(4),
  //     ),
  //     child: Text(
  //       text,
  //       style: TextStyle(
  //         fontSize: 12,
  //         color: textColor,
  //       ),
  //     ),
  //   );
  // }
}
