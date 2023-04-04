import 'package:flutter/material.dart';
import 'package:login_app/pages/home.dart';
import 'package:login_app/pages/login.dart';
import 'package:login_app/provider/login_provider.dart';
import 'package:login_app/services/login_service.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'package:login_app/base_resource/base_path.dart' as basePath;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final dio = Dio();
  final loginService = LoginService(Dio());
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(loginService),
      child: MaterialApp(home: LoginScreen()),
    );
  }
}
