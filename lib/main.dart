import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper2(),
            child: Container(
              width: double.infinity,
              height: 400,
              color: Colors.blue,
            ),
          ),
          ClipPath(
              clipper: MyClipper(),
              child: Container(
                width: double.infinity,
                height: 300.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnh8dFbGRG01UmZhCecG4X6ykAq010V5JmPLxSHzQb-uEohM1m_Q&s",
                      ),
                      fit: BoxFit.cover),
                ),
                child: Center(
                  child: Text(
                    "Clip Path Curve",
                    style: TextStyle(fontSize: 28.0, color: Colors.white),
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 160.0),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Opacity(
                opacity: 0.8,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "A new Flutter project. \n \nGetting Started. \nThis project is a starting point for a Flutter application. A few resources to get you started if this is your first Flutter project: \n1. Lab: Write your first Flutter app. \n2. Cookbook: Useful Flutter samples. \nFor help getting started with Flutter, view our online documentation, which offers tutorials, samples, guidance on mobile development, and a full API reference.",
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // coba pertama
    // path.lineTo(0, size.height);
    // path.quadraticBezierTo(size.width/2, size.height -100, size.width, size.height);
    // path.lineTo(size.width, 0);
    // path.close();

    //coba kedua
    // path.lineTo(0, size.height -100);
    // path.quadraticBezierTo(size.width/2, size.height, size.width, size.height -100);
    // path.lineTo(size.width, 0);
    // path.close();

    // coba ketiga
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 4, size.height / 2, size.width / 2, size.height - 100);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height - 50,
        size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return null;
  }
}

class MyClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height - 200);
    path.quadraticBezierTo(
        size.width / 3, size.height / 2, size.width / 2, size.height - 100);
    path.quadraticBezierTo(
        size.width - (size.width / 3), size.height, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return null;
  }
}
