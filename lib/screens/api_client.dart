import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  final Dio dio;

  ApiClient() : dio = Dio() {
    _setupBaseOptions();
  }

  void _setupBaseOptions() {
    dio.options.baseUrl = 'http://127.0.0.1:8000/'; 
    dio.options.connectTimeout = Duration(seconds: 5); 
    dio.options.receiveTimeout = Duration(seconds: 3); 
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
  }

  Future<String?> login(String username, String password) async {
    try {
      var response = await dio.post('api/login/', data: {
        'username': username,
        'password': password,
      });

      if (response.statusCode == 200) {
        var token = response.data["access"];
        await _saveTokenToSF(token.toString());

        print("response $token");
        return response.data.toString();
      } else {
        return null;
      }
    } catch (e) {
      print('Error occurred while login: $e');
      return null;
    }
  }

  Future<void> _saveTokenToSF(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token.toString());
  }

  Future<String?> register(
    String firstName,
    String lastName,
    String username,
    String email,
    String password,
  ) async {
    try {
      var response = await dio.post('api/register/', data: {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'password': password,
        'username': username,
      });

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      print('Error occurred while registration: $e');
      return null;
    }
  }
}
