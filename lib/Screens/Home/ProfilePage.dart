
import '../../Helper/Widgets/RequiredWidgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProfileView extends StatefulWidget {
  final String userName, emailId;

  ProfileView({@required this.userName,@required this.emailId});

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  signOut() async {
    _auth.signOut();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: appBar(context, "Profile"),
          backgroundColor: Colors.orange,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 7,),
                CircleAvatar(
                  radius: 70,
                  child:  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(70),
                      child: Image.asset("images/johnny.jpg",
                        fit: BoxFit.fill,),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  initialValue: widget.userName,
                  readOnly: true,
                  decoration: InputDecoration(
                      labelText: 'Name',
                      prefixIcon: Icon(Icons.person)),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  initialValue: widget.emailId,
                  readOnly: true,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email)),
                ),
                SizedBox(height: 20,),
                RaisedButton(
                  padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                  onPressed: signOut,
                  child: Text('Signout',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                  color: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}