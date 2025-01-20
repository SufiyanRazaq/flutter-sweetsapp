import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SweetsCategories extends StatelessWidget {
  const SweetsCategories({super.key});

  final List<String> categories = const [
    'Laddu',
    'Barfi',
    'Jalebi',
    'Peda',
    'Halwa'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.white.withOpacity(0.3)),
            ),
            child: Center(
              child: Text(
                categories[index],
                style: GoogleFonts.aBeeZee(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
