//2 routes, login and logout

import 'package:farm_smass/source/features/auth/view/login_view.dart';
import 'package:farm_smass/source/features/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute = RouteMap(routes: {
  '/': (_) => MaterialPage(child: LoginView()),
});

final loggedInRoute = RouteMap(routes: {
  '/': (_) => MaterialPage(child: HomeView()),
});
