import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/pages/wishlist.dart';
import 'package:flutter_application_1/pages/homepage.dart';
import 'package:flutter_application_1/pages/productDetails.dart';
import 'package:flutter_application_1/pages/profile.dart';
import 'package:flutter_application_1/pages/setting.dart';
import 'package:flutter_application_1/pages/signin.dart';
import 'package:flutter_application_1/providers/settings_provider.dart';

void main() {
 runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: const EbookStore(),
    ),
  );
}

class EbookStore extends StatelessWidget {
  const EbookStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settings, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: settings.isDarkMode
              ? ThemeData.dark(useMaterial3: true)
              : ThemeData.light(useMaterial3: true),
          initialRoute: '/homepage',
          routes: {
            '/signin': (context) => const SignIn(),
            '/homepage': (context) => const Homepage(),
            '/setting': (context) => const Settings(),
            '/profile': (context) => const Profile(),
            '/shoppingcart': (context) => const Wishlist(initialWishlist: [],),
            '/productdetails': (context) => const ProductDetails(),
          },
        );
      },
    );
  }
}
