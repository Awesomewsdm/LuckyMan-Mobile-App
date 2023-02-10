import 'dart:convert';

import 'api_constants.dart';
import 'api_response_model.dart';
import 'package:http/http.dart' as http;

Future<TransactionData> fetchTransactionData() async {
  final response = await http
      .post(Uri.parse(ApiConstants.webCheckoutBaseUrl));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return TransactionData.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

// API ID(username): 5R5VV9Y
// API Key(password): 5303dad6ae324e9c872e63845475e032
// Web Checkout Base URL: https://payproxyapi.hubtel.com/items/initiate0
// Account Numbers: https://bo.hubtel.com/money
