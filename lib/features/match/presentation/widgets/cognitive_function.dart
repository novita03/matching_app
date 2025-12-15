import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CognitiveFunctionWidget extends StatelessWidget {
  const CognitiveFunctionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cognitiveFunctions = [
      {
        'icon': Icons.diamond,
        'role': 'Dominant',
        'abbreviation': 'Fi',
        'keyword': 'Authenticity',
        'subtitle': 'Introverted Feeling',
        'description':
            'Introverted Feeling focuses on personal values and making decisions according to inner ethics. '
            'It helps you stay true to yourself and understand your emotions deeply. '
            'This function drives empathy and moral reasoning, guiding choices and relationships. '
            'It encourages authenticity and emotional clarity in daily life.',
        'color': Colors.redAccent,
      },
      {
        'icon': Icons.diamond,
        'role': 'Auxiliary',
        'abbreviation': 'Ne',
        'keyword': 'Creativity',
        'subtitle': 'Extraverted Intuition',
        'description':
            'Extraverted Intuition explores patterns and possibilities in the world. '
            'It encourages brainstorming, creativity, and connecting abstract concepts. '
            'Ne drives curiosity and adaptability, allowing flexible thinking. '
            'It helps see multiple scenarios and potential outcomes.',
        'color': Colors.blueAccent,
      },
      {
        'icon': Icons.diamond,
        'role': 'Inferior',
        'abbreviation': 'Te',
        'keyword': 'Efficiency',
        'subtitle': 'Extraverted Thinking',
        'description':
            'Extraverted Thinking organizes the external world efficiently. '
            'It emphasizes logic, objective decision-making, and effective problem solving. '
            'Te helps structure ideas and execute plans when needed. '
            'It balances idealism with practical actions and rational analysis.',
        'color': Colors.greenAccent,
      },
    ];

    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: cognitiveFunctions.map((func) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 30),
                    Icon(func['icon'], color: func['color'], size: 36),
                    const SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          func['role'],
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: const Color(0xFF4DDCD8),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${func['abbreviation']} – ${func['keyword']}',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          func['subtitle'],
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  func['description'],
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
