import 'dart:convert';
import 'dart:math';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:luckyman_app/src/features/core/controllers/seat_selection_controller.dart';

final SeatSelectionController seatSelectionController =
    Get.put(SeatSelectionController());

class APIResponseData {
  getResponseData(double amount, String returnUrl, String tokenID) async {
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
        refLength,
        (index) => allChars[random.nextInt(allChars.length)],
      ).join();
      return randomString;
    }

    final clientReference = generateRandomRef(32);
    seatSelectionController.clientReference.value = clientReference;
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
      return checkoutUrl;
    } else {
      throw Exception('Failed to load album - ${res.statusCode}');
    }
  }
}
