import 'package:flutter/material.dart';
import 'package:quiver/strings.dart';


class SignUpForm extends StatefulWidget {
  @override
  SignUpFormState createState() => new SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  var _passKey = GlobalKey<FormFieldState>();

  String _name = '';
  String _email = '';
  int _phone = 0;
  String _password = '';
  bool _termsChecked = true;

  void onPressedSubmit() {
    if (_formKey.currentState.validate() && _termsChecked) {
      _formKey.currentState.save();

      // print("Name " + _name);
      // print("Email " + _email);
      // print("Phone " + _phone.toString());
      // print("Password " + _password);
      // print("Termschecked " + _termsChecked.toString());
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Form Submitted')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Register Now'),
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: new ListView(
              children: getFormWidget(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getFormWidget() {
    List<Widget> formWidget = new List();
    formWidget.add(new Container(
      child: Container(
        // width:  double.infinity,
        height: 100.0,
        child: Image.asset('assets/images/Splashscreenet.png',),
      ),
    ),);
    formWidget.add(new TextFormField(
        decoration: InputDecoration(labelText: 'Enter User Name', hintText: 'Company Name'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter a name';
          }
        },
        onSaved: (value) {
          setState(() {
            _name = value;
          });
        }));

    formWidget.add(new TextFormField(
        decoration:
        InputDecoration(labelText: 'Enter Email', hintText: 'Email'),
        keyboardType: TextInputType.emailAddress,
        validator: validateEmail,
        onSaved: (value) {
          setState(() {
            _email = value;
          });
        }));

    formWidget.add(new TextFormField(
        decoration: InputDecoration(labelText: 'Enter Phone Number', hintText: 'Number'),
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter Age';
          }
        },
        onSaved: (value) {
          setState(() {
            _phone = int.tryParse(value);
          });
        }));

    formWidget.add(new TextFormField(
        key: _passKey,
        obscureText: true,
        decoration:
        InputDecoration(labelText: 'Enter Password', hintText: 'Password'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter Password';
          }
          if (value.length < 8) {
            return 'Password should be more than 8 characters';
          }
        }));

    formWidget.add(
      new TextFormField(
          obscureText: true,
          decoration: InputDecoration(
              hintText: 'Confirm Password',
              labelText: 'Enter Confirm Password'),
          validator: (confirmPassword) {
            if (confirmPassword.isEmpty) return 'Enter confirm password';
            var password = _passKey.currentState.value;
            if (!equalsIgnoreCase(confirmPassword, password))
              return 'Confirm Password invalid';
          },
          onSaved: (value) {
            setState(() {
              _password = value;
            });
          }),
    );



    formWidget.add(CheckboxListTile(
      value: _termsChecked,
      onChanged: (value) {
        setState(() {
          _termsChecked = value;
        });
      },
      subtitle: !_termsChecked
          ? Text(
        'Required',
        style: TextStyle(color: Colors.red, fontSize: 12.0),
      )
          : null,
      title: new Text(
        'I agree to the terms and condition',
      ),
      controlAffinity: ListTileControlAffinity.leading,
    ));

    formWidget.add(new RaisedButton(
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
        onPressed: onPressedSubmit));

    return formWidget;
  }

  String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter mail';
    }

    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }
}
