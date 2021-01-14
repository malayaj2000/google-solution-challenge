import '../../Screens/Forum/CommentsPage.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  bool liked = false;
  int likeCount = 0;
  int comments = 0;


  _liked () {
    setState(() {
      liked = !liked;
      if(liked == true) {
        likeCount ++;
      } else {
        likeCount --;
      }
    });
  }

  _commentButtonPressed () {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => CommentsPage() ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              IconButton(
                icon: Icon( liked ? Icons.thumb_up : Icons.thumb_up_outlined,
                    color: liked ? Colors.orange : Colors.grey,),
                    iconSize: 19,
                    onPressed: () => _liked(),
              ),
              Text ("$likeCount likes",
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),),
            ],
          ),
          SizedBox(width: 5,),
          Column(
            children: [
              IconButton(
                icon: Icon( Icons.comment_rounded,
                  color: Colors.grey,),
                iconSize: 19,
                onPressed: () => _commentButtonPressed(),
              ),
              Text ("$comments comments",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),),
            ],
          )
        ],
      ),
    );
  }
}
