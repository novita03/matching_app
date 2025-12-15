import 'package:flutter/material.dart';
import '../data/dummy_profiles.dart';
import 'profile_page.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({super.key});

  @override
  State<MatchPage> createState() => _MatchPageState();
}
class _MatchPageState extends State<MatchPage>
    with SingleTickerProviderStateMixin {
  int index = 0;

  late AnimationController _controller;
  Animation<Offset>? _slideAnimation;
  Animation<double>? _rotateAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        if (index < dummyProfiles.length - 1) {
          setState(() => index++);
        }
      }
    });
  }

  void _swipe({required bool isLike}) {
    setState(() {
      /// 👉 GESER
      _slideAnimation = Tween<Offset>(
        begin: Offset.zero,
        end: Offset(isLike ? 1.4 : -1.4, 0),
      ).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOut),
      );

      /// 👉 MIRING
      _rotateAnimation = Tween<double>(
        begin: 0,
        end: isLike ? 0.12 : -0.12, // radian
      ).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOut),
      );
    });

    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MATCHING APP'),
        centerTitle: true,
      ),
      body: ProfilePage(
        profile: dummyProfiles[index],
        slideAnimation: _slideAnimation,
        rotateAnimation: _rotateAnimation,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _actionButton(
           assetPath: 'assets/images/close.png',
            onTap: () => _swipe(isLike: false),
          ),
          const SizedBox(width: 24),
          _actionButton(
            assetPath: 'assets/images/heart.png',
            onTap: () => _swipe(isLike: true),
          ),
        ],
      ),
    );
  }

Widget _actionButton({
  required String assetPath,
  Color backgroundColor = Colors.white,
  double iconSize = 30,
  required VoidCallback onTap,
}) {
  return RawMaterialButton(
    onPressed: onTap,
    fillColor: backgroundColor,
    shape: const CircleBorder(),
    constraints: const BoxConstraints.tightFor(
      width: 60,
      height: 60,
    ),
    child: Image.asset(
      assetPath,
      width: iconSize,
      height: iconSize,
      fit: BoxFit.contain,
    ),
  );
}

}
