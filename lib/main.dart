import 'package:fashion/pages/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/Home.dart';
import 'pages/Logo.dart';
import 'provider/cart.dart';
import 'provider/closet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ImageModel()),
        ChangeNotifierProvider(create: (context) => Cart()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          'HomePage': (context) => HomePage(),
          'editpage': (context) => const EditProfilePage(),
        },
        home: Logo(),
      ),
    );
  }
}
