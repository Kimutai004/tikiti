import 'package:flutter/material.dart';
import 'package:tikiti/index.dart';
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
          Tickets(),
        ]),
      ),
    );
  }
}

class Tickets extends StatelessWidget {
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
                  left: 25,
                  top: 30,
                  child: SizedBox(
                    width: 69,
                    height: 25,
                    child: Text(
                      'Tickets',
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
                ),
                const Positioned(
                  left: 60,
                  top: 119,
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
                  top: 119,
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
                  top: 149,
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
                  top: 168,
                  child: Container(
                    width: 324,
                    height: 75,
                    decoration: const BoxDecoration(color: Color(0xFFF5F4F4)),
                  ),
                ),
                Positioned(
                  left: 24,
                  top: 168,
                  child: Container(
                    width: 107,
                    height: 75,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage("assets/Rectangle 97.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 149,
                  top: 180,
                  child: SizedBox(
                    width: 183,
                    child: Text(
                      'Kitchen Cooking Competition',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Kavoon',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 149,
                  top: 206,
                  child: SizedBox(
                    width: 177,
                    child: Text(
                      'Sat 25 may 2024, 1500hrs - 2100hrs',
                      style: TextStyle(
                        color: Color(0xFFFF3D00),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 24,
                  top: 254,
                  child: Container(
                    width: 324,
                    height: 75,
                    decoration: const BoxDecoration(color: Color(0xFFF5F4F4)),
                  ),
                ),
                Positioned(
                  left: 24,
                  top: 254,
                  child: Container(
                    width: 107,
                    height: 75,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage("assets/Rectangle 97.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 149,
                  top: 266,
                  child: SizedBox(
                    width: 183,
                    child: Text(
                      'Kitchen Cooking Competition',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Kavoon',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 149,
                  top: 292,
                  child: SizedBox(
                    width: 177,
                    child: Text(
                      'Sat 25 may 2024, 1500hrs - 2100hrs',
                      style: TextStyle(
                        color: Color(0xFFFF3D00),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 25,
                  top: 340,
                  child: Container(
                    width: 324,
                    height: 75,
                    decoration: const BoxDecoration(color: Color(0xFFF5F4F4)),
                  ),
                ),
                Positioned(
                  left: 25,
                  top: 340,
                  child: Container(
                    width: 107,
                    height: 75,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage("assets/Rectangle 97.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 150,
                  top: 352,
                  child: SizedBox(
                    width: 183,
                    child: Text(
                      'Kitchen Cooking Competition',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Kavoon',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 150,
                  top: 378,
                  child: SizedBox(
                    width: 177,
                    child: Text(
                      'Sat 25 may 2024, 1500hrs - 2100hrs',
                      style: TextStyle(
                        color: Color(0xFFFF3D00),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 118,
                  top: 744,
                  child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Search()),
                    );
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Search.png"),
                      fit: BoxFit.contain,
                    ),
                    ),
                  ),
                  ),
                ),
                Positioned(
                  left: 284,
                  top: 744,
                  child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                    );
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Account.png"),
                      fit: BoxFit.contain,
                    ),
                    ),
                  ),
                  ),
                ),
                Positioned(
                  left: 35,
                  top: 744,
                  child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Index()),
                    );
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Home.png"),
                      fit: BoxFit.contain,
                    ),
                    ),
                  ),
                  ),
                ),
                Positioned(
                  left: 201,
                  top: 744,
                  child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Tickets()),
                    );
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Ticket.png"),
                      fit: BoxFit.contain,
                    ),
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
