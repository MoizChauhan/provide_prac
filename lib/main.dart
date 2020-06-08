import 'package:flutter/material.dart';
import 'package:provide_prac/Screens/home.dart';
import 'package:provider/provider.dart';
import 'package:provide_prac/Provider/settings_provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        
        create: (BuildContext context) => SettingsProvider(),
        child: MaterialApp(
        title: 'Wax app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepOrangeAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home(),
      ),
    );
  }
}

