import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:siakad_app/core/constants/variables.dart';
import 'package:siakad_app/data/datasources/auth_local_datasource.dart';
import 'package:siakad_app/data/datasources/request/login_request_model.dart';
import 'package:siakad_app/data/models/auth_response_model.dart';

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> login(
      LoginRequestModel loginRequest) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/login'),
      headers: headers,
      body: loginRequest.toJson(),
    );

    log('Request Login : ${loginRequest.toJson()}');
    log('Response Login : ${response.body}');

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      final errorMessage = jsonDecode(response.body)['message'];
      return Left(errorMessage);
    }
  }

  Future<Either<String, String>> logout() async {
    final token = await AuthLocalDatasource().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/logout'),
      headers: headers,
    );

    log('Response Logout : ${response.body}');

    if (response.statusCode == 200) {
      final successMessage = jsonDecode(response.body)['message'];
      return Right(successMessage);
    } else {
      final errorMessage = jsonDecode(response.body)['message'];
      return Left(errorMessage);
    }
  }
}
