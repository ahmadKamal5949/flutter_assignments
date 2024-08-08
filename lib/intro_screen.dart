import 'package:assignment_one/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  @override
  OpeningViewState createState() => OpeningViewState();
}

class OpeningViewState extends State<IntroScreen> {
  OpeningViewState();

  String displayName = "";

  @override
  void initState() {
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      displayName = prefs.getString('displayName')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final logo = Image.asset(
      "assets/login_illustration.png",
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: mq.size.width / 1.2,
        padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: const Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => LoginPage()));
        },
      ),
    );

    final buttons = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        loginButton,
      ],
    );

    display() {
      return Text(
        "Welcome back $displayName!",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      );
    }

    welcomeText() {
      return Center(
        child: Text(
          "Discover a new way to develop applications. Our app offers you"
          " a seamless and intuitive experience designed to enhance your productivity.",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: logo,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 5),
                child: display(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: welcomeText(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 50),
                child: buttons,
              )
            ],
          ),
        ),
      ),
    );
  }
}
