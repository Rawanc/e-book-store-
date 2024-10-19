// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';


class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  final List<CartItemData> _cartItems = [
    CartItemData("assets/1.jpeg", 'Alice in Wonderland', 59.99, 1),
    CartItemData("assets/6.jpeg", 'A Crown Of Wishes', 55.99, 2),
    CartItemData("assets/7.jpg", 'Harry Potter', 75.99, 1),
  ];

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
          // Adjusted image size for book cover proportions (tall and narrow)
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              item.imageUrl,
              width: 80, // Narrow width for book cover
              height: 120, // Taller height for book cover
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
