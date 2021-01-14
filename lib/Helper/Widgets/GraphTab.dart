import 'package:flutter/material.dart';

class GraphTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(15),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadowColor: Colors.black45,
            elevation: 7,
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 24,
                          child: Text(
                            "Account Anomalies",
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]
                  ),
                  SizedBox(height: 30,),
                  Container(
                    child: Image(
                      image: AssetImage("images/10.jpg"),
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: Image(
                      image: AssetImage("images/2.jpg"),
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: Image(
                      image: AssetImage("images/3.jpg"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 20,),
        Container(
          margin: EdgeInsets.all(15),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadowColor: Colors.black45,
            elevation: 7,
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 24,
                          child: Text(
                            "Insurance Claim Detection",
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]
                  ),
                  SizedBox(height: 30,),
                  Container(
                    child: Image(
                      image: AssetImage("images/9.jpg"),
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: Image(
                      image: AssetImage("images/11.jpg"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 30,),
        Container(
          margin: EdgeInsets.all(15),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadowColor: Colors.black45,
            elevation: 7,
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 24,
                          child: Text(
                            "Corruption Indices across Different Countries",
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: Image(
                      image: AssetImage("images/12.jpg"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]
    );
  }
}
