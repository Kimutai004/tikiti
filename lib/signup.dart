import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tikiti/index.dart' as tikiti;
import 'admin-index.dart'; // Assuming you have a Home widget in home.dart

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _emailController =
      TextEditingController(); // Define _emailController
  TextEditingController _passwordController =
      TextEditingController(); // Define _passwordController

  void dropdownCallback(String SelectedValue) {
  if (SelectedValue is String) {
    setState(() {
      _dropdownValue = SelectedValue;
    });
  }
  }

  String _dropdownValue = 'Organiser'; // Initial dropdown value
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
            decoration: ShapeDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
            child: Stack(
              children: [
                Positioned(
                  left: 159,
                  top: 20,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/Tikiti.png'),
                        
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 56,
                  top: 700,
                  child: GestureDetector(
                    onTap: () {
  FirebaseAuth.instance
      .createUserWithEmailAndPassword(
    email: _emailController.text, // Use _emailController for email
    password: _passwordController.text, // Use _passwordController for password
  )
  .then((userCredential) {
    // After successful user creation, create a document in Firestore
    FirebaseFirestore.instance.collection('accounts').doc(userCredential.user!.uid).set({
      'userId': userCredential.user!.uid, // Capture user ID
      'email': _emailController.text, // Capture email address
      'accountBalance': 0, // Set account balance to 0
      'role': _dropdownValue, // Store the user role
    }).then((_) {
      // Navigate to the next screen after account creation
      if (_dropdownValue == 'Organiser') {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) => tikiti.Index()));
      }
    }).catchError((error) {
      print("Failed to add user: $error");
    });
  }).catchError((onError) {
    print(onError);
  });
},
                    child: Container(
                      width: 300,
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
                    width: 300,
                    height: 42,
                    decoration: BoxDecoration(
                      color: Color(0xC6F6F6F6),
                      borderRadius: BorderRadius.circular(10),
                      border: Border(
                        bottom: BorderSide(width: 1, color: Color(0xFFFF3D00)),
                      ),
                    ),
                    child: TextField(
                      controller: _emailController,
                      style: const TextStyle(
                          color: Colors.black,
                        ), // Use _emailController
                      decoration: const InputDecoration(
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
                    width: 300,
                    height: 42,
                    decoration: BoxDecoration(
                      color: Color(0xC6F6F6F6),
                      borderRadius: BorderRadius.circular(10),
                      border: Border(
                        bottom: BorderSide(width: 1, color: Color(0xFFFF3D00)),
                      ),
                    ),
                    child: TextField(
                      controller: _passwordController, // Use _passwordController
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      decoration: const InputDecoration(
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
                    width: 300,
                    height: 42,
                    decoration: BoxDecoration(
                      color: Color(0xC6F6F6F6),
                      borderRadius: BorderRadius.circular(10),
                      border: Border(
                        bottom: BorderSide(width: 1, color: Color(0xFFFF3D00)),
                      ),
                    ),
                    child: const TextField(
                      style: TextStyle(
                          color: Colors.black,
                        ),
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
                    width: 300,
                    height: 42,
                    decoration: BoxDecoration(
                      color: Color(0xC6F6F6F6),
                      borderRadius: BorderRadius.circular(10),
                      border: Border(
                        bottom: BorderSide(width: 1, color: Color(0xFFFF3D00)),
                      ),
                    ),
                    child: const TextField(
                      style: TextStyle(
                          color: Colors.black,
                        ),
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
                  top: 648,
                  child: GestureDetector(
                    onTap: () {
                      // Handle checkbox click event here
                    },
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(
                            245, 255, 85, 0), // Set initial color to orange
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 45,
                  top: 560,
                  child: Text(
                    'Account Type',
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
                  left: 52,
                  top: 590,
                  child: Container(
                    width: 300,
                    height: 42,
                    decoration: BoxDecoration(
                      color: Color(0xC6F6F6F6),
                      borderRadius: BorderRadius.circular(10),
                      border: Border(
                        bottom: BorderSide(width: 1, color: Color(0xFFFF3D00)),
                      ),
                    ),
                    
                    child: DropdownButton<String>(
                      value: _dropdownValue,
                      style: const TextStyle(
                          color: Colors.black,
                        ),
                      items: [
                       DropdownMenuItem(
                        value: "Organiser",
                        child: Text("Organiser"),
                        
                      ),
                      const DropdownMenuItem(
                        value: "Participant",
                        child: Text("Participant"),
                      ),
                      ],
                      onChanged: (String? value) {
                      setState(() {
                        _dropdownValue = value!;
                      });
                      },
                    ),
                  ),
                ),
                Positioned(
                  left: 300,
                  top: 600,
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Expand Arrow.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 113,
                  top: 650,
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
                const Positioned(
                  left: 164,
                  top: 715,
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
