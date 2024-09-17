import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tikiti/event-dets.dart';
import 'package:tikiti/profile.dart';
import 'package:tikiti/search.dart';
import 'package:tikiti/tickets.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _selectedIndex = 0; // Default index of first screen

  static List<Widget> _widgetOptions = <Widget>[
    Index(), // Assuming Home() is your home page widget
    Search(),
    Tickets(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _widgetOptions[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: 360,
            height: 800,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
                StreamBuilder<QuerySnapshot>(
  stream: FirebaseFirestore.instance.collection('events').snapshots(),
  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasError) {
      return const Text('Something went wrong');
    }

    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Text("Loading");
    }

    return ListView(
      padding: const EdgeInsets.only(top: 80.0, left: 14.0),
      children: snapshot.data!.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EventDescription(eventId: document.id)),
            );
          },
          child: Container(
            width: 360,
            height: 100,
            decoration: const BoxDecoration(color: Color.fromARGB(0, 0, 0, 0)),
            margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
            child: Row(
              children: <Widget>[
                Container(
                  width: 156,
                  height: 100,
                  child: data['path'] != null ? Image.file(
                                File(data['path']),
                                width: 156,
                                height: 100,
                                fit: BoxFit.fill,
                              ) : Container(
                    
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: Colors.black.withOpacity(0.23999999463558197),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10), // Spacing between image and text
                Expanded( // Use Expanded to ensure the column takes the remaining space
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['event_title'] ?? 'Default Title',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16, // Increased font size
                        ),
                      ),
                      const SizedBox(height: 5), // Spacing between title and description
                      Text(
                        data['event_desc'] ?? 'Default Description',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14, // Increased font size
                        ),
                      ),
                      const SizedBox(height: 5), // Spacing between description and date
                      Text(
                        data['start'] ?? 'Default Date',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12, // Increased font size
                        ),
                      ),
                    ],
                  ),
                ),
                // Icons laid out horizontally
                Row(
                  children: [
                    Image.asset("assets/Share.png", width: 20, height: 20),
                    const SizedBox(width: 10), // Spacing between icons
                    Image.asset("assets/Favorite.png", width: 20, height: 20),
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  },
),
                Positioned(
                  left: 78,
                  top: 12,
                  child: Container(
                    width: 255,
                    height: 26,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: Colors.black.withOpacity(0.23999999463558197),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 113,
                  top: 19,
                  child: Text(
                    'Search events',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w300,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 90,
                  top: 19,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Search.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 24,
                  top: 8,
                  child: Container(
                    width: 33,
                    height: 33,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Tikiti.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 24,
                  top: 63,
                  child: SizedBox(
                    width: 156,
                    height: 34,
                    child: Text(
                      'Events Near You',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Kavoon',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 144,
                  top: 481,
                  child: Text(
                    'View More',
                    style: TextStyle(
                      color: Color(0xFF1CA2F9),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
                
                Positioned(
                  left: 135,
                  top: 672,
                  child: Container(
                    width: 129,
                    height: 39,
                    decoration: BoxDecoration(
                      color: const Color(0x7CD9D9D9),
                      borderRadius: BorderRadius.circular(5),
                      border: const Border(
                        left: BorderSide(width: 3, color: Color(0xFFFF3D00)),
                        top: BorderSide(color: Color(0xFFFF3D00)),
                        right: BorderSide(color: Color(0xFFFF3D00)),
                        bottom: BorderSide(color: Color(0xFFFF3D00)),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 135,
                  top: 680,
                  child: SizedBox(
                    width: 129,
                    height: 39,
                    child: Text(
                      'Kiambu',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 230,
                  top: 677,
                  child: Container(
                    width: 25,
                    height: 29,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Location (1).png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
       bottomNavigationBar: BottomNavigationBar(
  items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: ImageIcon(AssetImage("assets/Home.png")),
      
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(AssetImage("assets/Search.png")),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(AssetImage("assets/Ticket.png")),
      label: 'Tickets',
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(AssetImage("assets/Account.png")),
      label: 'Profile',
    ),
  ],
  currentIndex: _selectedIndex,
  selectedItemColor: const Color.fromARGB(255, 255, 64, 0),
  unselectedItemColor: Colors.grey, // Ensure unselected items are visible
  onTap: _onItemTapped,
  backgroundColor: Colors.grey[200], // Set to a greyish tone
),
    );
  }
}
