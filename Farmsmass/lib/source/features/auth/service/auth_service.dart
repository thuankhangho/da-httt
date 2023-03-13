import 'package:farm_smass/source/features/auth/model/user_model.dart';
import 'package:farm_smass/source/features/auth/provider/firebase_provider.dart';
import 'package:farm_smass/source/utils/constants/firebase_constants.dart';
import 'package:farm_smass/source/utils/failure_message.dart';
import 'package:farm_smass/source/utils/type_defs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod/riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final AuthServiceProvider = Provider((ref) {
  return AuthService(
      auth: ref.read(authProvider), firestore: ref.read(firestoreProvider));
});

class AuthService {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  late UserModel userModel;
  AuthService(
      {required FirebaseAuth auth, required FirebaseFirestore firestore})
      : _auth = auth,
        _firestore = firestore;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);

  Stream<UserModel> getUserData(String uid) {
    return _users
        .doc(uid)
        .snapshots()
        .map((event) => UserModel.fromMap(event.data() as dynamic));
  }

  Stream<User?> get authStateChange => _auth.authStateChanges();

  FutureEither<UserModel> signInWithMail(String email, String pw) async {
    try {
      final UserCred =
          await _auth.signInWithEmailAndPassword(email: email, password: pw);
      print(UserCred.user!.uid!);
      if (UserCred.additionalUserInfo!.isNewUser) {
        UserModel userModel = UserModel(
            name: UserCred.user!.displayName ?? 'User',
            email: UserCred.user!.email!,
            uid: UserCred.user!.uid,
            isRegistered: true);

        await _users.doc(UserCred.user!.uid).set(userModel.toMap());
      } else {
        userModel = await getUserData(UserCred.user!.uid).first;
        print(userModel.name);
      }
      return right(userModel);
    } catch (e) {
      return left(FailureMessage(e.toString()));
    }
  }

  void signOut() async {
    await _auth.signOut();
  }
}
