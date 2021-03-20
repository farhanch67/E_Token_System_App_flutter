import 'package:flutter/material.dart';

class Login_form extends StatefulWidget {
  @override
  _Login_formState createState() => _Login_formState();
}

class _Login_formState extends State<Login_form> {
  @override

  var _formkey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Log in')),
      ),
      body: Form(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(48.0),
                child: Image.asset('assets/images/Splashscreenet.png'),
              ),
            )
          ],
        ),
      ),

    );
  }
}
