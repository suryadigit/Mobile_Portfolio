import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../reusableWidgets/myAppbar.dart';

class DetailKasbon extends StatefulWidget {
  const DetailKasbon({super.key});

  @override
  State<DetailKasbon> createState() => _DetailKasbonState();
}

class _DetailKasbonState extends State<DetailKasbon> {
  var label_format = GoogleFonts.notoSansThai(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    final myWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: MyAppBar(title: 'Detail Kasbon'),
      body: Align(
        alignment: AlignmentDirectional.topCenter,
        child: Card(
          margin: EdgeInsetsDirectional.only(top: 18),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Color.fromRGBO(241, 33, 90, 2))),
          color: Color.fromRGBO(249, 241, 241, 1),
          elevation: 12,
          child: IntrinsicHeight(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 23, horizontal: 18),
              width: myWidth * 0.88,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Nama                  : ',
                        style: label_format,
                      ),
                      Expanded(child: Text('Mba Tessa Siburian')),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Total Kasbon     : ',
                        style: label_format,
                      ),
                      Expanded(child: Text('Rp 16.000,00'))
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'No Handphone : ',
                        style: label_format,
                      ),
                      Expanded(child: Text('082366590887'))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 90,
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                spreadRadius: 0,
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/e-ktp.png',
                                fit: BoxFit.cover,
                              )),
                        ),
                        Container(
                          height: 90,
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                spreadRadius: 0,
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/tanda_tangan.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text('Catatan',
                      style: GoogleFonts.outfit(
                          fontSize: 12, fontWeight: FontWeight.w700)),
                  Center(
                    child: Container(
                      color: Color.fromRGBO(241, 33, 90, 1),
                      width: myWidth * 0.88,
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        child: Text(
                          'Mba Tessa kasbon tanggal 28 April, jatuh tempo tanggal 5 Mei 2023.',
                          style: GoogleFonts.outfit(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Ubah',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 14),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(241, 33, 90, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(16.0) //border
                                ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
