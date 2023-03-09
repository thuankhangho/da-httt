import 'package:momentum/momentum.dart';
import 'package:farm_smass/src/login/model/UserModel.dart';

class LoginController extends MomentumController<UserModel> {
  LoginController(LoginController controller);

  @override
  UserModel init() {
    return UserModel(
      this,
    );
  }
}
