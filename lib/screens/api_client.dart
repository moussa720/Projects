import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio = Dio();

  ApiClient() {
    dio.options.baseUrl = 'http://127.0.0.1:8000/';
  }

  Future<String?> login(String username, String password) async {
    try {
      var response = await dio.post('api/login/', data: {
        'username': username,
        'password': password,
      });

      if (response.statusCode == 200) {
        return response.data['token'];
      } else {
        return null;
      }
    } catch (e) {
      print('Error occurred while login: $e');
      return null;
    }
  }

  Future<String?> register(String firstName, String lastName, String username, String email, String password) async {
    try {
      var response = await dio.post('api/register/', data: {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'password': password,
        'username': username,
      });

      if (response.statusCode == 200) {
        return response.data['token'];
      } else {
        return null;
      }
    } catch (e) {
      print('Error occurred while registration: $e');
      return null;
    }
  }
}
