import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(30, 60, 30, 10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 55, top: 10),
                          child: Text(
                            'Find a new',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 25, top: 10, bottom: 4),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Icon(Icons.search, size: 50),
                            ),
                          ),
                          onChanged: (value) {
                            // Handle search input changes
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          CustomNavigationPanel(
            selectedIndex: _selectedIndex,
            onIndexChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.vertical, // Changed to vertical scrolling
              children: [
                buildCard('Restaurant 1', 'assets/restaurant1.jpg'),
                buildCard('Restaurant 2', 'assets/restaurant2.jpg'),
                buildCard('Restaurant 3', 'assets/restaurant3.jpg'),
                buildCard('Restaurant 4', 'assets/restaurant4.jpg'),
                // Add more cards as needed
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(String title, String imageUrl) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              imageUrl,
              width: double.infinity, // Adjusted to fill the card width
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomNavigationPanel extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onIndexChanged;

  CustomNavigationPanel({
    required this.selectedIndex,
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildIconButton(Icons.computer, 'Technology', 0),
          buildIconButton(Icons.build, 'Manufacturing', 1),
          buildIconButton(Icons.healing, 'HealthCare', 2),
          buildIconButton(Icons.rocket, 'Healthcare', 3),
        ],
      ),
    );
  }

  Widget buildIconButton(IconData icon, String text, int index) {
    return GestureDetector(
      onTap: () {
        onIndexChanged(index);
      },
      child: Column(
        children: [
          Icon(
            icon,
            color: selectedIndex == index ? Colors.black : Colors.grey,
            size: 35,
          ),
          SizedBox(height: 4),
          Text(
            text,
            style: TextStyle(
              color: selectedIndex == index ? Colors.black : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Container(
            height: 2,
            width: 30,
            color: selectedIndex == index ? Colors.black : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
