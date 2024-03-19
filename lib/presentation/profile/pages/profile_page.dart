import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siakad_app/core/components/button.dart';
import 'package:siakad_app/core/components/dialog.dart';
import 'package:siakad_app/core/components/loading.dart';
import 'package:siakad_app/core/constants/colors.dart';
import 'package:siakad_app/data/datasources/auth_local_datasource.dart';
import 'package:siakad_app/presentation/auth/pages/auth_page.dart';
import 'package:siakad_app/presentation/profile/bloc/logout/logout_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button.primary(
                onPressed: () {
                  context.read<LogoutBloc>().add(const LogoutEvent.logout());
                },
                child: BlocConsumer<LogoutBloc, LogoutState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: () {},
                      error: (message) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return CustomDialog(
                              title: 'Logout Failed',
                              message: message,
                            );
                          },
                        );
                      },
                      loaded: (message) {
                        AuthLocalDatasource().removeAuthData();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const AuthPage();
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
                          'Logout',
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
    );
  }
}
