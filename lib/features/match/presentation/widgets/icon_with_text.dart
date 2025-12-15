import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IconWithText extends StatelessWidget {
  final IconData? icon; // bisa null
  final Color iconColor;
  final String text;
  final double fontSize;
  final Color textColor;
  final bool isRounded;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final bool isBlur;

  const IconWithText({
    super.key,
    this.icon,
    required this.text,
    this.iconColor = Colors.white,
    this.textColor = Colors.white,
    this.isRounded = false,
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
    this.isBlur = false,
    this.fontSize = 15.0,
  });

  @override
  Widget build(BuildContext context) {
    // Teks stroke hanya saat blur
    Widget textWidget = isBlur
        ? Stack(
            children: [
              Text(
                text,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: fontSize,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 1.0
                    ..color = Colors.black,
                ),
              ),
              Text(
                text,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: fontSize,
                  color: textColor,
                ),
              ),
            ],
          )
        : Text(
            text,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              fontSize: fontSize,
              color: textColor,
            ),
          );

    Widget content = Container(
      padding: isRounded
          ? const EdgeInsets.symmetric(horizontal: 10, vertical: 5)
          : const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: isBlur ? backgroundColor.withOpacity(0.3) : backgroundColor,
        borderRadius: BorderRadius.circular(isRounded ? 100 : 0),
        border: borderWidth > 0
            ? Border.all(color: borderColor, width: borderWidth)
            : null,
        boxShadow: isRounded
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ]
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) Icon(icon, color: iconColor, size: 15),
          if (icon != null) const SizedBox(width: 5),
          textWidget,
        ],
      ),
    );

    if (isBlur) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(isRounded ? 100 : 0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: content,
        ),
      );
    } else {
      return content;
    }
  }
}
