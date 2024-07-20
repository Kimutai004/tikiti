import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tikiti/index.dart' as tikiti;
import 'package:tikiti/profile.dart';
import 'dart:io';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tikiti/search.dart';

class Tickets extends StatefulWidget {
  @override
  _TicketsState createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  int _selectedIndex = 2;
  String selectedTab = 'Live';

  static List<Widget> _widgetOptions = <Widget>[
    tikiti.Index(),
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

  DateTime parseEventDate(String dateString) {
  try {
    // Try parsing with the expected format
    return DateFormat('yyyy-MM-ddTHH:mm:ss').parse(dateString);
  } catch (e) {
    try {
      // Fallback for another format, e.g., 'yyyy-MM-dd'
      return DateFormat('yyyy-MM-dd').parse(dateString);
    } catch (e) {
      // Handle or throw a custom error if parsing fails
      throw FormatException('Invalid date format: $dateString');
    }
  }
}

  bool isLive(String eventDateStr, String eventTimeStr) {
    DateTime now = DateTime.now();
    DateTime startDate = parseEventDate(eventDateStr);
    DateTime endDate = parseEventDate(eventTimeStr);
    return now.isAfter(startDate) && now.isBefore(endDate);
  }

  bool isPast(String eventTimeStr) {
    DateTime now = DateTime.now();
    DateTime endDate = parseEventDate(eventTimeStr);
    return now.isAfter(endDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tickets'),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTab = 'Live';
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 2,
                                color: selectedTab == 'Live' ? const Color(0xFFFF3E01) : Colors.transparent,
                              ),
                            ),
                          ),
                          child: const Text(
                            'Live',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTab = 'Past';
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 2,
                                color: selectedTab == 'Past' ? const Color(0xFFFF3E01) : Colors.transparent,
                              ),
                            ),
                          ),
                          child: const Text(
                            'Past Tickets',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
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
                    var filteredDocs = snapshot.data!.docs.where((doc) {
                      String eventDateStr = doc['event_date'];
                      String eventTimeStr = doc['event_time'];
                      return selectedTab == 'Live' ? isLive(eventDateStr, eventTimeStr) : isPast(eventTimeStr);
                    }).toList();

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: filteredDocs.length,
                      itemBuilder: (BuildContext context, int index) {
                        DocumentSnapshot event = filteredDocs[index];
                        String eventPoster = event['event_poster'] ?? '';
                        String eventTitle = event['event_title'] ?? 'Untitled Event';
                        String price = event['price'] ?? '0.00';
                        String ticketType = (event['ticket_type'] is Map)
                            ? (event['ticket_type'] as Map<String, dynamic>).keys.join(', ')
                            : 'Unknown';

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
                                        eventPoster.isNotEmpty
                                            ? Image.file(File(eventPoster))
                                            : SizedBox.shrink(),
                                        Text('Price: $price'),
                                        Text('Type: $ticketType'),
                                        Container(
                                          width: 200.0,
                                          height: 200.0,
                                          child: QrImageView(
                                            data: event['qr_token'] ?? '',
                                            version: QrVersions.auto,
                                            size: 200.0,
                                            foregroundColor: Color.fromARGB(255, 255, 255, 255),
                                          ),
                                        ),
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
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                            child: Row(
                              children: [
                                Container(
                                  width: 107,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    image: eventPoster.isNotEmpty
                                        ? DecorationImage(
                                            image: FileImage(File(eventPoster)),
                                            fit: BoxFit.cover,
                                          )
                                        : null,
                                    color: eventPoster.isEmpty ? Colors.grey : null,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                            ),
                          ),
                        );
                      },
                    );
                  },
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
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        backgroundColor: Colors.grey[200],
      ),
      backgroundColor: Colors.white,
    );
  }
}