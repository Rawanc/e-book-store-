import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/homepage.dart';
import 'package:flutter_application_1/pages/productDetails.dart';
import 'package:flutter_application_1/pages/profile.dart';
import 'package:flutter_application_1/pages/setting.dart';
import 'package:flutter_application_1/pages/shoppingCart.dart';
import 'package:flutter_application_1/pages/signin.dart';

void main() {
  runApp(const EbookStore());
}

class EbookStore extends StatelessWidget {
  const EbookStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      initialRoute: '/homepage',
      routes: {
        '/signin': (context) => const SignIn(),
        '/homepage': (context) => const Homepage(),
        '/setting': (context) => const Settings(),
        '/profile': (context) => const Profile(),
        '/shoppingcart': (context) => const ShoppingCart(),
        '/productdetails': (context) => const ProductDetails(),
      },
    );
  }
}
