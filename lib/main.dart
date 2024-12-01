import 'package:bloc_clean_architecture/config/routes/route_name.dart';
import 'package:bloc_clean_architecture/config/routes/routes.dart';
import 'package:bloc_clean_architecture/respository/auth_repo/login_http_repository.dart';
import 'package:bloc_clean_architecture/respository/auth_repo/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart'; // Package for dependency injection

GetIt getIt = GetIt.instance;

void main() {
  serviceLocator();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc Clean Architecture',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoute,
    );
  }

}


void serviceLocator(){
  getIt.registerLazySingleton<LoginRepository>(()=>LoginHttpRepository());
}
