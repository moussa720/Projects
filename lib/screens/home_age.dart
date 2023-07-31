import 'package:app/screens/profile._page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      SafeArea(
        child:SingleChildScrollView(child:Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Text("Welcome Home!",style: TextStyle(fontSize: 25,),),
                  SizedBox(width:100,),
                  IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile()));}, icon:Icon(Icons.person,size: 30,)),
                  IconButton(onPressed: (){}, icon:Icon(Icons.notifications,size: 30,))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Center(
                child: Container(
                  width: 300,
                  height: 225,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:Border.all(
                      color: Colors.white,
                      width: 4,
                    ) ,
                  ),
                ),
              ),
            ),
            Text("Quick Access!",
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
            ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: ElevatedButton(onPressed: (){},
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.white),
              ), child:Image(image: AssetImage("assets/card.png",),height: 82,),
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}