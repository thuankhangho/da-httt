import 'package:momentum/momentum.dart';
import 'package:farm_smass/src/model/UserModel.dart';

class LoginController extends MomentumController<UserModel> {
  @override
  UserModel init() {
    return UserModel(
      this,
    );
  }
}
