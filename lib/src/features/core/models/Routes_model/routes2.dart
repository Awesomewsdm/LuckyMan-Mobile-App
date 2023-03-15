
import 'package:luckyman_app/src/common_widgets/bottom_nav/bottom_nav.dart' deferred as home;
import 'package:luckyman_app/src/features/core/screens/splash_screen.dart';
import 'package:qlevar_router/qlevar_router.dart';

import 'deffered_loader.dart';

class Routes {
  static final routes = <QRoute>[
    QRoute(path: '/', builder: () => const SplashScreen()),
    QRoute(
      path: '/home',
      builder: () =>  home.Home(),
      middleware: [
        DefferedLoader(home.loadLibrary),
      ],
    ),
  ];
}