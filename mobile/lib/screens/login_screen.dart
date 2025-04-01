import 'package:flutter/material.dart';

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
                Image.asset('assets/logo.png', width: 120),
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
                      MaterialPageRoute(
                        builder: (_) => const Placeholder(),
                      ), // נחליף בהמשך
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('log in', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
