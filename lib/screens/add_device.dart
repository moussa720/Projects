// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class Add extends StatelessWidget {
  const Add({super.key});
  

  @override
  Widget build(BuildContext context) {
    var list=[];
    return Scaffold(
      appBar: AppBar(title: Text("Add device"),),
      body: SafeArea(child:
      Column(
        children: [       
          SizedBox(height: 35,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Sensors",style: TextStyle(
              fontSize: 27,
              color: Colors.purpleAccent,
            ),),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  height: 150,
                  width: 200,
                  child:
                  ElevatedButton(onPressed:(){
                    list.add("smart light");
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white)
                  ),child:Image.asset("assets/lamp.png",
                  height: 90,
                  width: 80,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    height: 150,
                    width: 200,
                    child:ElevatedButton(onPressed:(){
                      list.add("Smart connector");
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                    ),child:
                    Image.asset("assets/smartconnector.png",
                    height: 90,
                    width: 80,
                    ),
                    ),
                  ),
                )
              ],
            ),
          ),
           SizedBox(height: 35,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Lights",style: TextStyle(
              fontSize: 27,
              color: Colors.purpleAccent,
            ),),
          ),
                    SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  height: 150,
                  width: 200,
                  child:
                  ElevatedButton(onPressed:(){},
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white)
                  ),child:Image.asset("assets/lamp.png",
                  height: 90,
                  width: 80,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    height: 150,
                    width: 200,
                    child:ElevatedButton(onPressed:(){},child:
                    Image.asset("assets/smartconnector.png",
                    height: 90,
                    width: 80,
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                    ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      ),
    );
  }
}