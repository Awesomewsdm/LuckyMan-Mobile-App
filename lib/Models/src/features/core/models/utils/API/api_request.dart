import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIResponseData {
  getResponseData(double amount, String returnUrl, String tokenID,
      String clientReference) async {
    var headers = {
      'Authorization':
          'Basic NVc0ejB3WDo0YjVlZWE4YTNjNGE0M2ViODU2MTQ5NjFkZGNhMTllNw==',
      'Content-Type': 'application/json',
    };

    // final clientReference = generateRandomRef(32);
    //  = clientReference;
    var data = {
      "title": "Checkout",
      "totalAmount": amount,
      "description": "Payment For Bus Ticket",
      "callbackUrl": "https://webhook.site/$tokenID",
      "returnUrl": returnUrl,
      "merchantAccountNumber": "2017272",
      "cancellationUrl": "http://hubtel.com/",
      "clientReference": clientReference,
    };

    var url = Uri.parse('https://payproxyapi.hubtel.com/items/initiate');
    var res = await http.post(url, headers: headers, body: jsonEncode(data));
    if (res.statusCode == 200) {
      String data = res.body;
      var decodedData = jsonDecode(data);
      var checkoutUrl = decodedData["data"]["checkoutUrl"];
      // print(checkoutUrl);
      return checkoutUrl;
    } else {
      debugPrint('Failed to load album - ${res.statusCode}');
    }
  }
}
