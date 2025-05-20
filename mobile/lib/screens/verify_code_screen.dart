import 'package:flutter/material.dart';
import 'package:city_path/services/auth_service.dart';
import 'package:city_path/screens/home_screen.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String phoneOrEmail;

  const VerifyCodeScreen({super.key, required this.phoneOrEmail});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final TextEditingController _codeController = TextEditingController();

  Future<void> _verifyCode() async {
    final code = _codeController.text.trim();

    if (code.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please enter the code")));
      return;
    }

    final success = await AuthService.verifyCode(widget.phoneOrEmail, code);

    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Invalid code")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F2E9),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Verify Code'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Enter the 5-digit code sent to you"),
            const SizedBox(height: 20),
            TextField(
              controller: _codeController,
              keyboardType: TextInputType.number,
              maxLength: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Verification code',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _verifyCode, child: const Text("Verify")),
          ],
        ),
      ),
    );
  }
}
