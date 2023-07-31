import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recover password"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Recover Password",
            style: TextStyle(
              fontSize: 45,
            ),
            ),

            Padding(
              padding: const EdgeInsets.all(40.0),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(border: OutlineInputBorder(),
                label: Text("Enter your email"),
                ),
              ),
            ),
            SizedBox(
              height: 55,
              width: 90,
              child: ElevatedButton(onPressed: (
                // Within the `FirstRoute` widget
              ){

              }, child: Text("submit"))),
          ],
        ),
      ),
    );
  }
}