import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sakura_app/provider/myModel.dart';
import 'package:sakura_app/provider/myProvider.dart';

import '../reusableWidgets/myAppbar.dart';
import 'editBarang.dart';

class DetailBarangScreen extends StatefulWidget {
  final Barang barang;
  const DetailBarangScreen({required this.barang, super.key});

  @override
  State<DetailBarangScreen> createState() => _DetailBarangScreenState();
}

class _DetailBarangScreenState extends State<DetailBarangScreen> {
  @override
  Widget build(BuildContext context) {
    // final myHeight = MediaQuery.of(context).size.height;
    var prov = Provider.of<AllBarang>(context, listen: false);

    return Scaffold(
      appBar: MyAppBar(title: 'Rincian Barang'),
      body: Align(
        alignment: Alignment.topCenter,
        child: Card(
          margin: EdgeInsets.only(top: 15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Color.fromRGBO(249, 241, 241, 1),
          elevation: 8,
          child: SizedBox(
            height: 440,
            width: 330,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EditBarangScreen(barang: widget.barang),
                                  fullscreenDialog: true));
                        },
                        icon: Icon(Icons.edit)),
                  ),
                  Image.asset(
                    widget.barang.image,
                    height: 120,
                    width: 120,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 22),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(0, 0.8),
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 22, left: 12),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Nama         : ",
                                  style: GoogleFonts.notoSansThai(fontSize: 14),
                                ),
                                Flexible(
                                  child: Text(
                                    widget.barang.nama,
                                    style: GoogleFonts.notoSansThai(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                    softWrap: true,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Harga / pc : ",
                                    style:
                                        GoogleFonts.notoSansThai(fontSize: 14)),
                                Text(
                                  NumberFormat.currency(
                                          locale: "id",
                                          symbol: "Rp ",
                                          decimalDigits: 0)
                                      .format(widget.barang.harga),
                                  style: GoogleFonts.notoSansThai(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text("Stok            : ",
                                    style:
                                        GoogleFonts.notoSansThai(fontSize: 14)),
                                Text(
                                  widget.barang.stok.toString(),
                                  style: GoogleFonts.notoSansThai(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text("Kode           : ",
                                    style:
                                        GoogleFonts.notoSansThai(fontSize: 14)),
                                Text(
                                  widget.barang.kode,
                                  style: GoogleFonts.notoSansThai(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: Color.fromRGBO(
                                241, 33, 90, 1), // Background color
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Text(
                                    "Yakin Menghapus Barang Ini?",
                                    style: TextStyle(
                                      color: Colors.pink,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(
                                      color: Colors.pink,
                                      width: 2.0,
                                    ),
                                  ),
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              child: OutlinedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                style: OutlinedButton.styleFrom(
                                                  side: BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 224, 28, 110),
                                                    width: 1.0,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                ),
                                                child: Text(
                                                  "Batal",
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 224, 28, 110),
                                                      fontSize: 14),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 50,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              child: OutlinedButton(
                                                onPressed: () {
                                                  prov.hapusBarang(
                                                      widget.barang);
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                          '${widget.barang.nama} berhasil dihapus.'),
                                                    ),
                                                  );
                                                },
                                                style: OutlinedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  backgroundColor: Colors.pink,
                                                  foregroundColor: Colors.white,
                                                ),
                                                child: Text(
                                                  "Hapus",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsetsDirectional.symmetric(
                                horizontal: 2, vertical: 2),
                            child: Text(
                              'Hapus',
                              style: GoogleFonts.outfit(fontSize: 14),
                            ),
                          )))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
