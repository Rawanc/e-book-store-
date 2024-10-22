
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/shoppingCart.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // Create the product data that you want to add to the cart
    final CartItemData product = CartItemData(
      "assets/1.jpeg", // Image path for Alice in Wonderland
      "Alice in Wonderland", // Product name
      59.99, // Product price
      1, // Quantity
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[300],
        elevation: 15,
        title: const Text('Alice in Wonderland'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "assets/1.jpeg",
                    fit: BoxFit.cover,
                    height: 300,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Alice in Wonderland',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.green[900],
                ),
              ),
              
              const SizedBox(height: 10),
              const Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 18),
                  Icon(Icons.star, color: Colors.yellow, size: 18),
                  Icon(Icons.star, color: Colors.yellow, size: 18),
                  Icon(Icons.star, color: Colors.yellow, size: 18),
                  Icon(Icons.star, color: Colors.yellow, size: 18),
                  SizedBox(width: 10),
                  Text(
                    '(27+ Rating)',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'SAR 59.99',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green[800],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Description',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.green[900],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Alice in Wonderland is a timeless fantasy novel written by Lewis Carroll. '
                'It tells the tale of a young girl, Alice, who falls down a rabbit hole into '
                'a whimsical world filled with peculiar creatures and adventures.',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),


              // Product Details - Updated to match requested format without box
              const Row(
                children: [
                  Icon(Icons.child_care, size: 18), // Reading age icon
                  SizedBox(width: 10), // Space between icon and text
                  Text(
                    '7+ years',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Icon(Icons.book, size: 18), // Print length icon
                  SizedBox(width: 10), // Space between icon and text
                  Text(
                    '101 pages',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Icon(Icons.language, size: 18), // Language icon
                  SizedBox(width: 10), // Space between icon and text
                  Text(
                    'English',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Icon(Icons.aspect_ratio, size: 18), // Dimensions icon
                  SizedBox(width: 10), // Space between icon and text
                  Text(
                    '6 x 0.23 x 9 inches',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              
              // Add to cart button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen[400],
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // Navigate to ShoppingCart and pass the product information
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShoppingCart(itemToAdd: product),
                      ),
                    );
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.shopping_cart, color: Colors.black, size: 24),
                      SizedBox(width: 10),
                     
                      SizedBox(width: 10),
                      Text(
                        'Add to Cart',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
