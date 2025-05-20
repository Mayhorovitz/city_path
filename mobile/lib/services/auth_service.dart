import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  static const String baseUrl = 'http://10.0.2.2:3000';

  static Future<bool> sendRegisterRequest(String emailOrPhone) async {
    final url = Uri.parse('$baseUrl/api/auth/register');

    final body = {"phone": emailOrPhone, "email": emailOrPhone};

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print("Error: ${response.body}");
      return false;
    }
  }

  static Future<bool> verifyCode(String phoneOrEmail, String code) async {
    final url = Uri.parse('$baseUrl/api/auth/verify');

    final body = {"phone": phoneOrEmail, "code": code};

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    return response.statusCode == 200;
  }
}
