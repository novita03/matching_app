import 'package:flutter/material.dart';

class TraitCard extends StatelessWidget {
  final String trait;
  final String percentage;

  const TraitCard({
    super.key,
    required this.trait,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white, // background putih
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              trait,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 8,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              percentage,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.red, // angka merah
              ),
            ),
          ],
        ),
      ),
    );
  }
}
