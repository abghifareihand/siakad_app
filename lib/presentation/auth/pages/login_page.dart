import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siakad_app/core/components/button_gradient.dart';
import 'package:siakad_app/core/components/dialog.dart';
import 'package:siakad_app/core/components/input_field.dart';
import 'package:siakad_app/core/components/loading.dart';
import 'package:siakad_app/core/components/spaces.dart';
import 'package:siakad_app/core/constants/colors.dart';
import 'package:siakad_app/data/datasources/request/login_request_model.dart';
import 'package:siakad_app/presentation/auth/bloc/login/login_bloc.dart';
import 'package:siakad_app/presentation/dashboard/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/bg.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 300,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/orangbuku.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 50,
                    left: 20,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 30,
                    ),
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
                      MyElevatedButton(
                        onPressed: () {
                          final loginRequest = LoginRequestModel(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                          context
                              .read<LoginBloc>()
                              .add(LoginEvent.login(loginRequest));
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
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const DashboardPage(currentTab: 0);
                                    },
                                  ),
                                );
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
