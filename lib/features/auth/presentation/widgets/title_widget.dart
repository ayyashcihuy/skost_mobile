import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(title),
        SizedBox(height: 8),
        _titleDescription(description),
      ],
    );
  }
  
  Padding _title(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 20),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontFamily: 'JakartaSans',
          letterSpacing: -0.1
        ),
      ),
    );
  }

  Padding _titleDescription(String description) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 20),
      child: Text(
        description,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontFamily: 'JakartaSans',
          height: 1.5,
          letterSpacing: -0.1
        ),
      ),
    );
  }
}