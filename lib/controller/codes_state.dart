part of 'codes_cubit.dart';

@immutable
abstract class CodesState {}

class CodesInitial extends CodesState {}

class GetCodesSuccessState extends CodesState {}

class GetCodesErrorState extends CodesState {}

class GetCodesLoadingState extends CodesState {}

class PostCodeSuccessState extends CodesState {}

class PostCodeErrorState extends CodesState {
  String message;
  PostCodeErrorState(this.message);
}

class PostCodeLoadingState extends CodesState {}
