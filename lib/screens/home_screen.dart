// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:budget_tracker_application_2/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreenUI extends StatefulWidget {
  const HomeScreenUI({super.key});

  @override
  State<HomeScreenUI> createState() => _HomeScreenUIState();
}

class _HomeScreenUIState extends State<HomeScreenUI> {
  var isLogoutLoading = false;
  logOut() async {
    setState(() {
      isLogoutLoading = true;
    });

    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );

    setState(() {
      isLogoutLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 166, 125, 232),
        title: Text(
          "Hello",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                logOut();
              },
              icon: isLogoutLoading
                  ? CircularProgressIndicator()
                  : Icon(
                      FontAwesomeIcons.arrowRightFromBracket,
                      color: const Color.fromARGB(255, 13, 250, 175),
                    ))
        ],
      ),
      body: Container(
          width: double.infinity,
          color: Colors.blueAccent,
          child: Column(
            children: [
              HeroCard(),
            ],
          )),
    );
  }
}

class HeroCard extends StatelessWidget {
  const HeroCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total Balance",
                style: TextStyle(
                    fontSize: 18.00,
                    color: Colors.white,
                    height: 1.2,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "\$ 65222.00",
                style: TextStyle(
                    fontSize: 50.00,
                    color: Colors.white,
                    height: 1.2,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 30, bottom: 10, left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Colors.white,
          ),
          child: Row(
            children: [
              CardOne(
                color: Colors.green,
              ),
              SizedBox(
                width: 10,
              ),
              CardOne(
                color: Colors.red,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CardOne extends StatelessWidget {
  const CardOne({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.00)),
        child: Padding(
          padding: const EdgeInsets.all(10.00),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Credit",
                    style: TextStyle(color: color, fontSize: 14.00),
                  ),
                  Text(
                    "\$ 65222.00",
                    style: TextStyle(
                        color: color,
                        fontSize: 23.00,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_upward_outlined,
                  color: color,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
