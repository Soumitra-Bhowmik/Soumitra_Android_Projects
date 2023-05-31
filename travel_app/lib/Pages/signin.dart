import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homepage.dart';
import 'signup.dart';
import 'viewpage.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailcontroller = TextEditingController();

  final TextEditingController _passwordcontroller = TextEditingController();

  signin() async {
    try {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const ViewPage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showDialog(
          context: context, // <<----
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Dialog(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$e',
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: const Color.fromARGB(255, 22, 3, 3)))
                ],
              ),
            );
          },
        );
      } else if (e.code == 'wrong-password') {
        showDialog(
          context: context, // <<----
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Dialog(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$e',
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: const Color.fromARGB(255, 22, 3, 3)))
                ],
              ),
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(213, 41, 163, 59),
        leading: IconButton(
            iconSize: 20,
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => const HomePage()));
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color.fromARGB(255, 253, 253, 253),
            )),
        title: Text('LOGIN PAGE',
            style: GoogleFonts.roboto(
                fontSize: 23.0,
                color: const Color.fromARGB(255, 247, 244, 243),
                fontWeight: FontWeight.bold)),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/ss.png'), fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text("Email : ",
                      style: GoogleFonts.abrilFatface(
                          fontSize: 18.0,
                          color: const Color.fromARGB(255, 11, 4, 143))),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _emailcontroller,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    style: GoogleFonts.roboto(
                        fontSize: 20.0,
                        color: const Color.fromARGB(255, 6, 5, 27),
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        filled: true,
                        isDense: true,
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 2, 4, 90), width: 1),
                        ),
                        hintText: "Email",
                        hintStyle: GoogleFonts.abrilFatface(
                            fontSize: 16.0,
                            color: const Color.fromARGB(255, 15, 2, 24))),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text("Password : ",
                      style: GoogleFonts.abrilFatface(
                          fontSize: 18.0,
                          color: const Color.fromARGB(255, 11, 4, 143))),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _passwordcontroller,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    style: GoogleFonts.roboto(
                        fontSize: 20.0,
                        color: const Color.fromARGB(255, 3, 3, 15),
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        filled: true,
                        isDense: true,
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 2, 4, 90), width: 1),
                        ),
                        hintText: "Password",
                        hintStyle: GoogleFonts.abrilFatface(
                            fontSize: 16.0,
                            color: const Color.fromARGB(255, 15, 2, 24))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: MaterialButton(
                        minWidth: 200.0,
                        height: 50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: const Color.fromARGB(255, 6, 59, 204),
                        child: Text('LOG  IN',
                            style: GoogleFonts.abrilFatface(
                                fontSize: 16.0,
                                color:
                                    const Color.fromARGB(255, 250, 252, 249))),
                        onPressed: () {
                          signin();
                          setState(() {
                            _emailcontroller.clear();
                            _passwordcontroller.clear();
                          });
                        }),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => const SignUp()));
                      },
                      child: Text("Don't Have Account?",
                          style: GoogleFonts.abrilFatface(
                              fontSize: 24.0,
                              color: const Color.fromARGB(255, 246, 0, 0))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
