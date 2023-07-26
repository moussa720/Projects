import 'package:app/screens/api_client.dart';
import 'package:app/screens/login_screen.dart';
import 'package:flutter/material.dart';
class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
final ApiClient apiClient=ApiClient();

final TextEditingController firstNameController=TextEditingController();

final TextEditingController lastNameController=TextEditingController();

final TextEditingController usernameController=TextEditingController();

final TextEditingController emailController=TextEditingController();

final TextEditingController passwordController=TextEditingController();

void handleSignup()async{
  String firstName=firstNameController.text;
  String lastName=lastNameController.text;
  String username=usernameController.text.trim();
  String email=emailController.text.trim();
  String password=passwordController.text.trim();
  String? token=await apiClient.register(firstName,lastName,username,email,password);
  if(token !=null){
    print('Registration was successful!Token:$token');
    // ignore: use_build_context_synchronously
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
  }
  else{
    print('Registration failed. Please try again');
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
                padding: const EdgeInsets.all(15.0),
                child: Text("Sign Up",style: TextStyle(fontSize: 40,color: Colors.white),),
              ),
                Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(obscureText: false,
                decoration: InputDecoration(border: OutlineInputBorder(),
                label:Text("First Name",style: TextStyle(color: Colors.white),
                )
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(obscureText: false,
                decoration: InputDecoration(border: OutlineInputBorder(),
                label:Text("Last Name",style: TextStyle(color: Colors.white),
                )
                ),
                ),
              ),
                            Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(obscureText: false,
                decoration: InputDecoration(border: OutlineInputBorder(),
                label:Text("Username",style: TextStyle(color: Colors.white),)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  obscureText: true,
                decoration: InputDecoration(border: OutlineInputBorder(),
                label:Text("password",style: TextStyle(color: Colors.white),)),
                ),
              ),
                Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  obscureText: true,
                decoration: InputDecoration(border: OutlineInputBorder(),
                label:Text("email",style: TextStyle(color: Colors.white),)),
                ),
              ),
              ElevatedButton(onPressed:handleSignup, child:Text("Sign up")),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("you have an account ?",style: TextStyle(fontSize: 14,color: Colors.white)),
                  TextButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
}, child: Text("login",style:TextStyle(fontSize: 14,color: Colors.purple),))
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