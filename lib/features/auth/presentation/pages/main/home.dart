import 'package:flutter/material.dart';
import 'package:mobile_apps/features/auth/presentation/widgets/hero_image.dart';
import 'package:mobile_apps/features/auth/presentation/widgets/properties/property_list.dart';
import 'package:mobile_apps/features/auth/presentation/widgets/search_bar.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const SearchBarWidget(),
            // const SizedBox(height: 20),
            const SlideshowWithOverlay(),
            const SizedBox(height: 10),
            PropertyList(),
          ],
        ),
      ),
    );
  }
}