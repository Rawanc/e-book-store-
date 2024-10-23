import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/whishlis.dart';
import 'package:flutter_application_1/pages/wishlisTItem.dart'; // Update the import path

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final book = WishlistItemData("assets/1.jpeg", 'Alice in Wonderland', 59.99);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[300],
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

              const SizedBox(height: 30),
              
              // for favorite icon and shopping_cart icon
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen[400],
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        // Navigate to Wishlist and add the book
                        Navigator.push( 
                          context, 
                          MaterialPageRoute( 
                            builder: (context) => Wishlist( 
                              initialWishlist: [book], //Pass this book to Wishlist
                            ),
                          ),
                        );
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.black, size: 24),
                          SizedBox(width: 10),
                          Text(
                            'Add to Wishlist',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 20), // Space between the two buttons
                    
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen[400],
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Icon(Icons.shopping_cart, color: Colors.black, size: 24),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
