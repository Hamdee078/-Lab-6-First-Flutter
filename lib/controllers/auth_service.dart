import 'dart:convert';
import 'package:flutter_application_1/varbles.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<void> login(String username, String password) async {
    print(apiURL);

    final response = await http.post(Uri.parse("$apiURL/api/auth/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(
          {
           "user_name" :"username",
           "password" :"password"
 
}
        ));
    print(response.statusCode);
  }
}