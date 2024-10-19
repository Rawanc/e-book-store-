// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[300],
        elevation: 15,
        title: _buildSearchBar(),
        centerTitle: true,
        leading: _buildIconButton(context, "/shoppingcart", Icons.shopping_cart),
        actions: [
          _buildIconButton(context, "/profile", Icons.person),
          _buildIconButton(context, "/signin", Icons.login),
          _buildIconButton(context, "/setting", Icons.settings),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Popular Books", Colors.green[1000]),
            _buildBookRow(context, [
              "assets/1.jpeg",
              "assets/2.jpeg",
              "assets/3.jpeg",
              "assets/4.jpeg",
              "assets/5.jpeg",
            ]),
            _buildSectionTitle("Newest Books", Colors.green[1000]),
            _buildBookRow(context, [
              "assets/6.jpeg",
              "assets/7.jpg",
              "assets/8.png",
              "assets/9.jpeg",
              "assets/10.jpeg",
            ]),
            _buildSectionTitle("Recommended Books", Colors.green[1000]),
            _buildBookRow(context, [
              "assets/11.jpeg",
              "assets/12.jpeg",
              "assets/13.jpeg",
              "assets/14.jpeg",
              "assets/15.jpeg",
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 35,
      width: 300,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.lightGreen[50],
        borderRadius: BorderRadius.circular(66),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search for a book",
          labelStyle: TextStyle(fontSize: 20),
          icon: Icon(Icons.search, size: 35),
        ),
      ),
    );
  }

  Widget _buildIconButton(BuildContext context, String route, IconData icon) {
    return IconButton(
      onPressed: () => Navigator.pushNamed(context, route),
      icon: Icon(icon, size: 35),
    );
  }

  Widget _buildSectionTitle(String title, Color? color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: color,
        ),
      ),
    );
  }

  Widget _buildBookRow(BuildContext context, List<String> imagePaths) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: imagePaths.map((path) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              onTap: path == "assets/1.jpeg"
                  ? () => Navigator.pushNamed(context, "/productdetails")
                  : null,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(path, fit: BoxFit.cover, height: 180),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
