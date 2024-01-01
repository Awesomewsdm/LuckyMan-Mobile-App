// import 'dart:io';

// import 'package:dio/dio.dart';

// class RetryOnConnectionChangeInterceptor extends Interceptor {
//   @override
//   Future<void> onError(err) async {
//     _shouldRetry(err);
//     // TODO: Schedule a retry
//   }

//   bool _shouldRetry(err) {
//     return err.type == DioExceptionType.connectionError &&
//         err.error != null &&
//         err.error is SocketException;
//   }
// }

// // https://morioh.com/p/bd992784f164