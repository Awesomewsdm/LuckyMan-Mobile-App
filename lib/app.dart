import 'package:luckyman_app/src/constants/exports.dart';

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
      routeInformationParser: const QRouteInformationParser(),
      routerDelegate: QRouterDelegate(Routes.routes, initPath: "/"),
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
