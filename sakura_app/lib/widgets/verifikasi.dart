import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    final myWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(children: [
        Image.asset(
          "assets/background_5.png",
          fit: BoxFit.contain,
          width: myWidth * 1,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 25),
          child: Image.asset(
            "assets/email.png",
            alignment: Alignment.center,
          ),
        ),
        Text(
          "Kode Verifikasi",
          style: GoogleFonts.outfit(
              color: Color.fromRGBO(241, 33, 90, 1),
              fontSize: 32,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: myWidth * 0.75,
          child: Text(
            "Masukkan kode verifikasi yang sudah dikirim ke email Anda.",
            style:
                GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w200),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 5; i++)
                Container(
                  width: 54,
                  height: 51,
                  margin: EdgeInsets.symmetric(horizontal: 7),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromRGBO(176, 172, 172, 1), width: 1),
                      borderRadius: BorderRadius.circular(6)),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    style: TextStyle(fontSize: 20),
                  ),
                )
            ],
          ),
        ),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(241, 33, 90, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0) //border
                    ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 120, vertical: 18.0)),
            child: Text(
              "Lanjutkan",
              style: GoogleFonts.outfit(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            )),
      ]),
    );
  }
}
