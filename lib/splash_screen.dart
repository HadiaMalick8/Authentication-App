import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/UIHeaderDesign.png'),
          Column(
            children: [
              Text(
                'Angel Sure',
                style: GoogleFonts.akayaTelivigala(
                  fontSize: 36,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff2F80ED),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 250,
                child: Image.asset(
                  'assets/Image.png',
                ),
              ),
            ],
          ),
          Image.asset(
            'assets/UIFooterDesign.png',
          ),
        ],
      ),
    );
  }
}
