import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shops/screens/profile_screen.dart';
import 'package:shops/screens/search_screen.dart';
import '../screens/order_sceen.dart';
import '../screens/user_productscreen.dart';
import '../providers/auth.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hi Friend'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.shop),
              title: Text('shop'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              }),
          Divider(),
          ListTile(
              leading: Icon(Icons.payment),
              title: Text('Orders'),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(order_sceen.routedname);
              }),
          Divider(),
          ListTile(
              leading: Icon(Icons.edit),
              title: Text('Manage Products'),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(user_productscreen.routedname);
              }),
          Divider(),
          ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('/');
                Provider.of<Auth>(context, listen: false).logout();
              }),
          Divider(),
          ListTile(
            leading: Icon(Icons.face),
            title: Text('Profile'),
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => Profile(
                            auth: auth,
                          )));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Profile'),
            onTap: () {
              Navigator.push(
                  context, CupertinoPageRoute(builder: (context) => Search()));
            },
          ),
        ],
      ),
    );
  }
}
