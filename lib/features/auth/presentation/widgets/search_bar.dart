import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Padding for the widget
      child: Row(
        children: [
          // First Container: Search Button
          Container(
            height: 48,
            width: 48, // 1:1 ratio
            decoration: const BoxDecoration(
              color: Color.fromRGBO(42, 46, 84, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          // Second Container: Search Bar Input
          Expanded(
            child: SizedBox(
              height: 48,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: const TextStyle(fontSize: 15),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none, // No border since we use BoxDecoration
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200], // Background color
                ),
              ),
            ),
          ),
          // Third Container: Notification Button
          Container(
            height: 48,
            width: 48, // 1:1 ratio
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.notifications,
              color: Color.fromRGBO(42, 46, 84, 1),
            ),
          ),
        ],
      ),
    );
  }
}
