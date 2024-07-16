import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tikiti/index.dart' as tikiti;
import 'package:tikiti/profile.dart';
import 'dart:io';
import 'package:tikiti/search.dart';

class Tickets extends StatefulWidget {
  @override
  _TicketsState createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {

  int _selectedIndex = 2; // Default index of first screen

  static List<Widget> _widgetOptions = <Widget>[
    tikiti.Index(), // Assuming Home() is your home page widget
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
  final userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tickets'),
      ),
      body: ListView(
        children: [
          Container(
            width: 360,
            height: 800,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
                const Positioned(
                  left: 60,
                  top: 29,
                  child: Text(
                    'Upcoming',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFF3D00),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                const Positioned(
                  left: 204,
                  top: 29,
                  child: Text(
                    'Past Tickets',
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
                Positioned(
                  left: 38,
                  top: 59,
                  child: Container(
                    width: 111.02,
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFFFF3D00),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 24,
                  top: 78,
                  child: Container(
                    width: 324,
                    height: 75,
                    decoration: const BoxDecoration(color: Color(0xFFF5F4F4)),
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
            .collection('tickets')
            .where('user_id', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
            .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No tickets found'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
            DocumentSnapshot event = snapshot.data!.docs[index];

            // Extracting fields with default values
            String eventPoster = event['event_poster'] ?? '';
            String eventTitle = event['event_title'] ?? 'Untitled Event';
            String price = event['price'] ?? '0.00';
            
            // Check if ticketType is a map or a string
            String ticketType;
            if (event['ticket_type'] is Map) {
              ticketType = (event['ticket_type'] as Map<String, dynamic>).keys.join(', ');
            } else {
              ticketType = event['ticket_type'] ?? 'Unknown';
            }

            return GestureDetector(
              onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(eventTitle),
                  content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                    // Check if eventPoster is not empty and display the image from a file
          eventPoster.isNotEmpty
            ? Image.file(File(eventPoster))
            : SizedBox.shrink(),
          Text('Price: $price'),
          Text('Type: $ticketType'),
                    // display qr code
                    ],
                  ),
                  ),
                  actions: <Widget>[
                  TextButton(
                    child: Text('Close'),
                    onPressed: () {
                    Navigator.of(context).pop();
                    },
                  ),
                  ],
                );
                },
              );
              },
              child: Padding(
              padding: EdgeInsets.only(top: 10, left: 24, right: 24),
              child: 
        Row(
          children: [
          // Image container
          Container(
            width: 107,
            height: 75,
            decoration: BoxDecoration(
            image: eventPoster.isNotEmpty
              ? DecorationImage(
                image: FileImage(File(eventPoster)),
                fit: BoxFit.cover, // Ensure the image covers the box
                )
              : null,
            color: eventPoster.isEmpty ? Colors.grey : null,
            ),
          ),
          // Spacer or SizedBox can be used to create some space between the image and text
          SizedBox(width: 8),
          // Texts container
          Expanded( // Use Expanded to ensure the column takes the rest of the space
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start (left)
            mainAxisAlignment: MainAxisAlignment.center, // Center the column
            children: [
              Text(
              eventTitle,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Kavoon',
                fontWeight: FontWeight.w400,
                height: 1.0,
              ),
              ),
              SizedBox(height: 4),
              Text(
              'Price: $price',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 1.0,
              ),
              ),
              SizedBox(height: 4),
              Text(
              'Type: $ticketType',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 1.0,
              ),
              ),
            ],
            ),
          ),
          ],
        )
              ),
            );
            },
          );
          },
        )

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