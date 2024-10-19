import 'package:flutter/material.dart';



class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isSignIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isSignIn ? 'Sign In' : 'Sign Up'),
        backgroundColor: Colors.lightGreen[300],
        elevation: 15,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // ignore: prefer_const_constructors
            TextField(
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                labelText: 'Email',
                border: const OutlineInputBorder(), // Added border to text field
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(height: 16), // Spacing between fields
            // ignore: prefer_const_constructors
            TextField(
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                labelText: 'Password',
                border: const OutlineInputBorder(), // Added border to text field
              ),
              obscureText: true,
            ),
            if (!isSignIn)
              const SizedBox(height: 16), // Spacing for conditional field
            if (!isSignIn)
              // ignore: prefer_const_constructors
              TextField(
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: const OutlineInputBorder(), // Added border to text field
                ),
                obscureText: true,
              ),
            // ignore: prefer_const_constructors
            SizedBox(height: 20),
            
            ElevatedButton(
              onPressed: () {
                // Action for Sign In/Sign up
              },
              style: ButtonStyle(
                // ignore: deprecated_member_use
                backgroundColor: MaterialStateProperty.all(Colors.lightGreen[100]), 
                // ignore: deprecated_member_use
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners for button
                    // ignore: prefer_const_constructors
                    side: BorderSide(color:  Colors.lightGreen, width: 2), // Added border to button
                  ),
                ),
              ),
              child: Text(isSignIn ? 'Sign In' : 'Sign Up'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  isSignIn = !isSignIn;
                });
              },
              child: Text(isSignIn
                  ? 'Don’t have an account? Sign Up'
                  : 'Already have an account? Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}