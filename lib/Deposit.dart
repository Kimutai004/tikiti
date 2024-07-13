import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  MpesaFlutterPlugin.setConsumerKey(
      "ZER8qjaVD9qUG4Ovwccrti0NcWO2qYMAqUbIyamGblDDsAGw");
  MpesaFlutterPlugin.setConsumerSecret(
      "Er9PLZMAkXu3AueuirVPY9iCoW7TGua2Sqa7Whv1lFnrNNAmPamBeNh78nbuZOcL");
  runApp(const FigmaToCodeApp());
}

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addTransaction(Map<String, dynamic> transactionData) async {
    await _db.collection('transactions').add(transactionData);
  }
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(
          children: [
            Deposit(),
          ],
        ),
      ),
    );
  }
}

class Deposit extends StatefulWidget {
  @override
  _DepositState createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
  final userId = FirebaseAuth.instance.currentUser!.uid;


  String selectedMethod = 'Mpesa';
  final phoneController = TextEditingController();
  final amountController = TextEditingController();

  // Here you would call your STK push API
  void initiateStkPush() async {
    final phone = phoneController.text;
    final amount = amountController.text;

    if (selectedMethod == 'Mpesa') {
      try {
        dynamic transactionInitialisation;
        transactionInitialisation =
            await MpesaFlutterPlugin.initializeMpesaSTKPush(
          businessShortCode: "174379",
          transactionType: TransactionType.CustomerPayBillOnline,
          amount: double.parse(amount),
          partyA: phone,
          partyB: "174379",
          callBackURL: Uri.parse(
              "https://webhook.site/259bc1c0-9938-473a-bce8-ec481d7f7a17"),
          accountReference: "Test123",
          phoneNumber: phone,
          baseUri: Uri.parse(
              "https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest"),
          transactionDesc: "Test Payment",
          passKey:
              "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919",
        );

        // Assuming transactionInitialisation contains transaction details
        Map<String, dynamic> transactionData = {
          'phone': phone,
          'amount': amount,
          'status': 'Pending',
          'method': 'Mpesa',
          'transactionId': transactionInitialisation['MerchantRequestID'],
          'TransactionDate': transactionInitialisation['TransactionDate'],
          'Balance': transactionInitialisation['Balance'],
          'user_id': userId,
        };


        print("TRANSACTION RESULT: " + transactionInitialisation.toString());
      } catch (e) {
        print("CAUGHT EXCEPTION: " + e.toString());
      }
    } else if (selectedMethod == 'Airtel Money') {
      // Implement Airtel Money API call here
      print('Initiating STK push: Airtel Money, $phone, $amount');
    }
  }

  // Function to update or create an account document after a transaction
Future<void> updateOrCreateAccountDocument(Map<String, dynamic> transactionData) async {
  DocumentReference accountRef = FirebaseFirestore.instance.collection('accounts').doc(userId);

  FirebaseFirestore.instance.runTransaction((transaction) async {
    DocumentSnapshot snapshot = await transaction.get(accountRef);
    if (!snapshot.exists) {
      // Account document does not exist, create it
      transaction.set(accountRef, {
        'transactions': [transactionData], // Initialize with the first transaction
        // Add any other initial account details here
      });
    } else {
      // Account document exists, update it
      List<dynamic> transactions = List.from(snapshot['transactions']);
      transactions.add(transactionData);
      transaction.update(accountRef, {'transactions': transactions});
    }
  }).then((result) {
      print("Account document updated or created");
  }).catchError((error) {
    print("Error updating or creating account document: $error");
  });
}



  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deposit & Withdrawals'),
      ),
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
                  left: 83,
                  top: 30,
                  child: Text(
                    'Deposit',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFF3D00),
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 257,
                  top: 30,
                  child: Text(
                    'Withdraw',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 27,
                  top: 52,
                  child: Container(
                    width: 160,
                    decoration: ShapeDecoration(
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
                  left: 144,
                  top: 78,
                  child: Container(
                    width: 81,
                    height: 41,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedMethod = 'Airtel Money';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xC6FF2929),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Airtel Money',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 37,
                  top: 78,
                  child: Container(
                    width: 81,
                    height: 41,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedMethod = 'Mpesa';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xD6099920),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Container(
                        width: 30,
                        height: 33,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/Mpesa.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                        margin: EdgeInsets.only(
                            left:
                                0), // Add this line to move the container to the left
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 55,
                  top: 92,
                  child: SizedBox(
                    width: 63,
                    height: 37,
                    child: Text(
                      'Mpesa',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 32,
                  top: 192,
                  child: Container(
                    width: 310,
                    height: 175,
                    decoration: ShapeDecoration(
                      color: Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 45,
                  top: 204,
                  child: Text(
                    'Phone number to deposit',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 55,
                  top: 225,
                  child: Container(
                    width: 243,
                    height: 31,
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 55,
                  top: 287,
                  child: Container(
                    width: 243,
                    height: 31,
                    child: TextField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 115,
                  top: 328,
                  child: Container(
                    width: 141,
                    height: 31,
                    child: ElevatedButton(
                      onPressed: initiateStkPush,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFF3D00),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Deposit',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 44,
                  top: 266,
                  child: Text(
                    'Amount',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
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
