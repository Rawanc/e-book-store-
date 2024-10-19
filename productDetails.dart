import 'package:flutter/material.dart';




class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

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