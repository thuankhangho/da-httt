import 'package:farm_smass/src/wrapper.dart';
import 'package:flutter/material.dart';
import '../src/view/HomeView.dart';
import '../src/view/LoginView.dart';

class Routers {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'wrapper':
        return MaterialPageRoute(builder: (_) => Wrapper());
      case 'home':
        return MaterialPageRoute(builder: (_) => HomeView());
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginView());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
