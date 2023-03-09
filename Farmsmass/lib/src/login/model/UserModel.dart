import 'package:momentum/momentum.dart';
import 'package:farm_smass/src/login/controller/LoginController.dart';

class UserModel extends MomentumModel<LoginController> {
  UserModel(LoginController controller, {this.email = "", this.pw = ""})
      : super(controller);

  final String? email;
  final String? pw;

  @override
  void update() {
    UserModel(controller).updateMomentum();
  }
}
