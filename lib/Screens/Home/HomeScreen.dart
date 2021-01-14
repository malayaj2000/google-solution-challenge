import '../../Helper/Widgets/RequiredWidgets.dart';
import '../../Helper/widgets/YoutubeVideoTile.dart';
import '../../Screens/Forum/ForumHomePage.dart';
import '../../Screens/MachineLearning/MachineLearning.dart';
import '../../Screens/Home/ProfilePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Article/ArticlesPage.dart';
import '../Complaint/ComplaintHome.dart';
import '../Quiz/QuizHome.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.pushReplacementNamed(context, "start");
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
    return firebaseUser;
  }

  signOut() async {
    _auth.signOut();
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: appBar(context, "Anti Corruption App"),
          backgroundColor: Colors.orange,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfileView(
                                        userName: user.displayName,
                                        emailId: user.email,
                                      )));
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 25,
                              child: Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.asset(
                                    "images/johnny.jpg",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Text("Anti Corruption App",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w800)),
                        ]),
                  )),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.emoji_objects,
                      size: 31,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Take a Quiz',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QuizzHome()));
                },
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.forum,
                      size: 31,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Forum',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ForumHomePage()));
                },
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.analytics,
                      size: 31,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Container(
                        width: 220,
                        child: Text(
                          'Analytics and Machine Learning',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MachineLearning()));
                },
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.report_problem,
                      size: 31,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Lodge Complaint',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FormScreen()));
                },
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.article,
                      size: 31,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Articles Page',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BlogPost()));
                },
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.settings,
                      size: 31,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
                onTap: () {},
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              ListTile(
                title: Text(
                  "Privacy Policy",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Terms of Use",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          child: isloggedin == false
              ? Container(
            child: Center(child: CircularProgressIndicator()),
          )
              : SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 300,
                  child: Image(
                    image: AssetImage("images/welcome.jpg"),
                    fit: BoxFit.contain,
                  ),
                ),
                YoutubeVideoTile(img: "images/yt1.jpg", title: "Here Are 10 Ways to Fight Corruption", postUrl: "https://youtu.be/vx2773eSbec", channelName: 'World Bank', logo: "images/ytlogo1.jpg",),
                SizedBox(height: 15,),
                YoutubeVideoTile(img: "images/yt2.jpg", title: "How does corruption affect you? | Transparency International", postUrl: "https://youtu.be/FYorzlkCWYo" , channelName: 'Transparency International', logo: "images/ytlogo4.jpg",),
                SizedBox(height: 15,),
                YoutubeVideoTile(img: "images/yt3.jpg", title: "Corruption Perceptions Index 2019 | Transparency International", postUrl: "https://youtu.be/xBYLnMCWqiA", channelName: 'Transparency International', logo: "images/ytlogo4.jpg",),
                SizedBox(height: 15,),
                YoutubeVideoTile(img: "images/yt4.jpg", title: "Exporting Corruption Report 2020 (With Subs) | Transparency International", postUrl: "https://youtu.be/A_RO-JEgGVs", channelName: 'Transparency International', logo: "images/ytlogo4.jpg",),
                SizedBox(height: 15,),
              ],
            ),
          ),
        ));
  }
}
