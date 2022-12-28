import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:qrscanner/models/code_model.dart';
import 'package:qrscanner/models/codes_model.dart';
import 'package:qrscanner/remote_network/dio_helper.dart';
import 'package:qrscanner/remote_network/end_points.dart';

part 'codes_state.dart';

class CodesCubit extends Cubit<CodesState> {
  CodesCubit() : super(CodesInitial());
  static CodesCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  List<Code> codes = [];
  Future<void> getCodes() async {
    emit(GetCodesLoadingState());
    print('tokennnn:$token');
    final response = await DioHelper.getData(url: kMYCODES, token: token);
    if (response.data['status'] == 1) {
      codes = CodesModel.fromJson(response.data).codes;
      print(response.data);
      emit(GetCodesSuccessState());
    } else {
      emit(GetCodesErrorState());
    }
  }

  late CodeModel codeModel;
  Future<void> addCode({required code}) async {
    print('tokennnn:$token');
    emit(PostCodeLoadingState());
    final response = await DioHelper.postData(
      token: token,
      url: kSCAN,
      data: {'code': code},
    );
    print(response.data);
    if (response.data['status'] == 1) {
      codeModel = CodeModel.fromJson(response.data);
      emit(PostCodeSuccessState());
    } else {
      emit(PostCodeErrorState(response.data['massage']));
    }
  }
}
