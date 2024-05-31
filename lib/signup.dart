import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'admin-index.dart'; // Assuming you have a Home widget in home.dart

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _emailController = TextEditingController(); // Define _emailController
  TextEditingController _passwordController = TextEditingController(); // Define _passwordController
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
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
                  left: 56,
                  top: 634,
                  child: GestureDetector(
                    onTap: () {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                            email: _emailController.text, // Use _emailController
                            password: _passwordController.text, // Use _passwordController
                          )
                          .then((value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      }).catchError((onError) {
                        print(onError);
                      });
                    },
                    child: Container(
                      width: 248,
                      height: 40,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFF3E01),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 59,
                  top: 207,
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
                      controller: _emailController, // Use _emailController
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your text',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 59,
                  top: 396,
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
                      controller: _passwordController, // Use _passwordController
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your text',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 59,
                  top: 496,
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
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your text',
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 43,
                  top: 178,
                  child: Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Kaisei Decol',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 56,
                  top: 301,
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
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your text',
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 40,
                  top: 272,
                  child: Text(
                    'Phone Number',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Kaisei Decol',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                const Positioned(
                  left: 44,
                  top: 367,
                  child: Text(
                    'Password',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Kaisei Decol',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                const Positioned(
                  left: 44,
                  top: 467,
                  child: Text(
                    'Confirm Password',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Kaisei Decol',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 72,
                  top: 566,
                  child: GestureDetector(
                    onTap: () {
                      // Handle checkbox click event here
                    },
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(
                            245, 255, 85, 0), // Set initial color to orange
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 113,
                  top: 572,
                  child: Text(
                    'Keep Me signed In',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Kaisei Decol',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 164,
                  top: 648,
                  child: Text(
                    'SignUp',
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
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}