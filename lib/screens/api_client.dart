import 'package:dio/dio.dart';
class ApiClient{
  final Dio dio=Dio();
  ApiClient()
  {
    dio.options.baseUrl='http://127.0.0.1:8000/';
  }
  Future<String?>login(String username,String password)async{
  var response=await dio.post('/login/',data: {
    'username':username,
    'password':password,
  });
  if (response.statusCode==200){
    return response.data['token'];
  }
  else
  {
  return null;
  }
  }
  Future<String?> register(String firstName, String lastName,String username,String email,String password) async {
  var response = await dio.post('/register/', data: {
    'First Name': firstName,
    'Last Name': lastName,
    'Username' :username,
    'Email':email,
    'Password':password,
  });

  if (response.statusCode == 200) {
    return response.data['token'];
  } else {
    return null;
  }
}
}