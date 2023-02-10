class ApiConstants {
  static const apiKey = '4b5eea8a3c4a43eb85614961ddca19e7';
  static const apiID = '5W4z0wX';
  static const webCheckoutBaseUrl =
      'https://payproxyapi.hubtel.com/items/initiate';
  static const accounNumber = '';

  static const basicAuth =
      'Basic NVc0ejB3WDo0YjVlZWE4YTNjNGE0M2ViODU2MTQ5NjFkZGNhMTllNw==';

  static const responseHeaders = {
    'accept': 'application/json',
    'Content-Type': 'application/json'
  };

  static const responseBody = {
    "totalAmount": 1000,
    "title": "Awesome",
    "description": "Test with Joseph",
    "callbackUrl": "https://webhook.site/b6c53cc6-c030-425c-a894-5dfb4f0cb3be",
    "returnUrl": "http://google.com/",
    "merchantAccountNumber": "2017272",
    "cancellationUrl": "http://hubtel.com/",
    "clientReference": "001Test278904"
  };
}

// --- Response data to initialise payment
// {
//     "responseCode": "0000",
//     "status": "Success",
//     "data": {
//         "checkoutUrl": "https://pay.hubtel.com/830f9979240f4cdabbb5f888aa98ccb1",
//         "checkoutId": "830f9979240f4cdabbb5f888aa98ccb1",
//         "clientReference": "001Test278904",
//         "message": "",
//         "checkoutDirectUrl": "https://pay.hubtel.com/830f9979240f4cdabbb5f888aa98ccb1/direct"
//     }
// }

// --- Response data after payment
// {
//   "ResponseCode": "0000",
//   "Status": "Success",
//   "Data": {
//     "CheckoutId": "3b98893b756642c792178adecb4f46e0",
//     "SalesInvoiceId": "623aed28a82f49ba84afa79168b1f569",
//     "ClientReference": "001Test2789",
//     "Status": "Success",
//     "Amount": 1,
//     "CustomerPhoneNumber": "233206447220",
//     "PaymentDetails": {
//       "MobileMoneyNumber": "233206447220",
//       "PaymentType": "mobilemoney",
//       "Channel": "vodafone-gh"
//     },
//     "Description": "The Vodafone Cash payment has been approved and processed successfully"
//   }
// }