import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'profile._page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<String?> locationFuture;

  @override
  void initState() {
    super.initState();
    locationFuture = getLocation();
  }

  Future<String?> getLocation() async {
    if (await Permission.location.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      String? cityName =
          placemarks.isNotEmpty ? placemarks[0].locality : 'Location not available';
      return cityName;
    } else {
      var permissionStatus = await Permission.location.request();
      if (permissionStatus.isGranted) {
        return getLocation(); 
      } else {
        return 'Location permission not granted';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome Home!",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Profile()),
                          );
                        },
                        icon: Icon(Icons.person, size: 30),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.notifications, size: 30),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Center(
                  child: Container(
                    width: 300,
                    height: 225,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                    ),
                    child: FutureBuilder<String?>(
                      future: locationFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error loading location');
                        } else {
                          String cityName = snapshot.data ?? 'Location not available';
                          return Center(
                            child: 
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.location_city),
                                Text(
                                  cityName,
                                  style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
              Text(
                "Quick Access!",
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Image(
                    image: AssetImage("assets/card.png"),
                    height: 82,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}