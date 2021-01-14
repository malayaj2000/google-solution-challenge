import '../../Helper/widgets/ForumTab.dart';
import '../../Helper/Widgets/RequiredWidgets.dart';
import '../../Helper/Service/Services.dart';
import 'package:flutter/material.dart';

import 'CreateForum.dart';

class ForumHomePage extends StatefulWidget {
  @override
  _ForumHomePageState createState() => _ForumHomePageState();
}

class _ForumHomePageState extends State<ForumHomePage> {
  Stream forumStream;
  DatabaseService databaseService = new DatabaseService();

  Widget forumList() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: StreamBuilder(
        stream: forumStream,
        builder: (context, snapshot) {
          return snapshot.data == null
              ? Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    return ForumTab(
                      title: snapshot.data.documents[index].data()["title"],
                      desc: snapshot.data.documents[index].data()["desc"],
                      name: snapshot.data.documents[index].data()['name'],
                    );
                  });
        },
      ),
    );
  }

  @override
  void initState() {
    databaseService.getForumData().then((val) {
      setState(() {
        forumStream = val;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context, "Forum"),
        backgroundColor: Colors.orange,
      ),
      body: forumList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreateForum()));
        },
      ),
    );
  }
}
