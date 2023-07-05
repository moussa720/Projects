import 'package:app/screens/login_screen.dart';
import 'package:flutter/material.dart';
class Signup extends StatelessWidget {
  

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
                label:Text("Full Name",style: TextStyle(color: Colors.white),
                )
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(obscureText: false,
                decoration: InputDecoration(border: OutlineInputBorder(),
                label:Text("Email",style: TextStyle(color: Colors.white),
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
                label:Text("Confirm password",style: TextStyle(color: Colors.white),)),
                ),
              ),
              ElevatedButton(onPressed: (){}, child:Text("Sign up")),
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