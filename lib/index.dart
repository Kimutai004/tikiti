import 'package:flutter/material.dart';
import 'package:tikiti/Event-tickets.dart';
import 'package:tikiti/profile.dart';
import 'package:tikiti/search.dart';

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
          Index(),
        ]),
      ),
    );
  }
}

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: 360,
            height: 800,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
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
                Positioned(
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
                    decoration: BoxDecoration(
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
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                              AssetImage("assets/Tikiti.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 24,
                  top: 97,
                  child: Container(
                    width: 156,
                    height: 105,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage("assets/Rectangle 97.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 24,
                  top: 351,
                  child: Container(
                    width: 156,
                    height: 105,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage("assets/Rectangle 97.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 24,
                  top: 224,
                  child: Container(
                    width: 156,
                    height: 105,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage("assets/Rectangle 97.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
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
                Positioned(
                  left: 195,
                  top: 118,
                  child: Text(
                    'Sat 25 may 2024, 1500hrs - 2100hrs',
                    style: TextStyle(
                      color: Color(0xFFFF3D00),
                      fontSize: 8,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 195,
                  top: 140,
                  child: SizedBox(
                    width: 138,
                    child: Text(
                      'Kitchen Cooking Competition',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 195,
                  top: 189,
                  child: Text(
                    'Ruiru town',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 6,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w300,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 195,
                  top: 118,
                  child: Text(
                    'Sat 25 may 2024, 1500hrs - 2100hrs',
                    style: TextStyle(
                      color: Color(0xFFFF3D00),
                      fontSize: 8,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 195,
                  top: 140,
                  child: SizedBox(
                    width: 138,
                    child: Text(
                      'Kitchen Cooking Competition',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 195,
                  top: 241,
                  child: Text(
                    'Sat 25 may 2024, 1500hrs - 2100hrs',
                    style: TextStyle(
                      color: Color(0xFFFF3D00),
                      fontSize: 8,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 195,
                  top: 263,
                  child: SizedBox(
                    width: 138,
                    child: Text(
                      'Kitchen Cooking Competition',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 195,
                  top: 315,
                  child: Text(
                    'Ruiru town',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 6,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w300,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 195,
                  top: 364,
                  child: Text(
                    'Sat 25 may 2024, 1500hrs - 2100hrs',
                    style: TextStyle(
                      color: Color(0xFFFF3D00),
                      fontSize: 8,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 195,
                  top: 386,
                  child: SizedBox(
                    width: 138,
                    child: Text(
                      'Kitchen Cooking Competition',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 195,
                  top: 441,
                  child: Text(
                    'Ruiru town',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 6,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w300,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 280,
                  top: 176,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage("assets/Share.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 313,
                  top: 176,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage("assets/Favorite.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 280,
                  top: 305,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage("assets/Share.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 313,
                  top: 305,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage("assets/Favorite.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 280,
                  top: 428,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage("assets/Share.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 313,
                  top: 428,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage("assets/Favorite.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
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
                  left: 107,
                  top: 740,
                  child: GestureDetector(
                  onTap: () {
                    // Add code to navigate to search.dart
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Search()),
                    );
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Search.png"),
                      fit: BoxFit.contain,
                    ),
                    ),
                  ),
                  ),
                ),
                Positioned(
                  left: 273,
                  top: 740,
                  child: GestureDetector(
                  onTap: () {
                    // Add code to navigate to profile.dart
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                    );
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Account.png"),
                      fit: BoxFit.contain,
                    ),
                    ),
                  ),
                  ),
                ),
                Positioned(
                  left: 24,
                  top: 740,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage("assets/Home.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 190,
                  top: 740,
                  child: GestureDetector(
                  onTap: () {
                    // Add code to navigate to ticket.dat
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Ticket()),
                    );
                    
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Ticket.png"),
                      fit: BoxFit.contain,
                    ),
                    ),
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
                      color: Color(0x7CD9D9D9),
                      borderRadius: BorderRadius.circular(5),
                      border: Border(
                        left: BorderSide(width: 3, color: Color(0xFFFF3D00)),
                        top: BorderSide(color: Color(0xFFFF3D00)),
                        right: BorderSide(color: Color(0xFFFF3D00)),
                        bottom: BorderSide(color: Color(0xFFFF3D00)),
                      ),
                    ),
                  ),
                ),
                Positioned(
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
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage("assets/Location (1).png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 194,
                  top: 176,
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
                  left: 194,
                  top: 298,
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
                  left: 195,
                  top: 424,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
