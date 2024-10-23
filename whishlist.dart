// wishlist.dart

// ignore_for_file: use_super_parameters, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/wishlisTItem.dart'; // Update the import path

class Wishlist extends StatefulWidget {
  final List<WishlistItemData> initialWishlist;

  const Wishlist({Key? key, required this.initialWishlist}) : super(key: key);

  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  late List<WishlistItemData> _wishlistItems;

  @override
  void initState() {
    super.initState();
    _wishlistItems = widget.initialWishlist; // Initialize wishlist with passed data
  }

  // Method to remove an item from the wishlist
  void _removeItem(int index) {
    setState(() {
      _wishlistItems.removeAt(index);
    });
  }

  int _currentIndex = 0;

  final List<WishlistItemData> _itemsToAdd = [
    WishlistItemData("assets/7.jpg", 'Harry Potter', 55.00),
    WishlistItemData("assets/8.png", 'Murder on The Orient Express', 60.00),
    WishlistItemData("assets/6.jpeg", 'A Crown Of Wishes', 75.00),
  ];

  void _addItem() {
    if (_currentIndex < _itemsToAdd.length) {
      setState(() {
        _wishlistItems.add(_itemsToAdd[_currentIndex]);
        _currentIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Wishlist'),
        backgroundColor: Colors.lightGreen[300],
        elevation: 15,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_cart, size: 35)),
          IconButton(
            icon: const Icon(Icons.add, size: 35),
            onPressed: _addItem, // Adding a new item to the wishlist
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: _wishlistItems.isEmpty
                  ? const Center(
                      child: Text(
                        'Your wishlist is empty.',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _wishlistItems.length,
                      itemBuilder: (context, index) {
                        final item = _wishlistItems[index];
                        return WishlistItem(
                          item: item,
                          onRemove: () => _removeItem(index),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
