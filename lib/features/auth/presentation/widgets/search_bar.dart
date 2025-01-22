import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 64, left: 16, right: 16),
          child: Row(
            children: [
              // Search bar
              Container(
                height: 40, // Match height of TextField
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  color: const Color.fromRGBO(42, 46, 84, 1),
                ),
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: const TextStyle(
                        fontSize: 15
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFDBDBDB), width: 1),
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8.0), // Space between search bar and icon
              Container(
                height: 40, // Match height of TextField
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: const Icon(
                  Icons.notifications,
                  color: Color.fromRGBO(42, 46, 84, 1),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}