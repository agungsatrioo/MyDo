import 'package:flutter/material.dart';
import 'package:mydo/src/ui/page/page_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: AppBarTheme(
          elevation: 0.0
        )
      ),
      home: HomePage()
    );
  }
}
