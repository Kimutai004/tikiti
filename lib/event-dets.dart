import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class EventDescription extends StatefulWidget {
  final String eventId;

  EventDescription({required this.eventId});

  @override
  _EventDescriptionState createState() => _EventDescriptionState();
}

class _EventDescriptionState extends State<EventDescription> {
  int _counter = 0;
  int _regcounter = 0;
  int _vipcounter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _increaseCounter() {
    setState(() {
      _regcounter++;
    });
  }

  void _incCounter() {
    setState(() {
      _vipcounter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  void _decreaseCounter() {
    setState(() {
      if (_regcounter > 0) {
        _regcounter--;
      }
    });
  }

  void _decCounter() {
    setState(() {
      if (_vipcounter > 0) {
        _vipcounter--;
      }
    });
  }

  Future<LatLng> _getLocationCoordinates(String locationName) async {
  try {
    List<Location> locations = await locationFromAddress(locationName);
    if (locations.isNotEmpty) {
      return LatLng(locations.first.latitude, locations.first.longitude);
    } else {
      print('No location found for: $locationName');
      // Return default coordinates or handle as appropriate
      return const LatLng(0.0, 0.0); // Default coordinates if fetching fails
    }
  } catch (e) {
    print('Error fetching location: $e');
    // Return default coordinates or handle as appropriate
    return const LatLng(0.0, 0.0); // Default coordinates if fetching fails
  }
}

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Description'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              .collection('events')
              .doc(widget.eventId)
              .get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            
            final event = snapshot.data!.data() as Map<String, dynamic>;
            


            return ListView(
              children: [
                Container(
                  width: 360,
                  height: 1012,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 18,
                        top: 10,
                        child: event['path'] != null
                            ? Image.file(
                                File(event['path']),
                                width: 350,
                                height: 200,
                                fit: BoxFit.fill,
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      event['path'] ?? 'No Image Available',
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                      ),
                      Positioned(
                        left: 18,
                        top: 224,
                        child: Text(
                          event['event_title'] ??
                              'No Title', //replace with event_tittle from firestore
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Kavoon',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 18,
                        top: 255,
                        child: Container(
                          width: 302,
                          height: 167,
                          decoration:
                              const BoxDecoration(color: Color(0x19D9D9D9)),
                        ),
                      ),
                      const Positioned(
                        left: 189,
                        top: 293,
                        child: Text(
                          'Event Type:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 6,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 65,
                        top: 289,
                        child: Text(
                          event['online'] != null ? 'Online' : 'Physical',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 65,
                        top: 324,
                        child: Text(
                          'Refund Policy',
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
                        left: 40,
                        top: 350,
                        child: SizedBox(
                          width: 293,
                          height: 80,
                          child: Text(
                            event['event_desc'] ??
                                'No Description', //replace with event_desc from firestore
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
                        left: 38,
                        top: 954,
                        child: GestureDetector(
                          onTap: () {
                            // Generate QR code
                            // Post ticket details to Cloud Firestore
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
                            child: Center(
                              child: Text(
                                'Buy Tickets',
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
                        ),
                      ),
                      const Positioned(
                        left: 28,
                        top: 697,
                        child: Text(
                          'Ticket Details',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Kavoon',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 27,
                        top: 441,
                        child: Text(
                          'Location',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Kavoon',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 28,
                        top: 752,
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
                      const Positioned(
                        left: 27,
                        top: 798,
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
                      const Positioned(
                        left: 38,
                        top: 846,
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
                        left: 112,
                        top: 752,
                        child: Text(
                          event['early_price'] ?? 'N/A',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Katibeh',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 111,
                        top: 845,
                        child: Text(
                          event['vip_price'] ?? 'N/A',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Katibeh',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 111,
                        top: 800,
                        child: Text(
                          event['reg_price'] ?? 'N/A',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Katibeh',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 183,
                        top: 745,
                        child: GestureDetector(
                          onTap: _decrementCounter, // Decrease counter on tap
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/Minus (1).png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 236,
                        top: 747,
                        child: Text(
                          '$_counter', // Display current counter value
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 283,
                        top: 745,
                        child: GestureDetector(
                          onTap: _incrementCounter, // Increase counter on tap
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/Add (1).png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 183,
                        top: 839,
                        child: GestureDetector(
                          onTap: _decCounter, // Decrease counter on tap
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/Minus (1).png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 236,
                        top: 842,
                        child: Text(
                          '$_vipcounter', // Display current counter value
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 283,
                        top: 839,
                        child: GestureDetector(
                          onTap: _incCounter, // Increase counter on tap
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/Add (1).png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 183,
                        top: 791,
                        child: GestureDetector(
                          onTap: _decreaseCounter, // Decrease counter on tap
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/Minus (1).png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 236,
                        top: 791,
                        child: Text(
                          '$_regcounter', // Display current counter value
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 283,
                        top: 791,
                        child: GestureDetector(
                          onTap: _increaseCounter, // Increase counter on tap
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/Add (1).png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 39,
                        top: 908,
                        child: Text(
                          'Total Cost',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
  left: 198,
  top: 910,
  child: SizedBox(
    width: 122,
    height: 22,
    child: Text(
      'Ksh ${event['early_price'] * _counter + event['reg_price'] * _regcounter + event['vip_price'] * _vipcounter}',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        height: 1.0,
      ),
    ),
  ),
),

                      Positioned(
                        left: 28,
                        top: 904,
                        child: Transform(
                          transform: Matrix4.identity()
                            ..translate(0.0, 0.0)
                            ..rotateZ(1.57),
                          child: Container(
                            width: 31.02,
                            decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 4,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0xFFFF3D00),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 30,
                        top: 261,
                        child: Text(
                          event['start']?.toString() ?? 'No Date Provided',
                          style: TextStyle(
                            color: Color(0xFFFF3D00),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 22,
                        top: 272,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/Attendance.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 27,
                        top: 315,
                        child: Container(
                          width: 26,
                          height: 33,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/US Dollar.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      // GoogleMap widget to display location
                      Positioned(
                        left: 22,
                        top: 482,
                        child: Container(
                          width: 303,
                          height: 199,
                          child: FutureBuilder<LatLng>(
                            future: event['location'] != null ? _getLocationCoordinates(event['location']) : null,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Center(child: CircularProgressIndicator());
                              }

                              if (snapshot.hasError) {
                                return Center(child: Text('Error: ${snapshot.error}'));
                              }

                              LatLng? location = snapshot.data;

                              return GoogleMap(
                                initialCameraPosition: CameraPosition(
                                  target: location ?? LatLng(0.0, 0.0), // Default to (0.0, 0.0) if location is null
                                  zoom: 15, // Adjust zoom level as needed
                                ),
                                markers: Set<Marker>.of([
                                  Marker(
                                    markerId: MarkerId('event_location'),
                                    position: location ?? LatLng(0.0, 0.0), // Default to (0.0, 0.0) if location is null
                                    infoWindow: InfoWindow(
                                      title: 'Event Location',
                                    ),
                                  ),
                                ]),
                              );
                            },
                          ),
                        ),
                      ),

                      const Positioned(
                        left: 230,
                        top: 293,
                        child: SizedBox(
                          width: 72,
                          height: 7,
                          child: Text(
                            'Party or social Gathering',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 6,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 301,
                        top: 10,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 248,
                        top: 10,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 256,
                        top: 18,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/Share.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 309,
                        top: 18,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/Favorite.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
