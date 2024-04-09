import 'package:chatbot/features/presentation/screens/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:chatbot/features/presentation/screens/splash/splash_screen.dart';

class Routes {
  const Routes._();

  static var page = <GetPage>[
    GetPage(
      name: SplashScreen.route,
      page: () => SplashScreen(),
      transition: Transition.fade,
    ),
    GetPage(
      name: HomeScreen.route,
      page: () => const HomeScreen(),
      transition: Transition.fade,
    ),

  ];
}
