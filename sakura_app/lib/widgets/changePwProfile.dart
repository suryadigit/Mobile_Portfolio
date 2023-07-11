import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePwProfile extends StatefulWidget {
  const ChangePwProfile({super.key});

  @override
  State<ChangePwProfile> createState() => _ChangePwProfileState();
}

class _ChangePwProfileState extends State<ChangePwProfile> {
  var labelFormat = GoogleFonts.notoSansThai(
      fontSize: 15.0, fontWeight: FontWeight.w600, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    final myHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        backgroundColor: Color.fromRGBO(241, 33, 90, 1),
        toolbarHeight: myHeight * 0.08,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100))),
        bottom: PreferredSize(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Ganti Password',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Masukkan password lama Anda agar \ndapat membuat password baru.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w100),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
            preferredSize: Size.fromHeight(100)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Color.fromRGBO(249, 241, 241, 1),
                elevation: 12,
                child: SizedBox(
                  width: 325,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password Lama',
                          style: labelFormat,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            hintText: 'Masukkan Password Lama',
                            suffixIcon: Icon(Icons.visibility_off),
                            filled: true,
                            fillColor: Color.fromARGB(255, 255, 255, 255),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(0, 0, 0, 0.19))),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Lupa password?',
                            style: TextStyle(
                                color: Color.fromRGBO(241, 33, 90, 1)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsetsDirectional.only(top: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Color.fromRGBO(249, 241, 241, 1),
                elevation: 12,
                child: SizedBox(
                  width: 325,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 20, left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password Lama',
                          style: labelFormat,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            hintText: 'Masukkan Password Lama',
                            suffixIcon: Icon(Icons.visibility_off),
                            filled: true,
                            fillColor: Color.fromARGB(255, 255, 255, 255),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(0, 0, 0, 0.19))),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Password Baru',
                          style: labelFormat,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            hintText: 'Konfirmasi Password Baru',
                            suffixIcon: Icon(Icons.visibility_off),
                            filled: true,
                            fillColor: Color.fromARGB(255, 255, 255, 255),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(0, 0, 0, 0.19))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35, left: 240),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.pop(context);
                    // ScaffoldMessenger.of(context)
                    //     .showSnackBar(SuccessChangePw().getSnackBar(context));
                  },
                  child: Text(
                    'Simpan',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(241, 33, 90, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0) //border
                          ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 14.0)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
