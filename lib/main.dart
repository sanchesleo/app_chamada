import 'package:flutter/material.dart';
import 'package:nac_02_chamada/screens/screen_chamada.dart';
import 'package:nac_02_chamada/screens/screen_chamada_finalizada.dart';
import 'package:nac_02_chamada/screens/screen_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/screen-chamada': (context) => ChamadaScreen(),
        '/screen-chamada-finalizada': (context) => ChamadaRealizadaScreen()
      },
    );
  }
}
