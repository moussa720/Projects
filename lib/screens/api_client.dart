import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  ApiClient() : dio = Dio() {
    _setupBaseOptions();
  }
  final Duration x=Duration(seconds: 5);
  final Duration y=Duration(seconds: 3);
  void _setupBaseOptions() {
    dio.options.baseUrl = 'http://127.0.0.1:8000/';

    dio.options.connectTimeout =x; // 5 seconds
    dio.options.receiveTimeout =y; // 3 seconds
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
        print("aaaaa");
        print(response.data);
        return response.data;
      } else {
        return null;
      }
      
    } catch (e) {
      print('Error occurred while login: $e');
      return null;
    }
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
