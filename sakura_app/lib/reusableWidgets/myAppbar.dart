import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final myHeight = MediaQuery.of(context).size.height;
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black, // <-- SEE HERE
      ),
      title: Text(
        title,
        style: GoogleFonts.notoSansThai(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      toolbarHeight: myHeight * 0.09,
      backgroundColor: Color.fromRGBO(239, 239, 239, 1),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
