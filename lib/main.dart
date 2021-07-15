import 'package:flutter/material.dart';
import 'package:simple_pdf_reader/pages/splash_screen.dart';
import 'package:simple_pdf_reader/pages/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(      
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        'Root': (BuildContext) => SplashScreen(),
        'Home': (BuildContext) => HomeScreen()
      },
    );
  }
}