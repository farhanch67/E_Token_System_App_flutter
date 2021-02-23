import 'package:flutter/material.dart';

class InputToken extends StatefulWidget {
  @override
  _InputTokenState createState() => _InputTokenState();
}

class _InputTokenState extends State<InputToken> {
  String dropdownValue = 'Select';
  var _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          DropdownButton<String>(
            isExpanded: true,
            value: dropdownValue,
            icon: Icon(Icons.arrow_downward),
            // iconSize: 24,
            // elevation: 16,
            style: TextStyle(color: Colors.black87),
            underline: Container(
              height: 2,
              color: Colors.green,
            ),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>['Select', 'One', 'Two', 'Free', 'Four']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Expanded(
            child: TextFormField(
              validator: (String value) {
                if (value.isEmpty)
                  return 'Please enter your name';
                },
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Please enter Email';
                }
              },
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              validator: ( String value) {
                if (value.isEmpty) {
                  return 'Please enter your Phone Number';
                }
              },
              decoration: InputDecoration(
                labelText: 'Contact Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 35,
            child: RaisedButton(
              color: Colors.green,
              onPressed: () {
                setState(() {
                  if (_formkey.currentState.validate());
                }
                );
              },
              child: Text('GET TOKEN', style: TextStyle(
                color: Colors.white,
              ),),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
