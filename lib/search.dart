import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tikiti/index.dart' as tikiti;
import 'package:tikiti/tickets.dart';
import 'package:tikiti/profile.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int _selectedIndex = 1; // Default index of first screen

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

  // Fetch events from Firestore
  Future<List<DocumentSnapshot>> fetchEvents() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('events').get();
    return querySnapshot.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List<DocumentSnapshot>>(
        future: fetchEvents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return Center(child: Text('No events found.'));
          } else {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30, left: 15, right: 15),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search for events',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 63, 63, 63)),
                            prefixIcon: Icon(Icons.search),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.filter_list),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var event =
                          snapshot.data![index].data() as Map<String, dynamic>;

                      return Card(
                          color: Colors
                              .white, // Set card background color to white
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  width: 4,
                                  color: Color(0xFFFF3D00),
                                ),
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 135,
                                    decoration: BoxDecoration(
                                      image: event['image'] != null
                                          ? DecorationImage(
                                              image:
                                                  NetworkImage(event['image']),
                                              fit: BoxFit.fill,
                                            )
                                          : const DecorationImage(
                                              image: AssetImage(
                                                  "assets/Rectangle 97.png"),
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    event['event_title'] ?? 'No title',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    event['start'] ?? 'No date provided',
                                    style: const TextStyle(
                                      color: Color(0xFFFF3D00),
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    event['location'] ??
                                        'Location not provided',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ));
                    },
                  ),
                ),
              ],
            );
          }
        },
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
        selectedItemColor: const Color.fromARGB(255, 255, 68, 0),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}
