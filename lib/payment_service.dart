import 'dart:convert';
import 'package:http/http.dart' as http;

class PaymentService {
  final String apiUrl = 'https://api.airtel.com/...'; // Replace with actual Airtel Money API URL
  final String apiKey = 'your_api_key'; // Replace with your actual API key
  final String publicKey = 'your_public_key'; // Replace with your actual public key

  Future<void> initiateAirtelStkPush(String phone, String amount) async {
    final url = Uri.parse('$apiUrl/stkpush');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'phoneNumber': phone,
        'amount': amount,
        'publicKey': publicKey,
      }),
    );

    if (response.statusCode == 200) {
      // Handle success
      print('Airtel Money STK push initiated successfully');
    } else {
      // Handle error
      print('Failed to initiate Airtel Money STK push: ${response.body}');
    }
  }
}
