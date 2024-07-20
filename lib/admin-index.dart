import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tikiti/Event-tickets.dart';
import 'package:tikiti/add-event.dart';
import 'package:tikiti/login.dart';
import 'package:tikiti/event-summary.dart';
import 'dart:io';

import 'package:tikiti/profile.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedTab = 'Live';

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
        backgroundColor: const Color(0xFF706E6E),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Parody"),
              accountEmail: null,
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/User.png"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.event),
              title: Text('Events'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.create),
              title: Text('Create Event'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddEvent()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Attendees'),
              
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('LogOut'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
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
                    padding: const EdgeInsets.symmetric(vertical: 30),
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
                      selectedTab = 'Upcoming';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: selectedTab == 'Upcoming' ? const Color(0xFFFF3E01) : Colors.transparent,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Upcoming',
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
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: selectedTab == 'Past' ? const Color(0xFFFF3E01) : Colors.transparent,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Past',
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

Expanded(
  child: StreamBuilder<QuerySnapshot>(
    
    stream: () {
      DateTime now = DateTime.now();
      // Format the current date to 'yyyy-MM-dd'. This assumes your Firestore 'start' and 'end' dates are stored in this format.
      String formattedNow = DateFormat('yyyy-MM-dd').format(now);

      if (selectedTab == 'Live') {
        // This query filters for events that are currently happening
         return FirebaseFirestore.instance
            .collection('events')
            .where('user_id', isEqualTo: userId)
            .where('start', isEqualTo: formattedNow) // Events that have started
            .where('end', isGreaterThanOrEqualTo: formattedNow) // and have not yet ended
            .snapshots();
      } else if (selectedTab == 'Upcoming') {
        return FirebaseFirestore.instance
            .collection('events')
            .where('user_id', isEqualTo: userId)
            .where('start', isGreaterThan: formattedNow) // Events that will start in the future
            .snapshots();
      } else if (selectedTab == 'Past') {
        return FirebaseFirestore.instance
            .collection('events')
            .where('user_id', isEqualTo: userId)
            .where('end', isLessThanOrEqualTo: formattedNow) // Events that have already ended
            .snapshots();
      } else {
        // Default case, can adjust based on requirements
        return FirebaseFirestore.instance
            .collection('events')
            .where('user_id', isEqualTo: userId)
            .snapshots();
      }
    }(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return const Center(child: Text('Something went wrong'));
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }

      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
        return const Center(child: Text('No events found'));
      }

      return ListView(
        padding: const EdgeInsets.only(top: 80.0, left: 14.0),
        children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EventSummary(eventId: document.id)),
              );
            },
            child: Container(
              width: 360,
              height: 100,
              decoration: const BoxDecoration(color: Color.fromARGB(0, 0, 0, 0)),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    child: data['path'] != null
                        ? Image.file(File(data['path']))
                        : Container(),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['event_title'] ?? 'Default Title',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(data['event_desc'] ?? 'Default Description',
                      style: TextStyle(
                          color: Colors.black,
                        ),),
                      
                      const SizedBox(height: 5),
                      Text(data['start'] ?? 'Default Date',
                      style: TextStyle(
                          color: Colors.black,
                        ),),
                    ],
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          );
        }).toList(),
      );
    },
  ),
),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEvent()),
          );
        },
        backgroundColor: Color.fromARGB(255, 245, 80, 44),
        child: const Icon(Icons.add),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
    );
  }
}
