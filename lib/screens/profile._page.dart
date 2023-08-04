import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String username = "";
  String firstName = "";
  String lastName = "";
  String email = "";

  @override
  void initState() {
    super.initState();
    _loadToken();
  }

  _loadToken() async {
    String? accessToken = await getTokenFromSF();
    Map<String, dynamic> decodedToken = JwtDecoder.decode(accessToken ?? "");
    setState(() {
      username = decodedToken["username"][0].toString();
      firstName = decodedToken["first_name"][0].toString();
      lastName = decodedToken["last_name"][0].toString();
      email = decodedToken["email"][0].toString();
    });
  }

  Future<String?> getTokenFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tokenValue = prefs.getString('token');
    return tokenValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ProfilePicture(
                name: 'user',
                radius: 70,
                fontsize: 45,
                img:
                    'https://static.vecteezy.com/system/resources/thumbnails/005/545/335/small/user-sign-icon-person-symbol-human-avatar-isolated-on-white-backogrund-vector.jpg',
              ),
            ),
            SizedBox(height: 16),
            Text(
              "First name:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              firstName,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              "Last name:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
            ),
            Text(
              lastName,
              style: TextStyle(fontSize: 18,),
            ),
            SizedBox(height: 8),
            Text(
              "Username:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              username,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              "Email:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
            ),
            Text(
              email,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
