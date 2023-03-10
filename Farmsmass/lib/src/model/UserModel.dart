import 'package:flutter/material.dart';

import '../controller/LoginController.dart';

class UserModel extends ChangeNotifier {
  final String? email;
  final String? uid;
  UserModel({this.email, this.uid});
}
