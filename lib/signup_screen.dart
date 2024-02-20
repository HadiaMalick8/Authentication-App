import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_screen.dart';
import 'my_textfield.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController passwordController = TextEditingController();

  String generatePassword() {
    int length = 16;
    bool includeNumbers = true;
    bool includeLetters = true;
    bool includeSpecialChars = true;
    const String letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const String numbers = '0123456789';
    const String specialChars = '!@#\$%^&*()_-+=?/.,<>[]{}';

    String chars = '';
    if (includeNumbers) {
      chars += numbers;
    }
    if (includeLetters) {
      chars += letters;
    }
    if (includeSpecialChars) {
      chars += specialChars;
    }

    String password = '';
    final Random random = Random();
    for (int i = 0; i < length; i++) {
      int index = random.nextInt(chars.length);
      password += chars[index];
    }
    return password;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Image.asset('assets/UIHeaderDesign.png'),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 50,right: 20),
                      width: 150,
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        'SIGN IN',
                        style: GoogleFonts.cambo(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff2F80ED),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Column(
                  children: [
                    Text(
                      'New User? Get Started Now',
                      style: GoogleFonts.cairo(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff4F4F4F),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //Icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/google.png',
                          height: 25,
                        ),
                        Image.asset(
                          'assets/facebook.png',
                          height: 25,
                        ),
                        Image.asset(
                          'assets/twitter.png',
                          height: 25,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //OR
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Divider(
                          thickness: 1,
                          color: Color(0xff828282),
                        ),
                        Text(
                          'OR',
                          style: GoogleFonts.cairo(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff4F4F4F),
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          color: Color(0xff828282),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email ID*',
                            style: GoogleFonts.cairo(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff4F4F4F),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const MyTextField(haveIcon: false,),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Password*',
                            style: GoogleFonts.cairo(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff4F4F4F),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          MyTextField(haveIcon: true, controller: passwordController,),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 150,
                                padding: const EdgeInsets.all(10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: const Color(0xff2F80ED),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  'SIGN UP',
                                  style: GoogleFonts.cambo(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  passwordController.text = generatePassword();
                                },
                                child: Container(
                                  width: 150,
                                  padding: const EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff2F80ED),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    'GENERATE',
                                    style: GoogleFonts.cambo(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              'Terms and Conditions | Privacy Policy',
                              style: GoogleFonts.cairo(
                                color: const Color(0xff4F4F4F),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Image.asset(
              'assets/UIFooterDesign.png',
            ),
          ],
        ),
      ),
    );
  }
}
