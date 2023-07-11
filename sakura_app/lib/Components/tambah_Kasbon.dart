import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sakura_app/Components/Halaman_Kasbon.dart';
import 'package:sakura_app/provider/adduserkasbon.dart';
// import 'package:sakura_app/widgets/alamat.dart';

class TambahKasbon extends StatefulWidget {
  const TambahKasbon({Key? key});

  @override
  State<TambahKasbon> createState() => _TambahKasbonState();
}

class _TambahKasbonState extends State<TambahKasbon> {
  final TextEditingController _namaPelangganController =
      TextEditingController();
  final TextEditingController _totalHutangController = TextEditingController();
  final TextEditingController _catatanController = TextEditingController();
  final TextEditingController _tanggalJatuhTempoController =
      TextEditingController();
  final numberFormat = NumberFormat.decimalPattern('id');
  int _currentInputLength = 0;
  int _maxInputLength = 150;

  @override
  void dispose() {
    _namaPelangganController.dispose();
    _totalHutangController.dispose();
    _catatanController.dispose();
    _tanggalJatuhTempoController.dispose();
    super.dispose();
  }

  Future<void> _updateKasbon() async {
    final name = _namaPelangganController.text;
    final harga = _totalHutangController.text;

    final userProvider = Provider.of<KasbonProvider>(context, listen: false);
    await userProvider.updateKasbon(
      name,
      harga,
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final myHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(239, 239, 239, 1),
        toolbarHeight: myHeight * 0.12,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          padding: EdgeInsets.only(left: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Tambah Kasbon',
          style: GoogleFonts.notoSansThai(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 15),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.pink[400],
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(children: [
                      TextFormField(
                        controller: _namaPelangganController,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Nama Pelanggan',
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          contentPadding: EdgeInsets.all(12),
                          filled: true,
                          fillColor: Colors.pink[400],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Total Hutang: Rp  ',
                            style: GoogleFonts.notoSansThai(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.number,
                                maxLength: 7,
                                controller: _totalHutangController,
                                style: GoogleFonts.notoSansThai(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  counterText: '',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  contentPadding: EdgeInsets.all(12),
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 187, 95, 123),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none),
                                ),
                                onChanged: (value) {
                                  final cleanedValue =
                                      value.replaceAll('.', '');
                                  final formattedValue =
                                      NumberFormat('#,###', 'id')
                                          .format(int.parse(cleanedValue));
                                  _totalHutangController.value =
                                      TextEditingValue(
                                    text: formattedValue,
                                    selection: TextSelection.collapsed(
                                        offset: formattedValue.length),
                                  );
                                }),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.phone,
                        maxLength: 13,
                        decoration: InputDecoration(
                            hintText: 'No. Handphone',
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            contentPadding: EdgeInsets.all(12),
                            filled: true,
                            fillColor: Colors.pink[400],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            counterText: ''),
                      ),
                      SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Catatan',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        controller: _catatanController,
                        maxLength: _maxInputLength,
                        onChanged: (value) {
                          setState(() {
                            _currentInputLength = value.length;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Tanggal jatuh tempo, dsb.',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 10,
                          ),
                          counterText: '$_currentInputLength/$_maxInputLength',
                          counterStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 10,
                          ),
                          contentPadding: EdgeInsets.all(12),
                          filled: true,
                          fillColor: Colors.pink[400],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        maxLines: null,
                        minLines: 3,
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            'TTD Pelanggan',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 90),
                          Text(
                            'KTP Pelanggan',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Image.asset(
                            'assets/tanda_tangan.png',
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(width: 120),
                          Image.asset(
                            'assets/e-ktp.png',
                            width: 100,
                            height: 100,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          _updateKasbon().then((_) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HalamanKasbon(
                                  // name: _namaPelangganController.text,
                                  // harga: _totalHutangController.text,
                                ),
                              ),
                            );
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 300),
                          child: Image.asset(
                            'assets/unduhh.png',
                            width: 24,
                            height: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
