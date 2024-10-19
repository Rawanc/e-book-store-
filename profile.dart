import 'package:flutter/material.dart';







class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.lightGreen[300],
        elevation: 15,
      ),
      body: const Text('Settings'), );
  }
}