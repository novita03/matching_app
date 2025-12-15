import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matching_app/features/match/presentation/widgets/cognitive_function.dart';
import 'package:matching_app/features/match/presentation/widgets/icon_with_text.dart';
import 'package:matching_app/features/match/presentation/widgets/sixteen_types.dart';
import 'package:matching_app/features/match/presentation/widgets/trait_card.dart';
import '../domain/profile.dart';
import 'widgets/info_card.dart';
import 'widgets/tag_chip.dart';

class ProfilePage extends StatelessWidget {
  final Profile profile;
  final Animation<Offset>? slideAnimation;
  final Animation<double>? rotateAnimation;

  const ProfilePage({
    super.key,
    required this.profile,
    this.slideAnimation,
    this.rotateAnimation,
  });

  @override
  Widget build(BuildContext context) {
    Widget imageCard = ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Image.asset(
            profile.image,
            height: 550,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.0, 0.3],
                  colors: [Colors.black.withOpacity(0.9), Colors.transparent],
                ),
              ),
            ),
          ),

          Positioned(
            top: 20,
            right: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ...profile.hobbies
                    .take(5)
                    .map(
                      (hobby) => Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: IconWithText(
                          icon: Icons.public,
                          text: hobby,
                          iconColor: const Color(0xFF4DDCD8),
                          textColor: Colors.white,
                          backgroundColor: Colors.white.withOpacity(0.3),
                          isRounded: true,
                          isBlur: true,
                          borderColor: Colors.white,
                        ),
                      ),
                    ),
              ],
            ),
          ),

          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        profile.name,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.check_circle,
                        color: Color(0xFF4DDCD8),
                        size: 23,
                      ),
                    ],
                  ),

                  IconWithText(
                    icon: Icons.work_outline_rounded,
                    text: profile.job,
                    iconColor: Colors.white,
                    textColor: Colors.white,
                  ),

                  IconWithText(
                    icon: Icons.school_outlined,
                    text: profile.educationLevel,
                    iconColor: Colors.white,
                    textColor: Colors.white,
                  ),

                  IconWithText(
                    icon: Icons.location_on_outlined,
                    text: profile.location,
                    iconColor: Colors.white,
                    textColor: Colors.white,
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      IconWithText(
                        icon: profile.gender == 'male'
                            ? Icons.male
                            : Icons.female,
                        text: profile.age.toString(),
                        iconColor: Colors.white,
                        textColor: Colors.white,
                        backgroundColor: Colors.lightBlue.shade600,
                        isRounded: true,
                        isBlur: false,
                      ),
                      const SizedBox(width: 5),
                      IconWithText(
                        text: profile.personality,
                        iconColor: Colors.white,
                        textColor: Colors.white,
                        backgroundColor: Colors.redAccent.shade400,
                        isRounded: true,
                        isBlur: false,
                      ),
                      const SizedBox(width: 5),
                      IconWithText(
                        text: profile.zodiac,
                        iconColor: Colors.white,
                        textColor: Colors.white,
                        backgroundColor: Colors.deepPurple.shade500,
                        isRounded: true,
                        isBlur: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 120),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            slideAnimation != null && rotateAnimation != null
                ? IgnorePointer(
                    ignoring: true,
                    child: SlideTransition(
                      position: slideAnimation!,
                      child: RotationTransition(
                        turns: rotateAnimation!,
                        child: imageCard,
                      ),
                    ),
                  )
                : imageCard,

            const SizedBox(height: 15),

            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'LOOKING FOR',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: Colors.black87,
                          ),
                        ),
                        ...profile.lookingfor.map(
                          (look) => Padding(
                            padding: const EdgeInsets.only(
                              bottom: 5,
                              right: 5,
                              left: 5,
                            ),
                            child: IconWithText(
                              text: look,
                              fontSize: 10,
                              textColor: Colors.black87,
                              backgroundColor: Colors.white,
                              isRounded: true,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        profile.about,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    ),

                    Wrap(
                      spacing: 6, // jarak horizontal antar item
                      runSpacing: 6, // jarak vertikal antar baris
                      children: [
                        IconWithText(
                          text: profile.drinking,
                          fontSize: 10,
                          textColor: Colors.black87,
                          backgroundColor: Colors.white,
                          isRounded: true,
                          icon: Icons.no_drinks,
                          iconColor: Color(0xFF4DDCD8),
                        ),
                        IconWithText(
                          text: profile.smoking,
                          fontSize: 10,
                          textColor: Colors.black87,
                          backgroundColor: Colors.white,
                          isRounded: true,
                          icon: Icons.smoke_free,
                          iconColor: Color(0xFF4DDCD8),
                        ),
                        IconWithText(
                          text: profile.kids,
                          fontSize: 10,
                          textColor: Colors.black87,
                          backgroundColor: Colors.white,
                          isRounded: true,
                          icon: Icons.child_friendly,
                          iconColor: Color(0xFF4DDCD8),
                        ),
                        IconWithText(
                          text: profile.religion,
                          fontSize: 10,
                          textColor: Colors.black87,
                          backgroundColor: Colors.white,
                          isRounded: true,
                          icon: Icons.people,
                          iconColor: Color(0xFF4DDCD8),
                        ),
                        IconWithText(
                          text: profile.ethnicity,
                          fontSize: 10,
                          textColor: Colors.black87,
                          backgroundColor: Colors.white,
                          isRounded: true,
                          icon: Icons.people,
                          iconColor: Color(0xFF4DDCD8),
                        ),
                        IconWithText(
                          text: profile.sexuality,
                          fontSize: 10,
                          textColor: Colors.black87,
                          backgroundColor: Colors.white,
                          isRounded: true,
                          icon: Icons.favorite,
                          iconColor: Color(0xFF4DDCD8),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: MediaQuery.sizeOf(context).width,
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Interests",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        runSpacing: 6,
                        spacing: 6,
                        children: profile.hobbies
                            .map((e) => TagChip(e))
                            .toList(),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Languages",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        profile.languages.join('  ').toUpperCase(),
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: const Color(0xFF4DDCD8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            InfoCard(title: 'I want someone who', content: profile.about),

            const SizedBox(height: 15),
            InfoCard(title: "I'm a sucker for", content: profile.weakness),

            const SizedBox(height: 15),
            InfoCard(title: 'I secretly think', content: profile.thought),

            const SizedBox(height: 15),
            Card(
              color: Colors.white,
              child: SizedBox(
                height: 500, 
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      // TAB BAR
                      Center(
                        child: TabBar(
                          isScrollable: true,
                          indicator: const BoxDecoration(),
                          labelPadding: const EdgeInsets.symmetric(
                            horizontal: 24,
                          ), // jarak antar tab
                          dividerColor: Colors.transparent,
                          splashFactory: NoSplash.splashFactory,
                          overlayColor: MaterialStateProperty.all(
                            Colors.transparent,
                          ),
                          labelColor: const Color(0xFF4DDCD8),
                          unselectedLabelColor: Colors.grey,
                          labelStyle: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                          unselectedLabelStyle: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                          tabs: const [
                            Tab(text: '16 TYPE'),
                            Tab(text: 'COGNITIVE FUNCTIONS'),
                          ],
                        ),
                      ),

                      // TAB CONTENT
                      Expanded(
                        child: TabBarView(
                          children: [
                            // TAB 1
                            SingleChildScrollView(
                              padding: const EdgeInsets.all(12),
                              child: SixteenTypesWidget(profile: profile),
                            ),

                            // TAB 2
                            SingleChildScrollView(
                              padding: const EdgeInsets.all(12),
                              child: CognitiveFunctionWidget(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4DDCD8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
              ),
              child: Text(
                'SHARE PROFILE',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.black87,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
