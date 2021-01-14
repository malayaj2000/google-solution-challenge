import '../../Helper/Widgets/RequiredWidgets.dart';
import 'package:flutter/material.dart';

class CommentsPage extends StatefulWidget {
  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {

  List<String> _comments = [];
  void _addComment (String val) {
    setState(() {
      _comments.add(val);
    });
  }

  Widget _buildCommentList() {
    return ListView.builder(
      itemBuilder : (context, index) {
        if( index < _comments.length) {
          return _buildCommentItem(_comments[index]);
        }
      }
    );
  }

  Widget _buildCommentItem (String comment) {
    return ListTile(
      leading:  ClipRRect(
        borderRadius: BorderRadius.circular(23),
        child: Image.asset("images/johnny.jpg",
          fit: BoxFit.fill,),
      ),
      title: Text(comment),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context, "Comments"),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: _buildCommentList()),
          TextField(
            onSubmitted: (String submittedStr) {
              _addComment(submittedStr);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(20),
              hintText: "Add Comment",
            ),
          )
        ],
      ),
    );
  }
}
