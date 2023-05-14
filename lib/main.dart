import 'package:flutter/material.dart';
import 'package:mirror_wall/Education/Provider/education_provider.dart';
import 'package:mirror_wall/Education/View/home_screen.dart';
import 'package:mirror_wall/Education/View/web_screen.dart';
import 'package:mirror_wall/OTT/Provider/ott_provider.dart';
import 'package:mirror_wall/OTT/View/dash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => EduProvider(),),
        ChangeNotifierProvider(create: (context) => OttProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
       initialRoute: 'dash',
       routes: {
          '/':(context) => HomeScreen(),
          'web':(context) => WebScreen(),
         'dash':(context) => DashScreen(),
       },
      ),
    ),
  );
}
