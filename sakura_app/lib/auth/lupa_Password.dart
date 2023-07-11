import 'package:flutter/material.dart';
import 'package:sakura_app/Components/getStart.dart';


class Lupa_password extends StatefulWidget {
  const Lupa_password({Key? key}) : super(key: key);

  @override
  State<Lupa_password> createState() => _Lupa_passwordState();
}

class _Lupa_passwordState extends State<Lupa_password> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
                child: Stack(children: [
              Positioned(
                top: 0,
                child: Image.asset('assets/cover1.png', width: width),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(36),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: width * 0.2),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Lupa Password?',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink[600],
                              ),
                            )),
                        SizedBox(height: 25),
                        Text(
                          'Masukkan email yang Anda gunakan saat mendaftar akun dan kode verifikasi akan dikirim.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Masukkan Email',
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 88, 87, 87)),
                            filled: true,
                            fillColor: Color.fromARGB(255, 255, 255, 255),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                        SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Getstart()),
                            );
                          },
                          child:
                              Text('Lanjutkan', style: TextStyle(fontSize: 18)),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.pink[500],
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 113),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)))),
                        ),
                      ]),
                ),
              ),
            ]))));
  }
}
