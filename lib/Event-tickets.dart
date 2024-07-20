import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Add this import for Firestore
import 'package:tikiti/add-event.dart';
import 'package:tikiti/admin-index.dart';
import 'package:tikiti/login.dart';
import 'package:tikiti/profile.dart';



class Ticket extends StatelessWidget {


String ticketTypeSummary(Map<String, dynamic> ticketTypeMap) {
  List<String> parts = [];
  ticketTypeMap.forEach((key, value) {
    parts.add('$key: $value');
  });
  return parts.join(', ');
}
  final String eventId;

  Ticket({required this.eventId});

  @override
  Widget build(BuildContext context) {
    var widget;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events CheckIn'),
        backgroundColor: Colors.grey[700],
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
      body: StreamBuilder(
  stream: FirebaseFirestore.instance
      .collection('tickets')
      .where('event_id', isEqualTo: eventId)
      .snapshots(),
  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    }
    if (snapshot.hasError) {
      return Center(child: Text('Error: ${snapshot.error}'));
    }
    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
      return Center(child: Text('No tickets found for this event.'));
    }

    return Column(
      children: [
        Expanded( // Use Expanded to fill the available space
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('User ID')),
                DataColumn(label: Text('Event ID')),
                DataColumn(label: Text('Event Title')),
                DataColumn(label: Text('Ticket Type')),
                DataColumn(label: Text('Price')),
              ],
              rows: snapshot.data!.docs.map((doc) {
                return DataRow(
                  cells: [
                    DataCell(Text(doc['user_id'] ?? '')),
                    DataCell(Text(doc['event_id'] ?? '')),
                    DataCell(Text(doc['event_title'] ?? '')),
                    DataCell(Text(ticketTypeSummary(doc['ticket_type'] as Map<String, dynamic>) ?? '')),
                    DataCell(Text(doc['price'] ?? '')),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
        // You can add more widgets here that will be laid out vertically
      ],
    );
  },
),
    );
  }
}
