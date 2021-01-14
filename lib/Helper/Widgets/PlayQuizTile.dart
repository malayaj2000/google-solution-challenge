import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OptionTile extends StatefulWidget {

  final String option, description, correctAnswer, optionSelected;
  OptionTile({@required this.option,@required this.description,@required this.correctAnswer,@required this.optionSelected});
  @override
  _OptionTileState createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical:5),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              border: Border.all(
                color: widget.description == widget.option ?
                  Colors.black
                    : Colors.black45,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            alignment: Alignment.center,
            child: Text( "${widget.option}", style: TextStyle(
              fontWeight: widget.description == widget.optionSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: widget.description == widget.option ? 16 : 14,
              color: widget.description == widget.optionSelected ?
              Colors.black
                  : Colors.black45,
            ),),
          ),
          SizedBox(width: 8,),
          Container(
            width: MediaQuery.of(context).size.width - 90,
            child: Text(widget.description,
            style: TextStyle(
              fontSize: widget.description == widget.optionSelected ? 19 : 17,
              color:  widget.description == widget.optionSelected ?
              Colors.black
                  : Colors.black45,
              fontWeight: widget.description == widget.optionSelected ? FontWeight.bold : FontWeight.normal,
            ),
            ),
          ),
        ],
      ),
    );
  }
}
