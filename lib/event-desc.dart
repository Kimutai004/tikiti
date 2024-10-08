import 'package:flutter/material.dart';
import 'package:tikiti/Event-tickets.dart';
import 'package:tikiti/add-event.dart';
import 'package:tikiti/admin-index.dart';
import 'package:tikiti/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tikiti/profile.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

// Generated by: https://www.figma.com/community/plugin/842128343887142055/
class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
        ]),
      ),
    );
  }
}

class EventDets extends StatelessWidget {

  final TextEditingController _earlyticketscontroller = TextEditingController();
  final TextEditingController _earlypricecontroller = TextEditingController();
  final TextEditingController _regticketscontroller = TextEditingController();
  final TextEditingController _regpricecontroller = TextEditingController();
  final TextEditingController _vipticketscontroller = TextEditingController();
  final TextEditingController _vippricecontroller = TextEditingController();
  final TextEditingController _ticketscontroller = TextEditingController();
  final TextEditingController _onlinecontroller = TextEditingController();
  final TextEditingController _locationcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
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
      body: ListView(
        children: [
          Container(
            width: 360,
            height: 831,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color: Color(0xFFFBFBFB)),
            child: Stack(
              children: [
                Positioned(
                  left: 59,
                  top: 689,
                  child: GestureDetector(
                    onTap: () async {
                      try {
                        // Get a reference to the "events" collection
                        CollectionReference eventsCollection = FirebaseFirestore.instance.collection('events');
                        DocumentReference newEventRef = await eventsCollection.add({
                          'early_tickets': _earlyticketscontroller.text,
                          'early_price': _earlypricecontroller.text,
                          'reg_tickets': _regticketscontroller.text,
                          'reg_price': _regpricecontroller.text,
                          'vip_tickets': _vipticketscontroller.text,
                          'vip_price': _vippricecontroller.text,
                          'no_of_tickets': _ticketscontroller.text,
                          'online_link': _onlinecontroller.text,
                          'location': _locationcontroller.text,
                        });
                        
                        print('Data sent successfully');
                      } catch (e) {
                        print('Error sending data: $e');
                      }
                    },
                    child: Container(
                      width: 274,
                      height: 33,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFD4C00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 62,
                  top: 695,
                  child: SizedBox(
                    width: 200,
                    height: 33,
                    child: Text(
                      'Post',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 31,
                  top: 101,
                  child: Text(
                    'No Of  Tickets',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Kavoon',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 56,
                  top: 128,
                  child: Container(
                    width: 248,
                    height: 42,
                    decoration: const BoxDecoration(
                      color: Color(0xC6F6F6F6),
                      border: Border(
                        bottom: BorderSide(width: 1, color: Color(0xFFFF3D00)),
                      ),
                    ),
                    child: TextField(
                      controller: _ticketscontroller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(color: Colors.black), // Add this line
                    ),
                  ),
                ),
                const Positioned(
                  left: 37,
                  top: 208,
                  child: Text(
                    'Online Link',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Kavoon',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 56,
                  top: 235,
                  child: Container(
                    width: 248,
                    height: 42,
                    decoration: const BoxDecoration(
                      color: Color(0xC6F6F6F6),
                      border: Border(
                        bottom: BorderSide(width: 1, color: Color(0xFFFF3D00)),
                      ),
                    ),
                    child: TextField(
                      controller: _onlinecontroller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintStyle:
                            TextStyle(color: Colors.black), // Add this line
                      ),
                      style: const TextStyle(color: Colors.black), // Add this line
                    ),
                  ),
                ),
                Positioned(
                  left: 56,
                  top: 328,
                  child: Container(
                    width: 248,
                    height: 42,
                    decoration: const BoxDecoration(
                      color: Color(0xC6F6F6F6),
                      border: Border(
                        bottom: BorderSide(width: 1, color: Color(0xFFFF3D00)),
                      ),
                    ),
                    child: TextField(
                      controller: _locationcontroller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {},
                      style: const TextStyle(color: Colors.black), // Add this line
                    ),
                  ),
                ),
                const Positioned(
                  left: 46,
                  top: 301,
                  child: Text(
                    'Location',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Kavoon',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                const Positioned(
                  left: 39,
                  top: 394,
                  child: Text(
                    'Ticket Prices and Seats',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Kavoon',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                const Positioned(
                  left: 53,
                  top: 449,
                  child: Text(
                    'Early Bird',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Kavoon',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 140,
                  top: 436,
                  child: Container(
                    width: 79,
                    height: 42,
                    decoration: const BoxDecoration(
                      color: Color(0xC6F6F6F6),
                      border: Border(
                        bottom: BorderSide(width: 1, color: Color(0xFFFF3D00)),
                      ),
                    ),
                    child: TextField(
                      controller: _earlyticketscontroller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(color: Colors.black), // Add this line
                    ),
                  ),
                ),
                Positioned(
                  left: 247,
                  top: 436,
                  child: Container(
                    width: 79,
                    height: 42,
                    decoration: const BoxDecoration(
                      color: Color(0xC6F6F6F6),
                      border: Border(
                        bottom: BorderSide(width: 1, color: Color(0xFFFF3D00)),
                      ),
                    ),
                    child: TextField(
                      controller: _earlypricecontroller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(color: Colors.black), // Add this line
                    ),
                  ),
                ),
                const Positioned(
                  left: 59,
                  top: 503,
                  child: Text(
                    'Regular',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Kavoon',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 140,
                  top: 490,
                  child: Container(
                    width: 79,
                    height: 42,
                    decoration: const BoxDecoration(
                      color: Color(0xC6F6F6F6),
                      border: Border(
                        bottom: BorderSide(width: 1, color: Color(0xFFFF3D00)),
                      ),
                    ),
                    child: TextField(
                      controller: _regticketscontroller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(color: Colors.black), // Add this line
                    ),
                  ),
                ),
                Positioned(
                  left: 247,
                  top: 490,
                  child: Container(
                    width: 79,
                    height: 42,
                    decoration: const BoxDecoration(
                      color: Color(0xC6F6F6F6),
                      border: Border(
                        bottom: BorderSide(width: 1, color: Color(0xFFFF3D00)),
                      ),
                    ),
                    child: TextField(
                      controller: _regpricecontroller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(color: Colors.black), // Add this line
                    ),
                  ),
                ),
                const Positioned(
                  left: 72,
                  top: 557,
                  child: Text(
                    'VIP',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Kavoon',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 140,
                  top: 544,
                  child: Container(
                    width: 79,
                    height: 42,
                    decoration: const BoxDecoration(
                      color: Color(0xC6F6F6F6),
                      border: Border(
                        bottom: BorderSide(width: 1, color: Color(0xFFFF3D00)),
                      ),
                    ),
                    child: TextField(
                      controller: _vipticketscontroller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 247,
                  top: 544,
                  child: Container(
                    width: 79,
                    height: 42,
                    decoration: const BoxDecoration(
                      color: Color(0xC6F6F6F6),
                      border: Border(
                        bottom: BorderSide(width: 1, color: Color(0xFFFF3D00)),
                      ),
                    ),
                    child: TextField(
                      controller: _vippricecontroller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 250,
                  top: 420,
                  child: Text(
                    'Ticket Price',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Kavoon',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                const Positioned(
                  left: 150,
                  top: 420,
                  child: Text(
                    'No of tickets',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Kavoon',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 37,
                  top: 637,
                  child: Checkbox(
                    value: false,
                    onChanged: (value) {},
                    activeColor: Colors.orange,
                  ),
                ),
                const Positioned(
                  left: 78,
                  top: 643,
                  child: Text(
                    'i Agree With Terms And Conditions',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Kaisei Decol',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
