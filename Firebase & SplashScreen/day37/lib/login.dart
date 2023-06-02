
import 'package:day37/view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({ Key? key }) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  FirebaseAuth? _firebaseAuth;

  signin() async {
    try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _emailcontroller.text,
    password: _passwordcontroller.text
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, 
        icon: Icon(Icons.arrow_back_ios)),
      ),

      
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: _emailcontroller,
            ),
            TextField(
              controller: _passwordcontroller,
            ),
            ElevatedButton(
                onPressed: () {
                  signin();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewData()));
                },
                child: Text("SIGN IN"))
          ],
        ),
      ),
    );
  }
}