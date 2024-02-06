import 'package:weather_app_flutter/search_screen.dart';
import 'package:flutter/material.dart';

import '../home_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getAppRoutes() {
    return {
      '/home': (context) => HomeScreen(),
      '/search': (context) => SearchScreen(),
      // Otras rutas si las tienes
    };
  }
}
