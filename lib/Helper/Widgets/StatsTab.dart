import 'package:flutter/material.dart';

class StatsTab extends StatelessWidget {

  final String title, count, value;
  final int upDown;
  final int textColor;

  StatsTab({this.title, this.count, this.textColor, this.upDown, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2- 45,
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 7,),
          Text(
            count,
            style: TextStyle(
              color: textColor == 1 ? Colors.orange
                  : ( textColor == 2 ? Colors.green
                  : ( textColor == 3 ? Colors.purple
                  :   Colors.red )),
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 3,),
          Row(
            children: [
              Container(
                child: upDown == 1 ? Icon(Icons.arrow_upward) : Icon(Icons.arrow_downward),
              ),
              SizedBox(width: 2,),
              Text(value,
              style: TextStyle(
                fontSize: 13,
              ),),
            ],
          )
        ],
      ),
    );
  }
}
