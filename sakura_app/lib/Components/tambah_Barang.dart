import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sakura_app/provider/myModel.dart';
import 'package:sakura_app/widgets/dashboard.dart';

import '../provider/myProvider.dart';

class TambahBarang extends StatefulWidget {
  const TambahBarang({Key? key}) : super(key: key);

  @override
  State<TambahBarang> createState() => _TambahBarangState();
  
}


class _TambahBarangState extends State<TambahBarang> {
  File? _imageFile;
  String? _gambarBarang;
  // TextEditingController _imageController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _hargaController = TextEditingController();
  TextEditingController _stokController = TextEditingController();
  TextEditingController _kodeController = TextEditingController();
  
  Future<File?> _pickImage(ImageSource source) async {
    
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: source);
    if (pickedImage != null) {
      return File(pickedImage.path);
    }
    return null;
  }
  

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }
   void _simpanBarang() {
  final allBarangProvider = Provider.of<AllBarang>(context, listen: false);
  if (_gambarBarang != _gambarBarang && _namaController != _namaController && _hargaController != _hargaController && _stokController != _stokController && _kodeController != _kodeController) {
    allBarangProvider.tambahBarang(
      Barang(
        image: _gambarBarang !,
        nama: _namaController.text !,
        harga: int.parse (_hargaController.text),
        stok: int.parse(_stokController.text),
        kode: _kodeController.text !,
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<AllBarang>(context, listen: false);
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
          'Tambah Item',
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
          child: Column(
            children: [
              SizedBox(height: 15),
              Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Color.fromRGBO(249, 241, 241, 1),
                  elevation: 8,
                  child: SizedBox(
                    height: 540,
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30, right: 5),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              final image =
                                  await _pickImage(ImageSource.camera);
                              if (image != null) {
                                setState(() {
                                  _imageFile = File(image.path);
                                });
                              }
                            },
                            child: Stack(
                              children: [
                                Container(
                                  width: 180,
                                  height: 140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: _imageFile != null
                                          ? FileImage(_imageFile!)
                                              as ImageProvider<Object>
                                          : AssetImage('assets/cam.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                if (_imageFile != null)
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _imageFile = null;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                        padding: EdgeInsets.all(4),
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.black,
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 22),
                            child: Container(
                              width: 300,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nama         :",
                                        style: GoogleFonts.notoSansThai(
                                          fontSize: 16,
                                        ),
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          controller: prov.namaController,
                                          style: GoogleFonts.notoSansThai(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            height: 1.5,
                                          ),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              vertical: 8,
                                              horizontal: 12,
                                            ),
                                            isDense: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Harga / pc :",
                                        style: GoogleFonts.notoSansThai(
                                          fontSize: 16,
                                        ),
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                           controller: prov.hargaController,
                                          style: GoogleFonts.notoSansThai(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            height: 1.8,
                                          ),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              vertical: 4,
                                              horizontal: 12,
                                            ),
                                            isDense: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Stok            :",
                                        style: GoogleFonts.notoSansThai(
                                          fontSize: 16,
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                controller: prov.stokController,

                                                style: GoogleFonts.notoSansThai(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold,
                                                  height: 1.5,
                                                ),
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                    vertical: 6,
                                                    horizontal: 12,
                                                  ),
                                                  isDense: true,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              "pcs                ",
                                              maxLines: 2,
                                              style: GoogleFonts.notoSansThai(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 6),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Kode           :",
                                        style: GoogleFonts.notoSansThai(
                                          fontSize: 16,
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: TextFormField(
                                            controller: prov.kodeController,
                                            style: GoogleFonts.notoSansThai(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              height: 1.5,
                                            ),
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                vertical: 6,
                                                horizontal: 12,
                                              ),
                                              isDense: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          _pickImage(ImageSource.camera);
                                        },
                                        child: Image.asset(
                                          'assets/barcodee.png',
                                          width: 30,
                                          height: 35,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    side: BorderSide(
                                      color: Color.fromRGBO(241, 33, 90, 1),
                                      width: 2,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 16,
                                    ),
                                    child: Text(
                                      'Batal',
                                      style: GoogleFonts.outfit(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 101),
                                ElevatedButton(
                                  onPressed: () {
                                    _simpanBarang();
                                    prov.addBarang(Barang(
                                        image: '/jpg' ,
                                        nama: prov.namaController.text,
                                        harga: int.parse(prov.hargaController.text),
                                        stok:int.parse(prov.stokController.text),
                                        kode: prov.kodeController.text));
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DashboardPage()));
                                  },

                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    primary: Color.fromRGBO(241, 33, 90, 1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 16,
                                    ),
                                    child: Text(
                                      'Simpan',
                                      style: GoogleFonts.outfit(fontSize: 14),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
