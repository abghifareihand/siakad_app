import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:siakad_app/data/datasources/auth_remote_datasource.dart';
import 'package:siakad_app/data/datasources/request/login_request_model.dart';
import 'package:siakad_app/data/models/auth_response_model.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const _Initial()) {
    on<_Login>((event, emit) async {
     emit(const _Loading());
     final result = await AuthRemoteDatasource().login(event.loginRequest);
      result.fold(
        (error) => emit(_Error(error)),
        (data) => emit(_Loaded(data)),
      );
    });
  }
}
