import 'package:farm_smass/src/model/UserModel.dart';
import 'package:farm_smass/src/service/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Hello'),
          /*TextButton(
            onPressed: () async {
              await authService.LogOut();
            },
            child: Text(
              'Logout',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),*/
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: TextButton(
              onPressed: () async {
                await authService.LogOut();
              },
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
