import 'package:momentum/momentum.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/UserModel.dart';

class AuthService extends MomentumService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future LoginWithMail(UserModel _login) async {
    try {
      UserCredential userCred = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _login.email.toString(), password: _login.pw.toString());
      User? user = userCred.user;
      return user;
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
