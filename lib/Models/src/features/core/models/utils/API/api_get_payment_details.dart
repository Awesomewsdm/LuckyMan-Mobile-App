import 'dart:convert';
import 'package:http/http.dart' as http;

class PaymentData {
  Future getPaymentDataFromWebhook(
      String? clientReference, String? tokenID) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    var params = {
      'query': 'method:POST, content:$clientReference',
    };
    var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

    var url = Uri.parse('https://webhook.site/token/$tokenID/requests?$query');
    var res = await http.get(url, headers: headers);
    if (res.statusCode == 200) {
      String data = res.body;
      var decodedData = jsonDecode(data);
      var clientRef = decodedData["data"][0]["uuid"];
      // var createdAt = decodedData["created_at"];

      return clientRef;
    } else {
      throw Exception('Failed to load - ${res.statusCode}');
    }
  }
}
