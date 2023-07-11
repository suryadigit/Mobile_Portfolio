import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sakura_app/auth/lupa_Password.dart';
import 'package:sakura_app/auth/signup.dart';

import '../widgets/bottomNavbar.dart';

bool _obscurePassword = true;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final myHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Stack(children: [
              LayoutBuilder(builder: ((context, constraints) {
                final width = constraints.maxWidth;
                return Center(
                  child: Image.asset('assets/cover.png',
                      width: width, fit: BoxFit.cover),
                );
              })),
              Positioned(
                top: 0,
                child: Image.asset('assets/cover.png', fit: BoxFit.cover),
              ),
              Container(
                padding: EdgeInsets.all(36),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 35),
                    Text('Log in',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    SizedBox(height: myHeight * 0.2),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Masukkan Email',
                        labelText: 'Email',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 88, 87, 87)),
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        hintText: 'Masukkan Password',
                        labelText: 'Password',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 88, 87, 87)),
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Lupa_password()));
                        },
                        child: Text(
                          'Lupa Password',
                          style: TextStyle(
                            color: Colors.pink[600],
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(height: 13),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyBottomNavbar()),
                        );
                      },
                      child: Text('Log in', style: TextStyle(fontSize: 18)),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.pink[500],
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 90),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)))),
                    ),
                    SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Belum punya akun? ',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Sign up',
                            style: TextStyle(color: Colors.red),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signup()),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'Atau masuk dengan',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 37, 36, 36),
                              fontSize: 11,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.red, width: 2),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: FaIcon(
                              FontAwesomeIcons.twitter,
                              color: Color.fromARGB(255, 108, 186, 250),
                              size: 30,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.red, width: 2),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: FaIcon(
                              FontAwesomeIcons.google,
                              color: Colors.red,
                              size: 30,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.red, width: 2),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: FaIcon(
                              FontAwesomeIcons.facebookF,
                              color: Colors.blue,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ])))));
  }
}
