import 'package:flutter/material.dart';
import 'package:sakura_app/widgets/dashboard.dart';


class Getstart extends StatelessWidget {
  Getstart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 90,
              left: 0,
              right: 0,
              bottom: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/get.png'),
                  SizedBox(height: 16),
                  Text(
                    'Akun Anda telah',
                    style: TextStyle(
                      color: Colors.pink[500],
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'berhasil dibuat',
                    style: TextStyle(
                      color: Colors.pink[500],
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 60),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DashboardPage()));
                    },
                    child:
                        Text('Mulai Sekarang', style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.pink[500],
                        padding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 60),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
