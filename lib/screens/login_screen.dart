import 'package:app/screens/navigation_bar.dart';
import 'package:app/screens/signup.dart';
import 'package:flutter/material.dart';
class Login extends StatelessWidget {
  

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
                  obscureText: true,
                decoration: InputDecoration(border: OutlineInputBorder(),
                label:Text("password",style: TextStyle(color: Colors.white),)),
                ),
              ),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ButtomNavigationBar()));
              }, child:Text("Login")),
              TextButton(onPressed: (){}, child: Text("Forgot password!",style: TextStyle(fontSize: 15,color: Colors.white),),),
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