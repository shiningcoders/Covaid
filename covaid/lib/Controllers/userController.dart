import 'package:covaid/Models/userModel.dart';
import 'package:covaid/Services/authentication.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class UserController extends GetxController {
  UserModel _user;
  AuthServices _authMethods = AuthServices();

  UserModel get getUser => _user;

  Future<void> refreshUser() async {
    UserModel user = await _authMethods.getUserDetails();
    _user = user;
  }
}
