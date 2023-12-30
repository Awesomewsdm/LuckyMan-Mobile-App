import 'package:luckyman_app/src/constants/exports.dart';

void main() async {
  QR.setUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then(
    (value) => Get.put(
      AuthenticationRepository(),
    ),
  );

  runApp(
    const MyApp(),
  );
}
