import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sakura_app/provider/myProvider.dart';

import '../reusableWidgets/myAppbar.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  // int _selectedIndex = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  var tanggal = GoogleFonts.notoSansThai(
      fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black);
  var isian = GoogleFonts.notoSansThai(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: Color.fromRGBO(0, 0, 0, 1),
  );

  
  @override
  Widget build(BuildContext context) {
    final myHeight = MediaQuery.of(context).size.height;

    var filter = Provider.of<HistoryFilter>(context);

    return Scaffold(
      appBar: MyAppBar(title: 'Riwayat'),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: myHeight * 0.03, left: 10),
              child: DropdownButton2<String>(
                value: filter.selectedValue,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                alignment: Alignment.centerLeft,
                items: List.generate(
                    filter.historyFilter.length,
                    (index) => DropdownMenuItem(
                        value: filter.historyFilter[index],
                        child: Text(
                          filter.historyFilter[index],
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ))),
                onChanged: (value) {
                  filter.selectedValue = value;
                },
                buttonStyleData: const ButtonStyleData(
                  height: 40,
                  width: 140,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 30,
                ),
              ),
            ),
            Card(
              margin: EdgeInsetsDirectional.only(top: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Color.fromRGBO(249, 241, 241, 1),
              elevation: 12,
              child: IntrinsicHeight(
                child: SizedBox(
                  width: 325,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 25, bottom: 2, top: 10),
                          child: Text('Jumat, 31 Maret 2023', style: tanggal),
                        ),
                        ListTile(
                          leading:
                              Text('Barang “Surya 12” dihapus', style: isian),
                          trailing: Text(
                            '13.20',
                            style: isian,
                          ),
                          visualDensity:
                              VisualDensity(horizontal: 0, vertical: -4),
                          dense: true,
                        ),
                        ListTile(
                          leading:
                              Text('Barang “Surya 12” dihapus', style: isian),
                          trailing: Text(
                            '13.20',
                            style: isian,
                          ),
                          visualDensity:
                              VisualDensity(horizontal: 0, vertical: -4),
                          dense: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsetsDirectional.only(top: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Color.fromRGBO(249, 241, 241, 1),
              elevation: 12,
              child: SizedBox(
                width: 325,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, bottom: 2, top: 10),
                        child: Text('Minggu, 26 Maret 2023', style: tanggal),
                      ),
                      ListTile(
                        leading: Text('Barang “Ultra Milk 250ML” ditambah',
                            style: isian),
                        trailing: Text(
                          '13:25',
                          style: isian,
                        ),
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4),
                        dense: true,
                      ),
                      ListTile(
                        leading: Text('Barang “Ultra Milk 250ML” dihapus',
                            style: isian),
                        trailing: Text(
                          '15:10',
                          style: isian,
                        ),
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4),
                        dense: true,
                      ),
                      ListTile(
                        leading:
                            Text('Barang “Magnum Black” diedit', style: isian),
                        trailing: Text(
                          '20:03',
                          style: isian,
                        ),
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4),
                        dense: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsetsDirectional.only(top: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Color.fromRGBO(249, 241, 241, 1),
              elevation: 12,
              child: SizedBox(
                width: 325,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, bottom: 2, top: 10),
                        child: Text('Kamis, 23 Maret 2023', style: tanggal),
                      ),
                      ListTile(
                        leading:
                            Text('Barang “Magnum Black” diedit', style: isian),
                        trailing: Text(
                          '13:25',
                          style: isian,
                        ),
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4),
                        dense: true,
                      ),
                      ListTile(
                        leading: Text('Kasbon baru ditambah', style: isian),
                        trailing: Text(
                          '15:10',
                          style: isian,
                        ),
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4),
                        dense: true,
                      ),
                      ListTile(
                        leading: Text('Kasbon dihapus', style: isian),
                        trailing: Text(
                          '20:03',
                          style: isian,
                        ),
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4),
                        dense: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
