import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_apps/features/auth/presentation/pages/main/home.dart';

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NavigationExample());
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: labelBehavior,
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: SvgPicture.asset('assets/home/House_blacked.svg',
              width: 25,
              height: 25,
            ),
            icon: SvgPicture.asset('assets/home/House.svg',
              width: 25,
              height: 25,
            ),
            label: 'Beranda',
          ),
          NavigationDestination(
            selectedIcon: SvgPicture.asset('assets/home/CalendarBlank_blacked.svg',
              width: 25,
              height: 25,
            ),
            icon: SvgPicture.asset('assets/home/CalendarBlank.svg',
              width: 25,
              height: 25,
            ),
            label: 'Sewa',
          ),
          NavigationDestination(
            selectedIcon: SvgPicture.asset('assets/home/Ticket_blacked.svg',
              width: 25,
              height: 25,
            ),
            icon: SvgPicture.asset('assets/home/Ticket.svg',
              width: 25,
              height: 25,
            ),
            label: 'Voucher',
          ),
          NavigationDestination(
            selectedIcon: SvgPicture.asset('assets/home/User_blacked.svg',
              width: 25,
              height: 25,
            ),
            icon: SvgPicture.asset('assets/home/User.svg',
              width: 25,
              height: 25,
            ),
            label: 'Profil',
          ),
        ],
      ),
      body: <Widget>[

        /// Home page
        HomeWidget(),


        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                'Sewa page',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
        ),

        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                'Voucher page',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
        ),

        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                'Profile page',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
        ),
      ][currentPageIndex],
    );
  }
}