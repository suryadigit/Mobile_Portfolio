import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class TandaTangan extends StatefulWidget {
  const TandaTangan({Key? key}) : super(key: key);

  @override
  State<TandaTangan> createState() => _TandaTanganState();
}

class _TandaTanganState extends State<TandaTangan> {
  SignatureController controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.white,
    exportBackgroundColor: Color.fromRGBO(241, 33, 90, 1),
  );

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: Text('Konfirmasi'),
          content: Text('Apakah Anda yakin ingin menyimpan tanda tangan?'),
          actions: [
            TextButton(
              child: Text(
                'Batal',
                style: TextStyle(color: Color.fromRGBO(241, 33, 90, 1)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Simpan'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                primary: Color.fromRGBO(241, 33, 90, 1),
              ),
              onPressed: () {
                // Tambahkan kode untuk menyimpan tanda tangan
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _simpanTandaTangan() {
    _showConfirmationDialog();
  }

  @override
  Widget build(BuildContext context) {
    final myHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close_rounded),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Tanda Tangan',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        toolbarHeight: myHeight * 0.10,
        backgroundColor: Color.fromRGBO(239, 239, 239, 1),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Card(
            elevation: 4,
            color: Color.fromRGBO(239, 239, 239, 1),
            child: SizedBox(
              height: 350,
              width: 400,
              child: Align(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 380,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: Color.fromRGBO(241, 33, 90, 1),
                            ),
                            child: Signature(
                              controller: controller,
                              width: 360,
                              height: 250,
                              backgroundColor: Color.fromRGBO(241, 33, 90, 1),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 14),
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.clear();
                                },
                                child: Text(
                                  'Ulang',
                                  style: TextStyle(
                                    color: Color.fromRGBO(241, 33, 90, 1),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(239, 239, 239, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                    side: BorderSide(
                                      color: Color.fromRGBO(241, 33, 90, 1),
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 5.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: _simpanTandaTangan,
                            child: Text(
                              'Simpan',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(241, 33, 90, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 5.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
