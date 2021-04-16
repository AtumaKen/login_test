import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_test/models/request/auth_request.dart';
import 'package:login_test/models/response/auth_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String _authority = "easycredit.ng";
  String _path = "/mobile_conn48728364277323/register_new_client273844432.php";

  Future<SignUpResponseModel> signUpReq(SignUpRequestModel signUpModel) async {
    print(signUpModel.toString());
    String error;
    final uri = Uri.https(
      _authority,
      _path,
    );
    final response = await http.post(uri,
        body: jsonEncode({
          "lname": signUpModel.lastName,
          "name": signUpModel.firstName,
          "phone": signUpModel.phone,
          "email": signUpModel.email,
          "pass1": signUpModel.password,
          "pass2": signUpModel.confirmPassword
        }));

    try {
      error = json.decode(response.body).toString();
      final prefs = await SharedPreferences.getInstance();
      prefs.clear();
      final responoseData = json.decode(response.body);
      print(responoseData);
    } catch (error) {
      throw error;
    }
    return SignUpResponseModel(token: "token", id: "id");
  }
}
