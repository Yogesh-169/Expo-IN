import 'package:flutter/material.dart';

import 'home1.dart';

class CustomNavigationPanel extends StatefulWidget {
  @override
  _CustomNavigationPanelState createState() => _CustomNavigationPanelState();
}

class _CustomNavigationPanelState extends State<CustomNavigationPanel> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Other content of the page
          Positioned.fill(
            child: Center(
              child: getPage(_selectedIndex),
            ),
          ),
          // Navigation bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(80, 20, 80, 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildIconButton(Icons.home, 0), // Home icon
                        buildIconButton(Icons.search, 1), // Search icon
                        buildIconButton(Icons.person, 2), // Contact icon
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIconButton(IconData icon, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _selectedIndex == index ? Colors.black : Colors.transparent,
        ),
        padding: EdgeInsets.all(20),
        child: Icon(
          icon,
          color: _selectedIndex == index ? Colors.white : Colors.black,
          size: 35,
        ),
      ),
    );
  }

  Widget getPage(int index) {
    switch (index) {
      case 0:
        return MyHomePage();
      case 1:
        return MyHomePage();
      case 2:
        return MyHomePage();
      default:
        return Container(); // Return an empty container for default case
    }
  }
}

