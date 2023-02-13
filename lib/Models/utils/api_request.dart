import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

class APIResponseData{
  
  getResponseData(double amount, String returnUrl ) async {
    var headers = {
      'Authorization':
          'Basic NVc0ejB3WDo0YjVlZWE4YTNjNGE0M2ViODU2MTQ5NjFkZGNhMTllNw==',
      'Content-Type': 'application/json',
    };

    String generateRandomRef(int refLength) {
      final random = Random();
      const allChars =
          "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789";
      final randomString = List.generate(
              refLength, (index) => allChars[random.nextInt(allChars.length)])
          .join();
      return randomString;
    }

    var data = {
      "title": "Checkout",
      "totalAmount": 0.5,
      "description": "Payment For Bus Ticket",
      "callbackUrl":
          "https://webhook.site/9e4b4f89-0e18-46fc-b808-8a529033480c",
      "returnUrl": returnUrl,
      "merchantAccountNumber": "2017272",
      "cancellationUrl": "http://hubtel.com/",
      "clientReference": generateRandomRef(32),
    };

    var url = Uri.parse('https://payproxyapi.hubtel.com/items/initiate');
    var res = await http.post(url, headers: headers, body: jsonEncode(data));
    if (res.statusCode == 200) {
      String data = res.body;
      var decodedData = jsonDecode(data);
      var checkoutUrl = decodedData["data"]["checkoutUrl"];
      return checkoutUrl;
      // print(res.body);
      // return APIResponseData.fromJson(jsonDecode(res.body));
    } else {
      throw Exception('Failed to load album - ${res.statusCode}');
    }
  }
}


