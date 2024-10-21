import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/providers/settings_provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  double _textSize = 16; 
  String _selectedLanguage = 'en'; 

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
            // Change text size
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
                    'Change text size',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Text('Small'),
                      Spacer(),
                      Text('Large'),
                    ],
                  ),
                  Slider(
                    value: _textSize,
                    min: 12,
                    max: 24,
                    onChanged: (value) {
                      setState(() {
                        _textSize = value;
                      });
                    },
                  ),
                  Text(
                    'Sample text size: ${_textSize.toStringAsFixed(0)}',
                    style: TextStyle(fontSize: _textSize),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Dark Mode
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
                    value: context.watch<SettingsProvider>().isDarkMode, // قراءة الوضع الليلي الحالي من SettingsProvider
                    onChanged: (value) {
                      context.read<SettingsProvider>().toggleDarkMode(value); // تبديل الوضع الليلي عند التغيير
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Language
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
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButton<String>(
                    value: _selectedLanguage,
                    items: const [
                      DropdownMenuItem(value: 'ar', child: Text('العربية')),
                      DropdownMenuItem(value: 'en', child: Text('English')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedLanguage = value!;
                      });
                    },
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
