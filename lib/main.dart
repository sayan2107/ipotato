import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ipotato_timer/constants/strings.dart';
import 'package:ipotato_timer/stores/timer_store.dart';
import 'package:ipotato_timer/theme/colors.dart';
import 'package:ipotato_timer/ui/splash/splash.dart';
import 'package:ipotato_timer/utils/routes/navigation.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setPreferredOrientations();
  runApp(const MyApp());
}

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MultiTimer>(create: (_) => MultiTimer()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.darkGreen,
            centerTitle: false,
          ),
        ),
        onGenerateRoute: (RouteSettings settings) {
          final String? name = settings.name;
          final WidgetBuilder? builder = dialogRoutes[name];
          if (builder != null) {
            return MaterialPageRoute<dynamic>(
              builder: builder,
              settings: settings,
              fullscreenDialog: true,
            );
          }
          return null;
        },
        routes: routes,
        title: Strings.appName,
        home: const SplashScreen(),
      ),
    );
  }
}
