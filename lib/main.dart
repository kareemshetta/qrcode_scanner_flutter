import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrscanner/controller/codes_cubit.dart';
import 'package:qrscanner/view/codes_screen.dart';
import 'package:qrscanner/view/login_screen.dart';
import 'package:qrscanner/view/scan_screen.dart';
import '../remote_network/dio_helper.dart';

import 'controller/login_controller_cubit.dart';
import 'controller/observer_cubit.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var tokenn = '';
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginControllerCubit(),
        ),
        BlocProvider(
          create: (context) => CodesCubit(),
        ),
      ],
      child: MaterialApp(
          title: 'QR Scanner',
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
          home: LoginScreen(),
          routes: {
            ScanScreen.routeName: (ctx) => ScanScreen(),
            CodesScreen.routeName: (ctx) => CodesScreen()
          }),
    );
  }
}
