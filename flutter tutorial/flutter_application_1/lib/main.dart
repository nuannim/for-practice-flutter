import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.amber),
        body: Container(
          color: Colors.black,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      color: Colors.green,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(vertical: 10),
                    child: Container(
                      color: Colors.red,
                      width: double.infinity,
                      child: ListTile(
                        title: Text(
                          "Song Title",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: Text(
                          "Artist name",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
