import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogTab extends StatefulWidget {

  final String title, desc, img, postUrl;

  BlogTab({@required this.img,@required this.title,@required this.desc,this.postUrl});


  @override
  _BlogTabState createState() => _BlogTabState();
}

class _BlogTabState extends State<BlogTab> {


  Future<void> _launched;
  Future<void> _launchInBrowser( String url) async {
    if(await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    }
    else {
      throw 'Could not launch $url';
    }
  }



  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ),
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                child: Image.asset(widget.img,
                  width: MediaQuery.of(context).size.width - 24,
                  height: MediaQuery.of(context).size.width / 2,
                  fit: BoxFit.fill,),
              ),
            ),
            Container(
              color: Colors.white54,
              width: MediaQuery.of(context).size.width - 24,
              padding: EdgeInsets.all(5),
              child: Text(widget.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 2,),
            Container(
              color: Colors.white54,
              width: MediaQuery.of(context).size.width - 24,
              padding: EdgeInsets.all(5),
              child: Text( widget.desc,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            InkWell(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Posted few hours ago",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),),
                    SizedBox(width: 140,),
                    new Text(
                      "see more",
                      style: new TextStyle(
                          color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,),
                    ),
                  ],
                ),
              onTap: () {
                if (widget.postUrl != null) {
                  _launched = _launchInBrowser(widget.postUrl);
                }
                else {
                  return;
                }
              },
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
