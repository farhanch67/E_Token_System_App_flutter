import 'package:flutter/material.dart';
class Organization_Page extends StatefulWidget {
  @override
  _Organization_PageState createState() => _Organization_PageState();
}

class _Organization_PageState extends State<Organization_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tokens List'),
        actions: <Widget>[
      IconButton(
      icon: Icon(
        Icons.account_circle,
        color: Colors.white,
      ),
      onPressed: () {
        // do something
      },
      ),
    ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.account_circle, size: 40, color: Colors.green,),
            title: Text('User Name'),
            subtitle: Text('Token Number: 0000'),
            trailing: Icon(Icons.delete),
          )
        ],
      ),
    );
  }
}

