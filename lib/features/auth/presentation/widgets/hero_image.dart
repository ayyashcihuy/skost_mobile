import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: SlideshowWithOverlay(),
        ),
      ),
    );
  }
}

class SlideshowWithOverlay extends StatelessWidget {
  const SlideshowWithOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: AspectRatio(
          aspectRatio: 396 / 190, // Maintain image aspect ratio
          child: Stack(
            fit: StackFit.expand, // Make children fill the Stack
            children: [
              // Slideshow images
              PageView(
                children: [
                  Image.asset('assets/hero/slider.png', 
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              // Overlay container
              // Align(
              //   alignment: Alignment.centerLeft, // Align text and button to the left
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add padding
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           'Your Headline Here',
              //           style: TextStyle(
              //             fontSize: 24,
              //             fontWeight: FontWeight.bold,
              //             color: Colors.white,
              //             shadows: [
              //               Shadow(
              //                 blurRadius: 4,
              //                 color: Colors.black54,
              //                 offset: Offset(2, 2),
              //               ),
              //             ],
              //           ),
              //         ),
              //         const SizedBox(height: 16), // Gap between text and button
              //         ElevatedButton(
              //           onPressed: () {
              //             // Add your button functionality here
              //           },
              //           style: ElevatedButton.styleFrom(
              //             backgroundColor: Colors.blueAccent,
              //           ),
              //           child: const Text('Click Me'),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
