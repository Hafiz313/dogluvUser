import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class ApiService {
  String loginUrl = "https://construction.bazaaaar.com/signin.php";

 /* Future<LoginModel> createLogin(String email, String password) async {
    final response = await http.post(loginUrl, body: {"email": email, "password": password});
    if (response.statusCode == 200) {
      final String responseString = response.body;
      print("-----------------LoginResponse (lognin screen) ${response.body}------------------");
      return loginModelFromJson(responseString);
    }  else {
      throw Exception('Failed to load data.');
    }
  }*/



}
