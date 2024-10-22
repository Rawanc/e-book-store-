// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  final CartItemData? itemToAdd; // Accept an optional CartItemData to add to the cart

  const ShoppingCart({super.key, this.itemToAdd});

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  final List<CartItemData> _cartItems = [
    CartItemData("assets/6.jpeg", 'A Crown Of Wishes', 55.99, 2),
    CartItemData("assets/7.jpg", 'Harry Potter', 75.99, 1),
  ];

  @override
  void initState() {
    super.initState();
    // Add the item passed from ProductDetails to the cart if it exists
    if (widget.itemToAdd != null) {
      addItem(widget.itemToAdd!);
    }
  }

  // Method to add a new item to the cart
  void addItem(CartItemData newItem) {
    setState(() {
      // Check if the item already exists in the cart, if so, just increase the quantity
      var existingItem = _cartItems.firstWhere(
        (item) => item.itemName == newItem.itemName,
        orElse: () => CartItemData("", "", 0, 0),
      );
      if (existingItem.itemName.isNotEmpty) {
        existingItem.quantity += newItem.quantity;
      } else {
        _cartItems.add(newItem);
      }
    });
  }

  double get totalPrice => _cartItems.fold(0, (total, item) => total + (item.itemPrice * item.quantity));

  void _updateQuantity(int index, int change) {
    setState(() {
      _cartItems[index].quantity = (_cartItems[index].quantity + change).clamp(1, 99);
    });
  }

  void _removeItem(int index) {
    setState(() {
      _cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        backgroundColor: Colors.lightGreen[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _cartItems.length,
                itemBuilder: (context, index) {
                  return CartItem(
                    item: _cartItems[index],
                    onIncrease: () => _updateQuantity(index, 1),
                    onDecrease: () => _updateQuantity(index, -1),
                    onRemove: () => _removeItem(index),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: \SAR ${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {}, // Proceed to checkout
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen[300],
                  ),
                  child: const Text('Checkout'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CartItemData {
  final String imageUrl;
  final String itemName;
  final double itemPrice;
  int quantity;

  CartItemData(this.imageUrl, this.itemName, this.itemPrice, this.quantity);
}

class CartItem extends StatelessWidget {
  final CartItemData item;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onRemove;

  const CartItem({
    super.key,
    required this.item,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.lightGreen[50],
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              item.imageUrl,
              width: 80,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.itemName,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text('\SAR ${item.itemPrice.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(onPressed: onDecrease, icon: const Icon(Icons.remove)),
                        Text('${item.quantity}'),
                        IconButton(onPressed: onIncrease, icon: const Icon(Icons.add)),
                      ],
                    ),
                    IconButton(onPressed: onRemove, icon: const Icon(Icons.delete, color: Colors.red)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
