import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sakura_app/provider/myProvider.dart';

import 'detailBarang.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final myHeight = MediaQuery.of(context).size.height;
    final myWidth = MediaQuery.of(context).size.width;

    var prov = Provider.of<AllBarang>(context);

    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 33, 90, 1),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: myHeight * 0.03, left: myWidth * 0.05),
                child: Text(
                  "H'i Jhon\nSelamat datang",
                  style: GoogleFonts.numans(
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 0.264,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.0, right: myWidth * 0.05),
                child: Image.asset(
                  'assets/iconpeople.png',
                  width: 140,
                  height: 96,
                ),
              ),
            ],
          ),
          Container(
            width: myWidth * 0.9,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                border: InputBorder.none,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  child: Icon(
                    Icons.search,
                    color: Color.fromRGBO(241, 33, 90, 1),
                  ),
                ),
                hintText: 'Cari produk...',
                hintStyle: GoogleFonts.numans(
                  fontSize: 15,
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 7),
                  child: GestureDetector(
                      onTap: () {
                        prov.scanBarcode();
                      },
                      child: Image.asset('assets/barcodee.png')),
                ),
              ),
              onChanged: (value) {
                prov.searchTextFiled(value);
              },
            ),
          ),
          // Text(code),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(top: myWidth * 0.03),
            padding: EdgeInsets.zero,
            color: Colors.white,
            child: ListView.builder(
                itemCount: prov.listBarang.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = prov.listBarang[index];
                  return Column(
                    children: [
                      ListTile(
                        leading: Image.asset(item.image),
                        title: Text(
                          item.nama,
                          style: GoogleFonts.notoSansThai(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        subtitle: Text(
                          NumberFormat.currency(
                                  locale: "id", symbol: "Rp ", decimalDigits: 0)
                              .format(item.harga),
                          style: GoogleFonts.notoSansThai(
                              color: Color.fromRGBO(128, 128, 128, 1),
                              fontSize: 14),
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right_sharp),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailBarangScreen(barang: item),
                            ),
                          );
                        },
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 1.0,
                        thickness: 1.0,
                      ),
                    ],
                  );
                }),
          )),
        ],
      ),
    );
  }
}
