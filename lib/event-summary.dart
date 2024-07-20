import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tikiti/Event-tickets.dart';
import 'package:tikiti/add-event.dart';
import 'package:tikiti/admin-index.dart';
import 'package:tikiti/login.dart';
import 'package:tikiti/profile.dart';

class EventSummary extends StatefulWidget {
  final String eventId;

  EventSummary({required this.eventId});


  @override
  EventSummaryState createState() => EventSummaryState();
}

class EventSummaryState extends State<EventSummary> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Events Summary'),
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
              height: 800,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(color: Colors.white),
              child: Stack(
                children: [
                  Positioned(
  left: 50,
  top: 100,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 50,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                width: 50,
                height: 150 - 50, // Adjust the height to match the bar's height
                decoration: BoxDecoration(
                  color: Colors.transparent, // Transparent so only the bar's top part is visible
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'Early Bird',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 50,
                margin: EdgeInsets.only(left: 50),
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                width: 50,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'Regular',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 50,
                margin: EdgeInsets.only(left: 50),
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'VIP',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    ],
  ),
),

                  Positioned(
                    left: 14,
                    top: 294,
                    child: Container(
                      width: 335,
                      height: 91,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF4F4F4),
                        border: Border(
                          left: BorderSide(width: 4, color: Color(0xFFFF3D00)),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 12,
                    top: 398,
                    child: Container(
                      width: 335,
                      height: 53,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF4F4F4),
                        border: Border(
                          left: BorderSide(width: 4, color: Color(0xFFFF3D00)),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 12,
                    top: 464,
                    child: Container(
                      width: 334,
                      height: 327,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF9F9F9),
                        border: Border(
                          left: BorderSide(width: 4, color: Color(0xFFFF3D00)),
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 37,
                    top: 314,
                    child: Text(
                      'Amount Collected',
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
                    left: 37,
                    top: 348,
                    child: Text(
                      'Amount Payable',
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
                    left: 38,
                    top: 502,
                    child: Text(
                      'Close Ticket Sales',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                        height: 0,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 52,
                    top: 548,
                    child: Container(
                      width: 253,
                      height: 44,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF1F1F1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 52,
                    top: 606,
                    child: Container(
                      width: 253,
                      height: 44,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF1F1F1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 52,
                    top: 666,
                    child: Container(
                      width: 253,
                      height: 44,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF1F1F1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 233,
                    top: 666,
                    child: Container(
                      width: 72,
                      height: 44,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFD4C00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 233,
                    top: 604,
                    child: Container(
                      width: 72,
                      height: 44,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFD4C00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 233,
                    top: 548,
                    child: Container(
                      width: 72,
                      height: 44,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFD4C00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 72,
                    top: 562,
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
                    left: 78,
                    top: 623,
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
                    left: 91,
                    top: 679,
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
  left: 203,
  top: 314,
  child: FutureBuilder<QuerySnapshot>(
    future: FirebaseFirestore.instance
        .collection('tickets')
        .where('event_id', isEqualTo: widget.eventId)
        .get(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return SizedBox(width: 50, height: 50, child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Text('Error');
      } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
        var totalAmountPaid = 0.0;
        for (var doc in snapshot.data!.docs) {
          var data = doc.data() as Map<String, dynamic>; // Ensure data() is correctly used
          var price = double.tryParse(data['price']?.toString() ?? '0') ?? 0.0;
          totalAmountPaid += price;
        }
        return Text(
          'Ksh ${totalAmountPaid.toStringAsFixed(2)}',
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 1, // Ensure height is reasonable for visibility
          ),
        );
      } else {
        return Text('No data available');
      }
    },
  ),
),

                    Positioned(
                    left: 203,
                    top: 348,
                    child: FutureBuilder<QuerySnapshot>(
                      future: FirebaseFirestore.instance
                        .collection('tickets')
                        .where('event_id', isEqualTo: widget.eventId)
                        .get(),
                      builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error');
                      } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                        var totalAmountPaid = 0.0;
                        for (var doc in snapshot.data!.docs) {
                        var data = doc.data() as Map<String, dynamic>;
                        var price = double.tryParse(data['price']?.toString() ?? '0') ?? 0.0;
                        totalAmountPaid += price;
                        }
                        var amount = totalAmountPaid * 0.9;
                        return Text(
                        'Ksh ${amount.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                        );
                      } else {
                        return Text('No data available');
                      }
                      },
                    ),
                    ),
                  const Positioned(
                    left: 236,
                    top: 553,
                    child: SizedBox(
                      width: 69,
                      height: 33,
                      child: Text(
                        'Close',
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
                    left: 236,
                    top: 671,
                    child: SizedBox(
                      width: 69,
                      height: 33,
                      child: Text(
                        'Close',
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
                    left: 236,
                    top: 609,
                    child: SizedBox(
                      width: 69,
                      height: 33,
                      child: Text(
                        'Close',
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
                  Positioned(
                    left: 32,
                    top: 418,
                    child: GestureDetector(
                      onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => Ticket(eventId: widget.eventId),
                        ),
                      );
                      },
                      child: Text(
                      'Tickets and Check IN',
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
                    left: 284,
                    top: 410,
                    child: Container(
                      width: 42,
                      height: 31,
                      decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:
                          AssetImage("assets/More Than.png"),
                        fit: BoxFit.contain,
                      ),
                      ),
                    ),
                    ),
                  Positioned(
                    left: 0,
                    top: 63,
                    child: Container(
                      width: 363,
                      height: 219,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 35.32,
                            top: 180.67,
                            child: Container(
                              height: 32.32,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 38.45,
                                    top: 0,
                                    child: Container(
                                      width: 248.07,
                                      height: 32.32,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                              width: 4.35,
                                              height: 32.32,
                                              child: const Stack(
                                                children: [
                                                  Positioned(
                                                    left: 0,
                                                    top: 15.90,
                                                    child: SizedBox(
                                                      width: 4.35,
                                                      height: 16.42,
                                                      child: Text(
                                                        '0',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontFamily: 'Inter',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 81.78,
                                            top: 0,
                                            child: Container(
                                              width: 3.26,
                                              height: 32.32,
                                              child: const Stack(
                                                children: [
                                                  Positioned(
                                                    left: 0,
                                                    top: 15.90,
                                                    child: SizedBox(
                                                      width: 3.26,
                                                      height: 16.42,
                                                      child: Text(
                                                        '1',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontFamily: 'Inter',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 162.48,
                                            top: 0,
                                            child: Container(
                                              width: 4.35,
                                              height: 32.32,
                                              child: const Stack(
                                                children: [
                                                  Positioned(
                                                    left: 0,
                                                    top: 15.90,
                                                    child: SizedBox(
                                                      width: 4.35,
                                                      height: 16.42,
                                                      child: Text(
                                                        '2',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontFamily: 'Inter',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 243.72,
                                            top: 0,
                                            child: Container(
                                              width: 4.35,
                                              height: 32.32,
                                              child: const Stack(
                                                children: [
                                                  Positioned(
                                                    left: 0,
                                                    top: 15.90,
                                                    child: SizedBox(
                                                      width: 4.35,
                                                      height: 16.42,
                                                      child: Text(
                                                        '3',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontFamily: 'Inter',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 13.59,
                            top: 1.60,
                            child: Container(
                              width: 21.74,
                              height: 187.03,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 21.74,
                                      height: 187.03,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 11.41,
                                            top: 170.60,
                                            child: Container(
                                              width: 10.32,
                                              height: 16.42,
                                              child: const Stack(
                                                children: [
                                                  Positioned(
                                                    left: 0,
                                                    top: 0,
                                                    child: SizedBox(
                                                      width: 4.35,
                                                      height: 16.42,
                                                      child: Text(
                                                        '0',
                                                        textAlign:
                                                            TextAlign.right,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontFamily: 'Inter',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 3.26,
                                            top: 126.80,
                                            child: Container(
                                              width: 18.48,
                                              height: 49.28,
                                              child: const Stack(
                                                children: [
                                                  Positioned(
                                                    left: 0,
                                                    top: 0,
                                                    child: SizedBox(
                                                      width: 12.50,
                                                      height: 49.28,
                                                      child: Text(
                                                        '250',
                                                        textAlign:
                                                            TextAlign.right,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontFamily: 'Inter',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 3.26,
                                            top: 83,
                                            child: Container(
                                              width: 18.48,
                                              height: 49.28,
                                              child: const Stack(
                                                children: [
                                                  Positioned(
                                                    left: 0,
                                                    top: 0,
                                                    child: SizedBox(
                                                      width: 12.50,
                                                      height: 49.28,
                                                      child: Text(
                                                        '500',
                                                        textAlign:
                                                            TextAlign.right,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontFamily: 'Inter',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 3.80,
                                            top: 39.20,
                                            child: Container(
                                              width: 17.93,
                                              height: 49.28,
                                              child: const Stack(
                                                children: [
                                                  Positioned(
                                                    left: 0,
                                                    top: 0,
                                                    child: SizedBox(
                                                      width: 11.96,
                                                      height: 49.28,
                                                      child: Text(
                                                        '750',
                                                        textAlign:
                                                            TextAlign.right,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontFamily: 'Inter',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                              width: 21.74,
                                              height: 32.85,
                                              child: const Stack(
                                                children: [
                                                  Positioned(
                                                    left: 0,
                                                    top: 0,
                                                    child: SizedBox(
                                                      width: 15.76,
                                                      height: 32.85,
                                                      child: Text(
                                                        '1000',
                                                        textAlign:
                                                            TextAlign.right,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontFamily: 'Inter',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 35.32,
                            top: 5.48,
                            child: Container(
                              width: 324.96,
                              height: 175.20,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 324.96,
                                      height: 175.20,
                                      child: const Stack(),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 324.96,
                                      height: 175.20,
                                      child: const Stack(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 43.45,
                            top: 5.65,
                            child: Container(
                              width: 308.39,
                              height: 175.02,
                              child: const Stack(),
                            ),
                          ),
                          Positioned(
                            left: 3,
                            top: 219,
                            child: Container(
                              width: 360,
                              height: 102.62,
                              decoration:
                                  const BoxDecoration(color: Color(0xFF464646)),
                            ),
                          ),
                          Positioned(
                            left: 3,
                            top: 215.83,
                            child: Container(
                              width: 357,
                              height: 125.90,
                              decoration:
                                  const BoxDecoration(color: Color(0xFFD9D9D9)),
                            ),
                          ),
                          Positioned(
                            left: 3,
                            top: 215.83,
                            child: Container(
                              width: 360,
                              height: 125.90,
                              decoration:
                                  const BoxDecoration(color: Color(0xFFD9D9D9)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
