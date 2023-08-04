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
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
                SizedBox(height: 30),
                TextField(
                  controller: usernameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Username",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(onPressed: handleLogin, child: Text("Login")),
                SizedBox(height: 15),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgotPassword()));
                  },
                  child: Text(
                    "Forgot password!",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Signup()));
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(fontSize: 14, color: Colors.purple),
                      ),
                    )
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
