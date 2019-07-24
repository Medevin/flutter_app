import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

Color newColor = Color(101010);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  void _handleTap() {
    setState(() {
      newColor = new Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Colors"),
        ),
        body:
        GestureDetector(
          onTap: () {
            _handleTap();
          },
          child: Center(
            child: Container(
              color: newColor,
              margin: new EdgeInsets.all(0.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Hey there ;)"),
                    CenterButton(),
                  ],
                ),
              ),
            ),
          )
        ),
    );
  }
}


class CenterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(content:
          Center(
              child: Text("Current color: $newColor")
          )
        );

        Scaffold.of(context).showSnackBar(snackBar);
      },
      // The custom button
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text('Color info button'),
      ),
    );
  }
}