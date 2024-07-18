import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tikiti/Event-tickets.dart';
import 'package:tikiti/add-event.dart';
import 'package:tikiti/login.dart';
import 'package:tikiti/event-summary.dart';
import 'dart:io';

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
        child: Column(
          children: [
            Container(
              width: 360,
              height: 800,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(color: Colors.white),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 236,
                      height: 800,
                      decoration: const BoxDecoration(color: Color(0xFF626262)),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 236,
                      height: 154,
                      decoration: const BoxDecoration(color: Color(0xFFF4F4F4)),
                    ),
                  ),
                  Positioned(
                    left: 74,
                    top: 185,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                      child: const SizedBox(
                        width: 49,
                        child: Text(
                          'Events',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 74,
                    top: 231,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddEvent()),
                        );
                      },
                      child: const SizedBox(
                        width: 98,
                        child: Text(
                          'Create Event',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 74,
                    top: 277,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Ticket()),
                        );
                      },
                      child: const SizedBox(
                        width: 98,
                        child: Text(
                          'Attendees',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 74,
                    top: 323,
                    child: SizedBox(
                      width: 98,
                      child: Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 74,
                    top: 415,
                    child: GestureDetector(
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: const SizedBox(
                        width: 98,
                        child: Text(
                          'LogOut',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 23,
                    top: 178,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Events.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 23,
                    top: 224,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Events.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 23,
                    top: 270,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/People.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 23,
                    top: 316,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Profile.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 23,
                    top: 408,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Logout.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 84,
                    top: 23,
                    child: Container(
                      width: 88,
                      height: 87,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFD9D9D9),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 91,
                    top: 30,
                    child: Container(
                      width: 74,
                      height: 74,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/User.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 91,
                    top: 115,
                    child: Text(
                      'Parody',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                  ),
                ],
              ),
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
            .where('start', isLessThanOrEqualTo: formattedNow) // Events that have started
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
