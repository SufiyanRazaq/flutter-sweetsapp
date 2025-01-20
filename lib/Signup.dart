import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweetsapp/HomePage.dart';
import 'package:sweetsapp/login.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff581f59), Color(0xffa72729)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Glassy Signup Form
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  width: 350,
                  height: 600,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOut,
                          padding: const EdgeInsets.all(8),
                          child: const CircleAvatar(
                            backgroundImage: AssetImage("assets/logo.jpg"),
                            radius: 55,
                          ),
                        ),
                        Text(
                          'Create Account',
                          style: GoogleFonts.pacifico(
                            fontSize: 30,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.orangeAccent.withOpacity(0.7),
                                blurRadius: 25,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),

                        // Full Name TextField
                        buildTextField(
                          icon: Icons.person,
                          hintText: 'Full Name',
                          isPassword: false,
                        ),
                        const SizedBox(height: 15),

                        // Email TextField
                        buildTextField(
                          icon: Icons.email_rounded,
                          hintText: 'Email Address',
                          isPassword: false,
                        ),
                        const SizedBox(height: 15),

                        // Password TextField
                        buildTextField(
                          icon: Icons.lock_rounded,
                          hintText: 'Password',
                          isPassword: true,
                        ),
                        const SizedBox(height: 15),

                        // Confirm Password TextField
                        buildTextField(
                          icon: Icons.lock_rounded,
                          hintText: 'Confirm Password',
                          isPassword: true,
                        ),
                        const SizedBox(height: 30),

                        // Signup Button
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to HomePage or further verification
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfff69722),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 60,
                              vertical: 18,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            'Sign Up',
                            style: GoogleFonts.aBeeZee(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        const SizedBox(height: 15),

                        // Login Prompt
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: GoogleFonts.aBeeZee(
                                color: Colors.white70,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                );
                              },
                              child: Text(
                                'Login',
                                style: GoogleFonts.aBeeZee(
                                  color: Colors.orangeAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Reusable TextField Widget
  Widget buildTextField({
    required IconData icon,
    required String hintText,
    required bool isPassword,
  }) {
    return TextField(
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.white70,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.orangeAccent.withOpacity(0.7),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
