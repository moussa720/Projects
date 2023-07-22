import 'package:flutter/material.dart';

class Confirmation extends StatelessWidget {
  const Confirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Column(
        children: [
          TextField(
            obscureText: false,
            decoration:InputDecoration(
              border: OutlineInputBorder(),
              label: Text("Enter The code"),
            )
          )
        ],
      )
      ,
    );
  }
}