import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
void main() {
  runApp(CityPathApp());
}

class CityPathApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'City Path',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF9F2E9), // צבע רקע כמו בתמונה
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
  super.initState();

  Future.delayed(Duration(seconds: 2), () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => LoginScreen()),
    );
  });

  _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat(reverse: false);

  _animation = Tween<double>(begin: 0, end: 1).animate(
    CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
  );
}

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png', 
              width: 200,
            ),
            const SizedBox(height: 50),
            Container(
              width: 100,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(50),
              ),
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: _animation.value,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
