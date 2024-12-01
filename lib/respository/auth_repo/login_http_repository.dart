
import 'package:bloc_clean_architecture/data/network/network_api_service.dart';
import 'package:bloc_clean_architecture/utils/app_url.dart';
import '../../models/user/user_model.dart';
import 'login_repository.dart';

class LoginHttpRepository implements LoginRepository{
  final api = NetworkApiService();

  @override
  Future<UserModel> loginApi(data) async {
    var response = await api.postApi(AppUrl.loginEndPint, data);
    return UserModel.fromJson(response);
  }
}