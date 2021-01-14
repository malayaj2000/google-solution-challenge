import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class YoutubeVideoTile extends StatefulWidget {

  final String img,logo,title,channelName,postUrl;

  YoutubeVideoTile({@required this.img,@required this.title,@required this.postUrl,@required this.channelName, @required this.logo});


  @override
  _YoutubeVideoTileState createState() => _YoutubeVideoTileState();
}

class _YoutubeVideoTileState extends State<YoutubeVideoTile> {

  Future<void> _launched;

  Future<void> _launchInYoutube (String url) async {
    if(await canLaunch(url)) {
      final bool launchSucceeded = await launch(
        url,
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if(!launchSucceeded) {
        await launch(url, forceSafariVC: true);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.postUrl != null) {
          _launched = _launchInYoutube(widget.postUrl);
        }
        else {
          return;
        }
      },
      child: Card(
        shadowColor: Colors.grey,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        child: Container(
          padding: EdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.width - 12,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 1),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(widget.img,
                    width: 320,
                    height: 180,
                    fit: BoxFit.fill,),
                ),
              ),
              // Image(
              //   width: 320,
              //   height: 180,
              //   image: NetworkImage(video.thumbnailUrl),
              // ),
              SizedBox(height: 5.0),
              Row(
                children: <Widget>[
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(widget.logo,
                        width: 48,
                        height: 48,
                        fit: BoxFit.fill,),
                    ),
                  ),
                  SizedBox(width: 7,),
                  Container(
                    padding: EdgeInsets.all(7),
                    width: MediaQuery.of(context).size.width / 1.25 - 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.title,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 2,),
                        Text(
                          widget.channelName,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
