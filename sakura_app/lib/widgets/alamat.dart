import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sakura_app/widgets/ubahalamat.dart';
import '../provider/myProvider.dart';

class HalamanAlamat extends StatefulWidget {
  const HalamanAlamat({super.key});
  @override
  State<HalamanAlamat> createState() => _HalamanAlamatState();
}

class _HalamanAlamatState extends State<HalamanAlamat> {
  var label_format = GoogleFonts.notoSansThai(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    final alamatProvider = Provider.of<AlamatProvider>(context);
    final alamat = alamatProvider.alamat;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Alamat',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(239, 239, 239, 1),
      ),
      body: Align(
        alignment: AlignmentDirectional.topCenter,
        child: Card(
          margin: EdgeInsetsDirectional.only(top: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Color.fromRGBO(249, 241, 241, 1),
          elevation: 12,
          child: SizedBox(
            height: 450,
            width: 325,
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        'Pemilik:',
                        style: label_format,
                      ),
                      subtitle: Text(
                        alamat.pemilik,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Alamat:',
                        style: label_format,
                      ),
                      subtitle: Text(
                        alamat.alamat,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Kecamatan:',
                        style: label_format,
                      ),
                      subtitle: Text(
                        alamat.kecamatan,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Kota:',
                        style: label_format,
                      ),
                      subtitle: Text(alamat.kota),
                    ),
                    ListTile(
                      title: Text(
                        'Provinsi:',
                        style: label_format,
                      ),
                      subtitle: Text(
                        alamat.provinsi,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 35, right: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UbahAlamatPage()));
                          },
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
                                  horizontal: 25, vertical: 14.0)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
