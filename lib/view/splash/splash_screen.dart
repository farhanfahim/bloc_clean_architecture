
import 'package:flutter/material.dart';

import '../../services/splash/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final SplashService _splashService = SplashService();

  @override
  void initState() {
    super.initState();
    _splashService.isLogin(context);
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "splashScreen",
        ),
      ),
    );
  }
}
