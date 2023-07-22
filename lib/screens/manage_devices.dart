import 'package:app/screens/add_device.dart';
import 'package:flutter/material.dart';
class Manage extends StatelessWidget {
   Manage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      SafeArea(child:
      Column(
        children: [
          Row(
            children: [
              Text("Mange devices",style: TextStyle(
                fontSize: 30,
                decoration: TextDecoration.underline,
              ),),
              SizedBox(width: 120,),
              FloatingActionButton(onPressed: (){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Add()),
  );
    // ignore: sort_child_properties_last
    },child: Icon(Icons.add),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }
}