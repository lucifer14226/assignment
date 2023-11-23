import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.teal,
      ),
      body: const Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                  "https://staticg.sportskeeda.com/editor/2022/02/1c278-16445697991264-1920.jpg"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Icon(Icons.edit),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.person,
                    size: 30,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Account",
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.locationArrow,
                    size: 30,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Places",
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.support,
                    size: 30,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Column(
                      children: [
                        Text(
                          "Help",
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.powerOff,
                    size: 30,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Column(
                      children: [
                        Text(
                          "Logout",
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
