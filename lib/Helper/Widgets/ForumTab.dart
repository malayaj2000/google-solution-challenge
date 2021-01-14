import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LikesComments.dart';

class ForumTab extends StatefulWidget {

  final String title, desc;
  final String name;

  ForumTab(
      {@required this.title,
        @required this.name,
        @required this.desc});

  @override
  _ForumTabState createState() => _ForumTabState();
}

class _ForumTabState extends State<ForumTab> {
  String firstHalf, secondHalf;
  bool flag =true;

  @override
  void initState() {
    super.initState();
    if (widget.desc.length > 155) {
      firstHalf = widget.desc.substring(0, 155);
      secondHalf = widget.desc.substring(155,widget.desc.length);
    } else {
      firstHalf = widget.desc;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {

    print("firsthalf : $firstHalf" );
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Card(
              shadowColor: Colors.grey,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.white54,
                      width: MediaQuery.of(context).size.width - 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 24,
                            child:  Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Image.asset("images/johnny.jpg",
                                  fit: BoxFit.fill,),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.25 - 50,
                            child: Text( widget.name,
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                )),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      color: Colors.white54,
                      width: MediaQuery.of(context).size.width - 36,
                      padding: EdgeInsets.all(5),
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        color: Colors.white54,
                        width: MediaQuery.of(context).size.width - 36,
                        padding: EdgeInsets.all(5),
                        child: secondHalf.isEmpty
                            ? Text(firstHalf,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),)
                            :Column (
                          children: <Widget>[
                            Text( flag ?
                            (firstHalf + "...") : (firstHalf + secondHalf),
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            InkWell(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    flag ? "show more" : "show less",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  flag = !flag;
                                });
                              },
                            )
                          ],
                        )
                    ),
                    Post(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
