import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tikiti/index.dart' as tikiti;
import 'admin-index.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _keepSignedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1), // Adjust the size as needed
            Image.asset('assets/Tikiti.png', height: 100), // Replace 'assets/logo.png' with your logo's asset path
            Container(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _emailController,
                style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        
                  prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      
                style: TextStyle(color: Colors.black),
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    CheckboxListTile(
                      title: Text('Keep Me Signed In' ,
                style: TextStyle(color: Colors.black),),
                      
                      value: _keepSignedIn,
                      onChanged: (bool? value) {
                        setState(() {
                          _keepSignedIn = value!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    ElevatedButton(
                      onPressed: _signIn,
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF3E01), // Background color
                      padding: EdgeInsets.symmetric(horizontal: 40), // Increase the padding
                      textStyle: TextStyle(fontSize: 18), // Increase the font size
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _signIn() {
    if (_formKey.currentState!.validate()) {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          )
          .then((userCredential) {
        _navigateBasedOnRole(userCredential.user!.uid);
      }).catchError((onError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error signing in: $onError")));
      });
    }
  }

  void _navigateBasedOnRole(String userId) {
    FirebaseFirestore.instance.collection('accounts').doc(userId).get().then((documentSnapshot) {
      if (documentSnapshot.exists) {
        String? role = documentSnapshot.data()?['role'];
        if (role == 'Organiser') {
          
        // Assuming ParticipantHome is a StatefulWidget or StatelessWidget
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
        } else if (role == 'Participant') {
          
        // Assuming ParticipantHome is a StatefulWidget or StatelessWidget
        Navigator.push(context, MaterialPageRoute(builder: (context) => tikiti.Index()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Unexpected role: $role")));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User does not exist")));
      }
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to fetch user role: $error")));
    });
  }
}