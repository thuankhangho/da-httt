import 'package:farm_smass/src/service/AuthService.dart';
import 'package:farm_smass/src/view/HomeView.dart';
import 'package:farm_smass/src/view/LoginView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/UserModel.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<UserModel?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<UserModel?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final UserModel? user = snapshot.data;
          return user == null ? LoginView() : HomeView();
        } else {
          return Scaffold(
              body: Center(
            child: CircularProgressIndicator(),
          ));
        }
      },
    );
  }
}
