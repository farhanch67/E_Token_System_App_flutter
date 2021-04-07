import 'package:etoken_flutter_app/OrganizationPage.dart';
import 'package:flutter/material.dart';
import 'ReuseAble.dart';
import 'registerScreen.dart';
import 'OrganizationPage.dart';

class Login_form extends StatefulWidget {
  @override
  _Login_formState createState() => _Login_formState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool _autoValidate = false;

class _Login_formState extends State<Login_form> {
  @override
  var _formkey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Log in')),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Container(
                  // width:  double.infinity,
                  height: 100.0,
                  child: Image.asset('assets/images/Splashscreenet.png',),
                ),
              ),
              SizedBox(height: 30.0,),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    CustomTextField(
                      icon: Icon(Icons.email),
                      hint: "EMAIL",
                    ),
                    SizedBox(height: 30),
                    CustomTextField(
                      icon: Icon(Icons.lock),
                      obsecure: true,
                      validator: (input) => input.isEmpty ? "*Required" : null,
                      hint: "PASSWORD",
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        height: 35.0,
                        child: RaisedButton(
                          onPressed: () {
                            setState(() {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Organization_Page()) );});
                          },
                          color: Theme.of(context).primaryColor,
                          splashColor: Colors.white,
                          highlightElevation: 0.0,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        height: 35.0,
                        child: RaisedButton(
                          onPressed: () {
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SignUpForm()) );
                            });
                          },
                          color: Theme.of(context).primaryColor,
                          splashColor: Colors.white,
                          highlightElevation: 0.0,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          child: Text(
                            "Register Now",
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
