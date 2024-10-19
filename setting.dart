
import 'package:flutter/material.dart';


class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.lightGreen[300],
        elevation: 15,
      ),
   
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // إعدادات تغيير حجم النص   
            Container(
              width: double.infinity, // جعل العرض يغطي الشاشة بالكامل
              decoration: BoxDecoration(
                color: Colors.lightGreen[50],
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Change text size',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // ignore: prefer_const_constructors
                  Row(
                    children: const [
                      Text('Small'),
                      Spacer(),
                      Text('Large'),
                    ],
                  ),
                  Slider(
                    value: 16,
                    min: 12,
                    max: 24,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // إعدادات الوضع الليلي 
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.lightGreen[50],
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Dark Mode',
                    style: TextStyle(fontSize: 18),
                  ),
                  Switch(
                    value: false,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // إعدادات اللغة
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.lightGreen[50],
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Language',
                    style: TextStyle(
                      fontSize: 18,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButton<String>(
                    items: const [
                      DropdownMenuItem(value: 'ar', child: Text('العربية')),
                      DropdownMenuItem(value: 'en', child: Text('English')),
                    ],
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
