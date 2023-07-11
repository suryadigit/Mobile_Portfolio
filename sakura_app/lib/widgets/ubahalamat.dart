import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/myProvider.dart';

class UbahAlamatPage extends StatefulWidget {
  UbahAlamatPage({super.key});

  @override
  State<UbahAlamatPage> createState() => _UbahAlamatPageState();
}

class _UbahAlamatPageState extends State<UbahAlamatPage> {
  var label_format = GoogleFonts.notoSansThai(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  TextEditingController pemilikController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController kecamatanController = TextEditingController();
  TextEditingController kotaController = TextEditingController();
  TextEditingController provinsiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EditAlamat(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Edit Alamat',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(239, 239, 239, 1),
        ),
        body: Consumer<EditAlamat>(
          builder: (context, editAlamat, _) {
            return ListView(children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Color.fromRGBO(249, 241, 241, 1),
                  elevation: 4,
                  child: SizedBox(
                    height: 544,
                    width: 500,
                    child: Align(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pemilik",
                                style: label_format,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: TextField(
                                  controller: editAlamat.pemilikController,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 20.0),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0))),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: Text(
                                  "Alamat",
                                  style: label_format,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: TextField(
                                  controller: editAlamat.alamatController,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 20.0),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0))),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: Text(
                                  "Kecamatan",
                                  style: label_format,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: TextField(
                                  controller: editAlamat.kecamatanController,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 20.0),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0))),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: Text(
                                  "Kota",
                                  style: label_format,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: TextField(
                                  controller: editAlamat.kotaController,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 20.0),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0))),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: Text(
                                  "Provinsi",
                                  style: label_format,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: TextField(
                                  controller: editAlamat.provinsiController,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 20.0),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0))),
                                ),
                              ),
                              Align(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: Padding(
                                      padding: const EdgeInsets.only(top: 50),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          final alamatProvider =
                                              Provider.of<AlamatProvider>(
                                                  context,
                                                  listen: false);
                                          editAlamat.updateAlamat(
                                              alamatProvider, context);
                                        },
                                        child: Text(
                                          'Simpan',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromRGBO(
                                                    241, 33, 90, 1),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        16.0) //border
                                                ),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30, vertical: 5.0)),
                                      )))
                            ]),
                      ),
                    ),
                  ),
                ),
              ),
            ]);
          },
        ),
      ),
    );
  }
}
