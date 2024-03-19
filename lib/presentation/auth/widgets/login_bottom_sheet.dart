import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siakad_app/core/components/button.dart';
import 'package:siakad_app/core/components/button_gradient.dart';
import 'package:siakad_app/core/components/dialog.dart';
import 'package:siakad_app/core/components/input_field.dart';
import 'package:siakad_app/core/components/loading.dart';
import 'package:siakad_app/core/components/spaces.dart';
import 'package:siakad_app/core/constants/colors.dart';
import 'package:siakad_app/data/datasources/auth_local_datasource.dart';
import 'package:siakad_app/data/datasources/request/login_request_model.dart';
import 'package:siakad_app/presentation/auth/bloc/login/login_bloc.dart';
import 'package:siakad_app/presentation/dashboard/dashboard_page.dart';

class LoginBottomSheet extends StatefulWidget {
  const LoginBottomSheet({super.key});

  @override
  State<LoginBottomSheet> createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 40,
        right: 20,
        left: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InputField.email(
            label: 'Email',
            controller: _emailController,
          ),
          InputField.password(
            label: 'Password',
            controller: _passwordController,
          ),
          const SpaceHeight(20.0),
          Button.primary(
            onPressed: () {
              final loginRequest = LoginRequestModel(
                email: _emailController.text,
                password: _passwordController.text,
              );
              context.read<LoginBloc>().add(LoginEvent.login(loginRequest));
            },
            child: BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  error: (message) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CustomDialog(
                          title: 'Login Failed',
                          message: message,
                        );
                      },
                    );
                  },
                  loaded: (authResponse) {
                    AuthLocalDatasource().saveAuthData(authResponse);
                    if (authResponse.data.user.roles == 'mahasiswa') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const DashboardPage(currentTab: 0);
                          },
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const CustomDialog(
                            title: 'Login Failed',
                            message: 'Hanya mahasiswa yang berhak login',
                          );
                        },
                      );
                    }
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return Text(
                      'Login',
                      style: whiteTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    );
                  },
                  loading: () {
                    return const LoadingSpinkit();
                  },
                );
              },
            ),
          ),
          const SpaceHeight(32.0),
        ],
      ),
    );
  }
}
