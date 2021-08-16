import 'package:flutter/material.dart';
import 'package:follow_fan/constants.dart';
import 'package:follow_fan/logic/route_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Follow Fan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: kPrimaryDark,
          primaryColor: kPrimary,
          textTheme: Theme.of(context)
              .textTheme
              .apply(bodyColor: kWhite, fontFamily: "Almarai"),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: "/splash",
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
