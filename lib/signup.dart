import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tikiti/index.dart' as tikiti;
import 'admin-index.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  String _dropdownValue = 'Organiser';
  bool _keepSignedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: const Color.fromARGB(255, 251, 107, 63),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset('assets/Tikiti.png', height: 100),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _phoneNumberController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                
                style: TextStyle(color: Colors.black),
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _confirmPasswordController,
                style: TextStyle(color: Colors.black),
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock_outline),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _dropdownValue,
                
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Account Type',
                  border: OutlineInputBorder(),
                ),
                items: <String>['Organiser', 'Participant']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _dropdownValue = newValue!;
                  });
                },
              ),
              const SizedBox(height: 20),
                Row(
                children: [
                  Checkbox(
                  value: _keepSignedIn,
                  onChanged: (bool? value) {
                    setState(() {
                    _keepSignedIn = value!;
                    });
                  },
                  ),
                  const Text('Keep Me Signed In', style: TextStyle(color: Colors.black)),
                ],
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  minimumSize: Size.fromHeight(50),
                ),
                onPressed: _signUp,
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255), // Changed background color to whitish greyish
    );
  }

  void _signUp() {
    if (_passwordController.text == _confirmPasswordController.text) {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          )
          .then((userCredential) {
        FirebaseFirestore.instance.collection('accounts').doc(userCredential.user!.uid).set({
          'userId': userCredential.user!.uid,
          'email': _emailController.text,
          'phoneNumber': _phoneNumberController.text,
          'accountBalance': 0, // Set account balance to 0
          'role': _dropdownValue,
        }).then((_) {
          if (_dropdownValue == 'Organiser') {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
          } else {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => tikiti.Index()));
          }
        }).catchError((error) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to add user: $error")));
        });
      }).catchError((onError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(onError.toString())));
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Passwords do not match")));
    }
  }
}