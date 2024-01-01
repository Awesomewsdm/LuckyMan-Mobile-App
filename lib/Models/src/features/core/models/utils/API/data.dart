import 'package:luckyman_app/src/features/core/models/utils/API/api_request.dart';

void main() {
  APIResponseData()
      .getResponseData(20, "returnUrl", "tokenID", "clientReference");
}
