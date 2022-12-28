abstract class LoginControllerState {}

class LoginControllerInitial extends LoginControllerState {}

class LoginControllerLoadingState extends LoginControllerState {}

class LoginControllerSuccessState extends LoginControllerState {
  String message;
  LoginControllerSuccessState({required this.message});
}

class LoginControllerErrorState extends LoginControllerState {
  String message;
  LoginControllerErrorState({required this.message});
}

class LoginControllerToggleVisibilityState extends LoginControllerState {}
