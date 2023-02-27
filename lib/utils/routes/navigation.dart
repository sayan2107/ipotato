import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:ipotato_timer/ui/add_task/add_task.dart';
import 'package:ipotato_timer/ui/home/home.dart';
import 'package:ipotato_timer/ui/splash/splash.dart';

class Navigation {
  const Navigation(this.primaryNavigator);

  final GlobalKey<NavigatorState> primaryNavigator;

  void navigateTo(
      String route, {
        bool replace = false,
        GlobalKey<NavigatorState>? navigatorKey,
        Object? arguments,
      }) {
    final navigator = navigatorKey ?? primaryNavigator;

    if (replace) {
      navigator.currentState!.pushReplacementNamed(
        route,
        arguments: arguments,
      );
    } else {
      navigator.currentState!.pushNamed(
        route,
        arguments: arguments,
      );
    }
  }

  bool goBack() {
    if (primaryNavigator.currentState!.canPop()) {
      primaryNavigator.currentState!.pop();
      return true;
    }
    return false;
  }

  void forceBack() {
    if (!goBack()) {
      SystemNavigator.pop();
    }
  }

  void replaceAll(
      String route, {
        Object? arguments,
      }) {
    primaryNavigator.currentState!.pushNamedAndRemoveUntil(
      route,
          (route) => false,
      arguments: arguments,
    );
  }

  bool popUntil(
      String route, {
        Object? arguments,
      }) {
    bool isRouteInNavigation = false;

    primaryNavigator.currentState!.pushNamedAndRemoveUntil(
      '/',
          (current) => isRouteInNavigation = current.settings.name == route,
      arguments: arguments,
    );

    if (isRouteInNavigation) {
      primaryNavigator.currentState!.pop();
    }

    return isRouteInNavigation;
  }

  void pushAndPopUntil(
      String section, {
        required String route,
        Object? arguments,
      }) {
    bool lastRouteToPop = false;

    primaryNavigator.currentState!.pushNamedAndRemoveUntil(
      route,
          (current) {
        if (lastRouteToPop) {
          return true;
        } else {
          lastRouteToPop = current.settings.name == section;
          return false;
        }
      },
      arguments: arguments,
    );
  }

  void popToAndRemove(String route) {
    while (primaryNavigator.currentState!.canPop() &&
        currentRoute.startsWith(route)) {
      primaryNavigator.currentState!.pop();
    }
  }

  String get currentRoute {
    late Route<dynamic> currentRoute;
    primaryNavigator.currentState!.popUntil((route) {
      currentRoute = route;
      return true;
    });

    return currentRoute.settings.name!;
  }
}

Map<String, WidgetBuilder> _routes(Map<String, Widget> routes) => routes.map(
      (route, child) => MapEntry(
    route,
        (_) => child,
  ),
);

Map<String, WidgetBuilder> get routes {
  return _routes({
    HomeScreen.route: const HomeScreen(),
    SplashScreen.route: const SplashScreen(),
    }
  );
}

Map<String, WidgetBuilder> get dialogRoutes {
  return _routes({
    AddTaskScreen.route: const AddTaskScreen(),
  });
}

String? getPageName(String? route) => route?.split('/').last;

