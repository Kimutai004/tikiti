import 'package:flutter/material.dart';
import 'package:tikiti/index.dart';
import 'package:tikiti/tickets.dart';
import 'package:tikiti/profile.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}


class _SearchState extends State<Search> {

  int _selectedIndex = 1; // Default index of first screen

  static List<Widget> _widgetOptions = <Widget>[
    Index(), // Assuming Home() is your home page widget
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
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
                left: 43,
                top: 12,
                child: Container(
                  width: 274,
                  height: 29,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(width: 2, color: Color(0xFFFF3D00)),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 60,
                top: 21,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Search.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 3,
                top: 100,
                child: SizedBox(
                  width: 101,
                  height: 21,
                  child: Text(
                    '104 Events',
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
              ),
              Positioned(
                left: 7,
                top: 51,
                child: Container(
                  width: 97,
                  height: 39,
                  decoration: BoxDecoration(
                    color: const Color(0x7CD9D9D9),
                    borderRadius: BorderRadius.circular(5),
                    border: const Border(
                      left: BorderSide(width: 3, color: Color(0xFFFF3D00)),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 5,
                top: 65,
                child: SizedBox(
                  width: 93,
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
                left: 79,
                top: 58,
                child: Container(
                  width: 25,
                  height: 29,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Location (1).png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 120,
                top: 57,
                child: Container(
                  width: 67,
                  height: 31,
                  decoration: const BoxDecoration(color: Color(0xFFFF3D00)),
                ),
              ),
              Positioned(
                left: 197,
                top: 57,
                child: Container(
                  width: 65,
                  height: 31,
                  decoration: const BoxDecoration(color: Color(0xFFFF3D00)),
                ),
              ),
              Positioned(
                left: 272,
                top: 57,
                child: Container(
                  width: 68,
                  height: 31,
                  decoration: const BoxDecoration(color: Color(0xFFFF3D00)),
                ),
              ),
              const Positioned(
                left: 121,
                top: 65,
                child: SizedBox(
                  width: 66,
                  height: 30,
                  child: Text(
                    'All',
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
                left: 198,
                top: 65,
                child: SizedBox(
                  width: 64,
                  height: 29,
                  child: Text(
                    'Online',
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
                left: 272,
                top: 65,
                child: SizedBox(
                  width: 68,
                  height: 32,
                  child: Text(
                    'Physical',
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
                left: 23,
                top: 143,
                child: Container(
                  width: 294,
                  height: 274,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFCFCFC),
                    border: Border(
                      left: BorderSide(width: 3, color: Color(0xFFFF3D00)),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 26,
                top: 145,
                child: Container(
                  width: 292,
                  height: 135,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Rectangle 97.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 34,
                top: 294,
                child: SizedBox(
                  width: 220,
                  child: Text(
                    'Kitchen Cooking Competition',
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
                left: 34,
                top: 358,
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
              const Positioned(
                left: 34,
                top: 385,
                child: Text(
                  'Ruiru town',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 227,
                top: 241,
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
                left: 271,
                top: 241,
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
                left: 234,
                top: 249,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Share.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 279,
                top: 249,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Favorite.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 23,
                top: 435,
                child: Container(
                  width: 294,
                  height: 274,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      left: BorderSide(width: 3, color: Color(0xFFFF3D00)),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 26,
                top: 437,
                child: Container(
                  width: 292,
                  height: 135,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Rectangle 97.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 34,
                top: 586,
                child: SizedBox(
                  width: 220,
                  child: Text(
                    'Kitchen Cooking Competition',
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
                left: 34,
                top: 650,
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
              const Positioned(
                left: 34,
                top: 677,
                child: Text(
                  'Ruiru town',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 227,
                top: 533,
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
                left: 271,
                top: 533,
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
                left: 234,
                top: 541,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Share.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 279,
                top: 541,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Favorite.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
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
  selectedItemColor: Colors.amber[800],
  unselectedItemColor: Colors.grey, // Ensure unselected items are visible
  onTap: _onItemTapped,
  backgroundColor: Colors.grey[200], // Set to a greyish tone
),
    );
  }
}