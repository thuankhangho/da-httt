import 'package:firebase_auth/firebase_auth.dart';
import '../model/UserModel.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future LoginWithMail(String email, String pw) async {
    try {
      UserCredential userCred = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pw);
      User? user = userCred.user;
      return _firebaseUser(user);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  UserModel? _firebaseUser(User? user) {
    return user != null ? UserModel(email: user.email, uid: user.uid) : null;
  }

  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_firebaseUser);
  }

  Future SignOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
