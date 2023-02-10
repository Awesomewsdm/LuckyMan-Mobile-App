import 'dart:convert';

import 'api_constants.dart';
import 'api_response_model.dart';
import 'package:http/http.dart' as http;

Future<TransactionData> fetchTransactionData() async {
  // final response = await http
  //     .post(Uri.parse(ApiConstants.webCheckoutBaseUrl));

  // if (response.statusCode == 200) {
  //   // If the server did return a 200 OK response,
  //   // then parse the JSON.
  //   return TransactionData.fromJson(jsonDecode(response.body));
  // } else {
  //   // If the server did not return a 200 OK response,
  //   // then throw an exception.
  //   throw Exception('Failed to load album');

  // }

  final headers = {
    'accept': 'application/json',
    'Content-Type': 'application/json'
  };
  final responseBody = {
    "totalAmount": 2,
  "title": "Payment",
    "description": "Test with Joseph",
    "callbackUrl": "https://webhook.site/73db4705-d87a-4177-913b-ec42533f51c2",
    "returnUrl": "http://google.com/",
    "merchantAccountNumber": "11684",
    "cancellationUrl": "http://hubtel.com/",
    "clientReference": "001TestwithAbrantie171kkb07z1921319"
}
  final request = http.Request(
      'POST', Uri.parse(ApiConstants.webCheckoutBaseUrl));
  request.body = jsonEncode(responseBody) ;
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    return TransactionData.fromJson(jsonDecode(response.body));
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

// API ID(username): 5R5VV9Y
// API Key(password): 5303dad6ae324e9c872e63845475e032
// Web Checkout Base URL: https://payproxyapi.hubtel.com/items/initiate0
// Account Numbers: https://bo.hubtel.com/money
