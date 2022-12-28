import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../component/components.dart';
import '../controller/login_controller_cubit.dart';
import '../controller/login_controller_state.dart';
import '../view/scan_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginControllerCubit, LoginControllerState>(
      listener: (context, state) {
        if (state is LoginControllerSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              state.message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.green,
          ));
          Navigator.of(context).pushNamed(ScanScreen.routeName);
        } else if (state is LoginControllerErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              state.message,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ));
        }
      },
      builder: (context, state) {
        final loginCubit = LoginControllerCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Image.asset(
                        'asssets/images/Ellipse.png',
                      ),
                      Image.asset('asssets/images/Ellipse-1.png'),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: buildDefaultTextFormField(
                        keyBoardType: TextInputType.phone,
                        controller: phoneController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'you must enter phone';
                          }
                          return null;
                        },
                        labelText: 'enter phone'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: buildDefaultTextFormField(
                      isPassword: loginCubit.isPassword,
                      keyBoardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'you must enter phone';
                        }
                        return null;
                      },
                      labelText: 'enter password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          loginCubit.toggleVisibility();
                        },
                        icon: Icon(loginCubit.visibilityIcon),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text('Forget Password?'),
                      )
                    ],
                  ),
                  state is LoginControllerLoadingState
                      ? const CircularProgressIndicator()
                      : defaultButton(
                          onPressed: () {
                            if (!formKey.currentState!.validate()) {
                              return;
                            } else {
                              print(phoneController.text);
                              print(passwordController.text);
                              loginCubit.loginUser(
                                  phone: phoneController.text,
                                  password: passwordController.text);
                            }
                          },
                          buttonTitle: 'Login',
                          color: Colors.deepOrangeAccent)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
