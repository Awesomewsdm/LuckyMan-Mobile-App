import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:luckyman_app/src/constants/alert.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';
import 'src/features/core/models/Routes_model/routes2.dart';
import 'src/features/core/models/utils/Networking/network_status.dart';
import 'src/features/core/models/utils/dynamic_links.dart';
import 'src/repository/authentification/authentification_repository.dart';

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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map _source = {ConnectivityResult.none: false};

  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;
  
  String string = '';

  @override
  void initState() {
    super.initState();

    DynamicLinkProvider().initDynamicLinks();

    _networkConnectivity.initialise();

    _networkConnectivity.myStream.listen((source) {
      _source = source;
      switch (_source.keys.toList()[0]) {
        case ConnectivityResult.mobile:
          string = _source.values.toList()[0] ? 'Online' : 'Offline';
          break;
        case ConnectivityResult.wifi:
          string = _source.values.toList()[0] ? 'Online' : 'Offline';
          break;
        case ConnectivityResult.none:
        default:
          alert("No connection available",
              "Please turn on mobile data or Wifi to continue");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(
          250,
          250,
          250,
          1,
        ),
      ),
      routeInformationParser: const QRouteInformationParser(),
      routerDelegate: QRouterDelegate(Routes.routes, initPath: "/"),
      // initialRoute: SplashScreen.id,
      // routes: <String, WidgetBuilder>{
      //   SplashScreen.id: (context) => const SplashScreen(),
      //   HomeScreen.id: (context) =>const HomeScreen(),
      //   BusTicketScreen.id: (context) => BusTicketScreen(),
      //   SeatSelectionScreen.id: (context) => SeatSelectionScreen(),
      //   // PaymentPage.id: (context) => PaymentPage(),
      //   BusBookingScreen.id: (context) =>  BusBookingScreen(),
      //   PasswordResetScreen.id: (context) => PasswordResetScreen(),
      // },
    );
  }

  @override
  void dispose() {
    _networkConnectivity.disposeStream();
    super.dispose();
  }
}


// Variant: debug
// Config: debug
// Store: C:\Users\aweso\.android\debug.keystore
// Alias: AndroidDebugKey
// MD5: A6:CA:71:F2:D4:34:09:5A:C8:A4:21:CE:40:C2:03:CD
// SHA1: 47:A6:5F:5C:10:0A:8D:C0:81:72:0D:CB:DF:86:CF:DC:2B:4D:CF:E3
// SHA-256: D9:C0:8C:7F:0E:C9:74:20:5B:B1:50:7B:B1:AA:61:3E:7D:6C:B8:7D:1B:74:2F:E2:99:8A:92:55:D8:36:6E:45
// Valid until: Wednesday, December 13, 2051

// routes: <String, WidgetBuilder>{
//       '/': (BuildContext context) => MyApp(),
//       '/helloworld': (BuildContext context) => LinkPage(),
//     },

//  String _linkMessage;
//   bool _isCreatingLink = false;
//   String _testString =
//       "To test: long press link and then copy and click from a non-browser "
//       "app. Make sure this isn't being tested on iOS simulator and iOS xcode "
//       "is properly setup. Look at firebase_dynamic_links/README.md for more "
//       "details.";

//   @override
//   void initState() {
//     super.initState();
//     initDynamicLinks(); //
//   }


// Future<void> _createDynamicLink(bool short) async {
//     setState(() {
//       _isCreatingLink = true;
//     });

//     final DynamicLinkParameters parameters = DynamicLinkParameters(
//       uriPrefix: 'http://cx4k7.app.goo.gl',
//       link: Uri.parse('My http url'),
//       androidParameters: AndroidParameters(
//         packageName: 'my package id/name',
//         minimumVersion: 0,
//       ),
//       dynamicLinkParametersOptions: DynamicLinkParametersOptions(
//         shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
//       ),
//     );

//     Uri url;
//     if (short) {
//       final ShortDynamicLink shortLink = await parameters.buildShortLink();
//       url = shortLink.shortUrl;
//     } else {
//       url = await parameters.buildUrl();
//     }

//     setState(() {
//       _linkMessage = url.toString();
//       _isCreatingLink = false;
//     });
//   }

