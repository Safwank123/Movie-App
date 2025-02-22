import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final TextStyle? textStyle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor = Colors.black,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: textStyle ??
            GoogleFonts.lato(
              color: Colors.white,
              fontSize: 30,
            ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
