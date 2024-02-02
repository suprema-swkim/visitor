import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visitor/2_data/datasources/local/shared_preference.dart';
import 'package:visitor/2_data/datasources/remote/rest_api.dart';
import 'package:visitor/2_data/models/request/user_request.dart';
import 'package:visitor/2_data/models/response/default_response.dart';

final authRepositoryProvider = ChangeNotifierProvider<AuthRepository>((ref) {
  return AuthRepository(ref);
});

class AuthRepository extends ChangeNotifier {
  final Ref ref;
  final restClient = RestClient(Dio());

  AuthRepository(this.ref);

  /// 토큰 가져오기
  String? getToken() {
    var token = ref.read(sharedPreferencesProvider).getString('token');
    return token;
  }

  /// 토큰 가져오기
  void setToken(String token) {
    ref.read(sharedPreferencesProvider).setString('token', token);
  }

  /// 사용자 로그인
  Future<DefaultResponse> login(UserRequest userRequest) async {
    DefaultResponse result = await restClient.login(userRequest);
    return result;
  }
}
