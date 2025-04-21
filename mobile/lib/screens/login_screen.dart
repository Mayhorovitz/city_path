import 'package:flutter/material.dart';
import 'package:city_path/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailOrPhoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F2E9),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Logo
                Image.asset('assets/logo.png', width: 160),
                const SizedBox(height: 40),
                TextField(
                  controller: _emailOrPhoneController,
                  decoration: InputDecoration(
                    hintText: 'Enter phone or email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF004d71), // Button color
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'log in',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFF9F2E9), 
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
