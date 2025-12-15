import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matching_app/features/match/domain/profile.dart';
import 'icon_with_text.dart'; // pastikan ini ada di project
import 'trait_card.dart'; // pastikan ini ada di project


class SixteenTypesWidget extends StatelessWidget {
  final Profile profile;

  const SixteenTypesWidget({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/heart.png',
                  width: 50,
                ),
                const SizedBox(height: 6),
                IconWithText(
                  text: profile.personality,
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 252, 65, 102),
                  isRounded: true,
                  isBlur: false,
                  fontSize: 12,
                ),
              ],
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.65,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Mastermind",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                      IconWithText(
                        text: 'Challenging',
                        iconColor: Colors.white,
                        textColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 252, 65, 102),
                        isRounded: true,
                        isBlur: false,
                        fontSize: 12,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.65,
                  height: 100,
                  child: GridView.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      TraitCard(trait: 'Introverted', percentage: '80%'),
                      TraitCard(trait: 'Intuitive', percentage: '10%'),
                      TraitCard(trait: 'Thinking', percentage: '50%'),
                      TraitCard(trait: 'Judging', percentage: '30%'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildTextSection(
          title: 'INFP Description',
          content:
              'INFPs are idealistic and introspective individuals who prioritize personal values. '
              'They are deeply empathetic, compassionate, and sensitive to the feelings of others. '
              'Often creative, they enjoy expressing themselves through art, writing, or music. '
              'They value authenticity and seek meaningful connections in both work and personal life. '
              'Reserved by nature, INFPs prefer one-on-one interactions over large social gatherings. '
              'They are flexible, open-minded, and explore possibilities rather than rigidly adhering to rules. '
              'INFPs are driven by purpose and meaning, often dedicating themselves to causes or projects that align with their values. '
              'Though idealistic, they may struggle with practical matters or confrontation. '
              'Overall, INFPs inspire others with their vision, creativity, and unwavering sense of empathy.',
        ),
        const SizedBox(height: 10),
        _buildTextSection(
          title: 'Key Traits',
          content:
              'INFPs are idealistic individuals who hold strong values and seek meaning in everything they do. '
              'They are empathetic and compassionate, deeply caring about others’ feelings. '
              'Creative and imaginative, they enjoy expressing themselves through writing, art, or music. '
              'Reserved and introverted, they prefer meaningful one-on-one interactions and are flexible and open-minded, exploring possibilities rather than following strict rules.',
        ),
        const SizedBox(height: 10),
        _buildTextSection(
          title: 'Strengths',
          content:
              'They are loyal and devoted, with an excellent ability to understand emotions. INFPs excel in creative problem-solving and are passionate about personal growth.',
        ),
        const SizedBox(height: 10),
        _buildTextSection(
          title: 'Weaknesses',
          content:
              'INFPs can be overly idealistic or perfectionistic, sometimes struggling with practical tasks. They often avoid confrontation and may become introspective or withdrawn.',
        ),
        const SizedBox(height: 10),
        _buildTextSection(
          title: 'Typical Careers',
          content:
              'They are often found in careers such as writer, counselor, artist, psychologist, teacher, or other roles that allow creativity and helping others.',
        ),
        const SizedBox(height: 10),
        _buildTextSection(
          title: 'Summary',
          content:
              'INFPs are thoughtful, imaginative, and caring individuals who seek meaning in life and inspire others through their ideals and creativity.',
        ),
      ],
    );
  }

  Widget _buildTextSection({required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          content,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
