import 'package:chatbot/features/presentation/blocs/splash/splash_bloc.dart';
import 'package:chatbot/features/presentation/components/utility/app_theme.dart';
import 'package:chatbot/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/common/constants/pref_constants.dart';
import 'features/di/InjectionContainer.dart';
import 'features/presentation/screens/home/home_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  late final SharedPreferences pref = sl<SharedPreferences>();
  final routeObserver = Get.put<RouteObserver>(RouteObserver<PageRoute>());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    final bool? isDarkMode = pref.getBool(Constants.keyTheme);

    return MultiBlocProvider(
        providers: [
          BlocProvider<SplashBloc>(create: (context) => sl<SplashBloc>()),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorObservers: <NavigatorObserver>[routeObserver],

          ///THEME CONFIGURATION
          theme: CreateTheme.lightTheme,
          darkTheme: CreateTheme.darkTheme,
          themeMode: isDarkMode == null
              ? ThemeMode.system
              : isDarkMode
              ? ThemeMode.dark
              : ThemeMode.light,

          ///END THEME CONFIGURATION
          ///
          ///ROUTING
          navigatorKey: _navigatorKey,
          initialRoute: HomeScreen.route,
          getPages: Routes.page,
          ///END ROUTING
          ///
          /// LOCALIZATION
          /// will reset if we don't save to local storage
          locale: Get.locale,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],

          ///END LOCALIZATION
          //noted: if need custom snackbar or other
          builder: (context, child) {
            return child!;
          },
        ));
  }
}