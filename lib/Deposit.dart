import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  MpesaFlutterPlugin.setConsumerKey("ZER8qjaVD9qUG4Ovwccrti0NcWO2qYMAqUbIyamGblDDsAGw");
  MpesaFlutterPlugin.setConsumerSecret("Er9PLZMAkXu3AueuirVPY9iCoW7TGua2Sqa7Whv1lFnrNNAmPamBeNh78nbuZOcL");
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
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      home: Scaffold(
        body: SafeArea(
          child: Deposit(),
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
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final userId = FirebaseAuth.instance.currentUser!.uid;

  String selectedMethod = 'Mpesa';
  String selectedTab = 'Deposit';

  final phoneController = TextEditingController();
  final amountController = TextEditingController();

  void initiateStkPush() async {
    final phone = phoneController.text;
    final amount = amountController.text;

    if (selectedMethod == 'Mpesa') {
      try {
        dynamic transactionInitialisation = await MpesaFlutterPlugin.initializeMpesaSTKPush(
          businessShortCode: "174379",
          transactionType: TransactionType.CustomerPayBillOnline,
          amount: double.parse(amount),
          partyA: phone,
          partyB: "174379",
          callBackURL: Uri.parse("https://webhook.site/your-callback-url"),
          accountReference: "Test123",
          phoneNumber: phone,
          baseUri: Uri.parse("https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest"),
          transactionDesc: "Test Payment",
          passKey: "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919",
        );

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

        postTransactionDetails(transactionData);

        await Future.delayed(Duration(seconds: 3));
        updateAccountBalance(userId, int.parse(amount));
        
        print("TRANSACTION RESULT: " + transactionInitialisation.toString());
      } catch (e) {
        print("CAUGHT EXCEPTION: " + e.toString());
      }
    }
  }

  void initiateWithdrawal() async {
    final phone = phoneController.text;
    final amount = int.parse(amountController.text);

    try {
      DocumentSnapshot userAccount = await _firestore.collection('accounts').doc(userId).get();
      if (userAccount.exists && userAccount['accountBalance'] >= amount) {
        int currentBalance = userAccount['accountBalance'];
        int newBalance = currentBalance - amount;

        await _firestore.collection('accounts').doc(userId).update({
          'accountBalance': newBalance,
        });

        Map<String, dynamic> transactionData = {
          'phone': phone,
          'amount': amount,
          'status': 'Completed',
          'method': 'Mpesa',
          'transactionId': '',
          'TransactionDate': DateTime.now(),
          'Balance': newBalance,
          'user_id': userId,
        };

        postTransactionDetails(transactionData);

        print("Withdrawal successful. New balance: $newBalance");
      } else {
        print("Insufficient balance for withdrawal.");
      }
    } catch (e) {
      print("Withdrawal failed: $e");
    }
  }

  void postTransactionDetails(Map<String, dynamic> transactionData) async {
    await _firestore.collection('transactions').add(transactionData).then((docRef) {
      print("Transaction details posted successfully: ${docRef.id}");
    }).catchError((error) {
      print("Failed to post transaction details: $error");
    });
  }

  void updateAccountBalance(String userId, int amount) async {
    DocumentReference userAccountRef = _firestore.collection('accounts').doc(userId);

    try {
      await _firestore.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(userAccountRef);

        if (!snapshot.exists) {
          throw Exception("User account does not exist!");
        }

        int currentBalance = snapshot['accountBalance'];
        int newBalance = currentBalance + amount;

        transaction.update(userAccountRef, {'accountBalance': newBalance});

        print("Account balance updated successfully");
      });
    } catch (error) {
      print("Failed to update account balance: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deposit & Withdrawals'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = 'Deposit';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: selectedTab == 'Deposit' ? const Color(0xFFFF3E01) : Colors.transparent,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Deposit',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 1,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = 'Withdraw';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: selectedTab == 'Withdraw' ? const Color(0xFFFF3E01) : Colors.transparent,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Withdraw',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
            SizedBox(height: 32),
            Text(
              selectedTab == 'Deposit' ? 'Phone number to deposit' : 'Phone number to withdraw',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Phone Number',
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Amount',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Amount',
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: selectedTab == 'Deposit' ? initiateStkPush : initiateWithdrawal,
              child: Text(selectedTab == 'Deposit' ? 'Deposit' : 'Withdraw'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Color(0xFFFF3E01)
              ),
            ),
            SizedBox(height: 32),
            Text(
              'Previous Transactions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('transactions')
                    .where('user_id', isEqualTo: userId)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error fetching transactions'));
                  }

                  final transactions = snapshot.data?.docs ?? [];

                  if (transactions.isEmpty) {
                    return Center(child: Text('No transactions found'));
                  }

                  return ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      final transaction = transactions[index].data() as Map<String, dynamic>;
                      return Card(
                        child: ListTile(
                          title: Text('${transaction['method']} - ${transaction['amount']}'),
                          subtitle: Text('${transaction['phone']} - ${transaction['TransactionDate']}'),
                          trailing: Text('${transaction['status']}'),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
