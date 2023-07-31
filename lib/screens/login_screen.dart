import 'package:app/screens/navigation_bar.dart';
import 'package:app/screens/signup.dart';
import 'package:flutter/material.dart';
import 'forgot_password.dart';
import 'api_client.dart';
class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final ApiClient apiClient = ApiClient();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleLogin() async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter both username and password.')),
      );
      return;
    }
    String? token = await apiClient.login(username, password);


    if (token != null) {
      print('Login successful! Token: $token');
       // ignore: use_build_context_synchronously
       Navigator.of(context).push(MaterialPageRoute(builder: (context) => ButtomNavigationBar()));
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid username or password. Please try again.')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      SafeArea(child: 
      Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Text("Login",style: TextStyle(fontSize: 40,color: Colors.white),),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  controller: usernameController,
                  obscureText: false,
                decoration: InputDecoration(border: OutlineInputBorder(),
                label:Text("username",style: TextStyle(color: Colors.white),
                )
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                decoration: InputDecoration(border: OutlineInputBorder(),
                label:Text("password",style: TextStyle(color: Colors.white),)),
                ),
              ),
              ElevatedButton(onPressed:handleLogin, child:Text("Login")),
              TextButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForgotPassword()));
              }, child: Text("Forgot password!",style: TextStyle(fontSize: 15,color: Colors.white),),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("you don't have an account ?",style: TextStyle(fontSize: 14,color: Colors.white)),
                  TextButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => Signup()));
                    }, 
                  child: Text("register",style:TextStyle(fontSize: 14,color: Colors.purple),))
                ],
                
              ),
              ],
          ),
        ),
      ),
      ),
    );
  }
}