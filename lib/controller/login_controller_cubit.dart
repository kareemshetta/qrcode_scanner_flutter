import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import '../models/login_model.dart';
import '../remote_network/dio_helper.dart';
import '../remote_network/end_points.dart';
import 'login_controller_state.dart';
import 'package:flutter/material.dart';

class LoginControllerCubit extends Cubit<LoginControllerState> {
  LoginControllerCubit() : super(LoginControllerInitial());

  static LoginControllerCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  bool isPassword = false;
  IconData visibilityIcon = Icons.visibility_off;
  void toggleVisibility() {
    isPassword = !isPassword;
    visibilityIcon = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(LoginControllerToggleVisibilityState());
  }

  late LoginModel model;

  Future<void> loginUser(
      {required String phone, required String password}) async {
    emit(LoginControllerLoadingState());
    final response = await DioHelper.postData(
        data: {'phone': phone, 'password': password}, url: kLOGINUSER);
    print('response:$response');

    if (response.data['status'] == 1) {
      model = LoginModel.fromJson(response.data);
      token = model.data.token;
      print('tokkkkkk:$token');
      emit(LoginControllerSuccessState(message: response.data['massage']));
    } else {
      emit(LoginControllerErrorState(message: response.data['massage']));
    }
  }
}
