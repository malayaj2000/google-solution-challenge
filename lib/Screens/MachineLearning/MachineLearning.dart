import '../../Helper/widgets/GraphTab.dart';
import '../../Helper/Widgets/RequiredWidgets.dart';
import '../../Helper/widgets/StatsTab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MachineLearning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context, "Analytics and ML"),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadowColor: Colors.black45,
                elevation: 7,
                child: Container(
                  padding: EdgeInsets.all(13),
                  height: 470,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width - 24,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Cases",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]
                        ),
                      ),
                      Flexible(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            StatsTab(
                              title: "Lodged Cases",
                              count: "18.8 K",
                              textColor: 1,
                              upDown: 1,
                              value: "2.5 K",
                            ),
                            StatsTab(
                              title: "Solved Cases",
                              count: "10.3 K",
                              textColor: 2,
                              upDown: 0,
                              value: "1.1 K",
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: <Widget>[
                            StatsTab(
                              title: "Ongoing Cases",
                              count: "6.4 K",
                              textColor: 3,
                              upDown: 0,
                              value: "500",
                            ),
                            StatsTab(
                              title: "Unsolved Cases",
                              count: "2.1 K",
                              textColor: 4,
                              upDown: 1,
                              value: "300",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 24,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Users",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: <Widget>[
                            StatsTab(
                              title: "Total Users",
                              count: "20.9 K",
                              textColor: 1,
                              upDown: 1,
                              value: "3.7 K",
                            ),
                            StatsTab(
                              title: "Active Users",
                              count: "12.3 K",
                              textColor: 2,
                              upDown: 1,
                              value: "2.6 K",
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: <Widget>[
                            StatsTab(
                              title: "Casual Users",
                              count: "5 K",
                              textColor: 3,
                              upDown: 0,
                              value: "900",
                            ),
                            StatsTab(
                              title: "Inactive Users",
                              count: "3.5 K",
                              textColor: 4,
                              upDown: 0,
                              value: "700",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            GraphTab(),
          ],
        ),
      ),
    );
  }
}

