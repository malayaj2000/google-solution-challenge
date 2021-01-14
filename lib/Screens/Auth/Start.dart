import 'package:flutter/material.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {

  navigateToLogin() async {
    Navigator.pushReplacementNamed(context, "Login");
  }

  navigateToRegister() async {
    Navigator.pushReplacementNamed(context, "SignUp");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: Column(
          children: <Widget>[

            SizedBox(height: 35.0),

            Container(
              height: 400,

              child: Image(image: AssetImage("images/logo.jpg"),
                fit: BoxFit.contain,
              ),
            ),

            SizedBox(height: 20.0),

            Container(
              margin: EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 0.0),
              child: RichText(
                text: TextSpan(
                  text: 'Welcome to ', style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
                ),
              ),
            ),

            SizedBox(height: 10.0),

            Text('Anti Corruption App',
              style: TextStyle(
                color:Colors.orange,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),),

            SizedBox(height: 30.0),


            Row(mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[

                RaisedButton(
                    padding: EdgeInsets.only(left: 30, right: 30),

                    onPressed: navigateToLogin,
                    child: Text('LOGIN', style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.orange
                ),

                SizedBox(width: 20.0),

                RaisedButton(
                    padding: EdgeInsets.only(left: 30, right: 30),

                    onPressed: navigateToRegister,
                    child: Text('REGISTER', style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.orange
                ),

              ],
            ),

          ],
        ),
      ),

    );
  }
}


