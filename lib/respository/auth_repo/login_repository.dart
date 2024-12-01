import '../../models/user/user_model.dart';

abstract class LoginRepository{
  Future<UserModel> loginApi(data);
}