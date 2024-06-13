import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tikiti/signup.dart';
import 'package:tikiti/login.dart';
import 'package:tikiti/event-desc.dart';

// ... other imports for your app

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

// Generated by: https://www.figma.com/community/plugin/842128343887142055/
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          AndroidLarge1(),
        ]),
      ),
    );
  }
}

class AndroidLarge1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 412,
          height: 815,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Color.fromARGB(222, 232, 71, 35)),
          child: Stack(
            children: [
              Positioned(
                left: 24,
                top: 72,
                child: SizedBox(
                  width: 350,
                  height: 68,
                  child: Text(
                    'Let’s get Started',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontFamily: 'Kavoon',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 26,
                top: 116,
                child: SizedBox(
                  width: 300,
                  child: Text(
                    'sign up or login to see what’s happening near you',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Kaisei Decol',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 48,
                top: 320,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                  child: Container(
                    width: 248,
                    height: 40,
                    decoration: ShapeDecoration(
                      color: Color(0xFFFF3E01),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 48,
                top: 380,
                child: Container(
                  width: 248,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF6F6F6),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2,
                        strokeAlign: BorderSide.strokeAlignOutside,
                        color: Color(0xFF706E6E),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 48,
                top: 440,
                child: Container(
                  width: 248,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF6F6F6),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2,
                        strokeAlign: BorderSide.strokeAlignOutside,
                        color: Color(0xFF706E6E),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 105,
                top: 334,
                child: Text(
                  'Continue with Email Address',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 115,
                top: 394,
                child: Text(
                  'Continue with Facebook',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF0C0C0C),
                    fontSize: 10,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 120,
                top: 454,
                child: Text(
                  'Continue with  Google',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF0C0C0C),
                    fontSize: 10,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 83,
                top: 385,
                child: Container(
                  width: 22,
                  height: 30,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Facebook.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 85,
                top: 449,
                child: Container(
                  width: 20,
                  height: 21,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Google.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 48,
                top: 500,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Text(
                    'Have an Account, Click here to Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF1CA2F9),
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
