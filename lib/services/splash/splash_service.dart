
import 'dart:async';

import 'package:bloc_clean_architecture/config/routes/route_name.dart';
import 'package:flutter/cupertino.dart';

class SplashService{

  void isLogin(BuildContext context){
    Timer(const Duration(seconds: 3),
            () => Navigator.pushNamedAndRemoveUntil(context,RoutesName.login, (route) => false));
  }
}