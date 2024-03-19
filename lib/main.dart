import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siakad_app/data/datasources/auth_local_datasource.dart';
import 'package:siakad_app/presentation/auth/bloc/login/login_bloc.dart';
import 'package:siakad_app/presentation/auth/pages/auth_page.dart';
import 'package:siakad_app/presentation/dashboard/dashboard_page.dart';
import 'package:siakad_app/presentation/profile/bloc/logout/logout_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(),
        ),
      ],
      child: MaterialApp(
        home: FutureBuilder<bool>(
          future: AuthLocalDatasource().isLogin(),
          builder: (context, snapshot) {
            log("isLogin: //${snapshot.data}");
            if (snapshot.hasData && snapshot.data!) {
              return const DashboardPage(
                currentTab: 0,
              );
            } else {
              return const AuthPage();
            }
          },
        ),
      ),
    );
  }
}
