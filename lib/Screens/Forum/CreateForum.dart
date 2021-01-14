import '../../Helper/Widgets/RequiredWidgets.dart';
import '../../Helper/Service/Services.dart';
import 'package:flutter/material.dart';


class CreateForum extends StatefulWidget {
  @override
  _CreateForumState createState() => _CreateForumState();
}

final GlobalKey<FormState> _newFormKey = GlobalKey<FormState>();
String name, title, desc;
bool _isLoading = false;

DatabaseService databaseService = new DatabaseService();

class _CreateForumState extends State<CreateForum> {

  uploadBlog () async {
    if (_newFormKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });


      Map <String, String> forumMap = {
        "title": title,
        "desc": desc,
        "name": name,
      };

      await databaseService.addForumData(forumMap).then((result) {
        setState(() {
          _isLoading = false;
          Navigator.of(context).pop();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: appBar(context, "Create Post"),
          backgroundColor: Colors.orange,
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                uploadBlog();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.file_upload,),
              ),
            )
          ],
        ),
        body: Form(
          key: _newFormKey,
          child: _isLoading ? Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
              : Container(
            margin: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width-24,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (val) =>
                        val.isEmpty ? "Enter Name" : null,
                        decoration: InputDecoration(
                          hintText: "Name",
                        ),
                        onChanged: (val) {
                          name = val;
                        },
                      ),
                      TextFormField(
                        validator: (val) =>
                        val.isEmpty ? "Enter Title" : null,
                        decoration: InputDecoration(
                          hintText: "Title",
                        ),
                        onChanged: (val) {
                          title = val;
                        },
                      ),
                      TextFormField(
                        validator: (val) =>
                        val.isEmpty ? "Enter Description" : null,
                        decoration: InputDecoration(
                          hintText: "Description",
                        ),
                        onChanged: (val) {
                          desc = val;
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
