import 'package:app/screens/home_age.dart';
import 'package:app/screens/manage_devices.dart';
import 'package:flutter/material.dart';

class ButtomNavigationBar extends StatefulWidget {
  const ButtomNavigationBar({super.key});

  @override
  State<ButtomNavigationBar> createState() => _ButtomNavigationBarState();
}

class _ButtomNavigationBarState extends State<ButtomNavigationBar> {
  int currentPageIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index){
          setState(() {
            currentPageIndex=index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations:[
          NavigationDestination(icon: Icon(Icons.home), label: ''),
          NavigationDestination(icon: Icon(Icons.window), label: ''),
          NavigationDestination(icon: Icon(Icons.notifications),label: ''),
        ],
      ),
      body:[
        HomePage(),
        Manage(),
        Placeholder(),
        ][currentPageIndex],

    );
  }
}