// import 'dart:convert';

// import 'package:http/http.dart' as http;

// class WebhookToken {
//   Future<String> createWebhookToken() async {
//     var headers = {
//       'Accept': 'application/json',
//       'Content-Type': 'application/json',
//     };

//     var data = {
//       "default_status": 200,
//     };

//     var url = Uri.parse('https://webhook.site/token');
//     var res = await http.post(url, headers: headers, body: jsonEncode(data));
//     if (res.statusCode == 201) {
//       String data = res.body;
//       var decodedData = jsonDecode(data);
//       var webhookToken = decodedData["uuid"];
//       return webhookToken;
//     } else {
//       throw Exception('Failed to load - ${res.statusCode}');
//     }
//   }
// }
