import 'package:flutter/foundation.dart';
import 'package:login_test/models/request/auth_request.dart';
import 'package:login_test/models/response/auth_response.dart';
import 'package:login_test/service/auth_service.dart';

class AuthProvider with ChangeNotifier{
  String _token;
  AuthService _authService;

  String get token => _token;

  AuthProvider(){
    intiStreams();
  }
  void intiStreams(){
    _token = "empty";
    _authService = AuthService();
  }
   Future<void> trySignUp(SignUpRequestModel signUpModel) async{
    SignUpResponseModel signUpResponseModel = await _authService.signUpReq(signUpModel);
    _token = signUpResponseModel.token;
  }
}