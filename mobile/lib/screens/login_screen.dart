import 'package:flutter/material.dart';
import 'package:city_path/screens/home_screen.dart';
import 'package:city_path/services/auth_service.dart';
import 'package:city_path/screens/verify_code_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF004d71),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () async {
                    final input = _emailOrPhoneController.text.trim();

                    if (input.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please enter phone or email"),
                        ),
                      );
                      return;
                    }

                    final success = await AuthService.sendRegisterRequest(
                      input,
                    );

                    if (success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Verification code sent!"),
                        ),
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => VerifyCodeScreen(phoneOrEmail: input),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Error sending code")),
                      );
                    }
                  },
                  child: const Text(
                    'Log in',
                    style: TextStyle(fontSize: 18, color: Color(0xFFF9F2E9)),
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
