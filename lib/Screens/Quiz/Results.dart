import '../../Helper/Widgets/RequiredWidgets.dart';
import 'package:flutter/material.dart';


class Results extends StatelessWidget {

  final int correct, incorrect,total;
  final String quizId, youAre;

  Results({@required this.quizId, @required this.correct, @required this.incorrect, @required this.total, @required this.youAre});


  @override
  Widget build(BuildContext context){

    final TextStyle titleStyle = TextStyle(
        color: Colors.black87,
        fontSize: 16.0,
        fontWeight: FontWeight.w500
    );
    final TextStyle trailingStyle = TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 20.0,
        fontWeight: FontWeight.bold
    );

    print(youAre);
    print(quizId);

    return Scaffold(
      appBar: AppBar(
        title: appBar(context, "Results"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Card(
                shadowColor: Colors.black,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Total Questions", style: titleStyle),
                  trailing: Text("$total", style: trailingStyle),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                shadowColor: Colors.black,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Score", style: titleStyle),
                  trailing: Text("${(correct/total) * 100}%", style: trailingStyle),
                ),
              ),
              Card(
                shadowColor: Colors.black,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("You Are", style: titleStyle),
                  trailing: youAre == "Highly Corrupt" ?
                  Text(youAre,
                      style: TextStyle(
                        fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      ),
                  )
                  : (youAre == "Not Sure") ?  Text(youAre,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ) :  Text(youAre,
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  )
                ),
              ),
              SizedBox(height: 10.0),
              SizedBox(height: 10.0),
              Card(
                shadowColor: Colors.black,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Correct Answers", style: titleStyle),
                  trailing: Text("$correct/$total", style: trailingStyle),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                shadowColor: Colors.black,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Incorrect Answers", style: titleStyle),
                  trailing: Text("$incorrect", style: trailingStyle),
                ),
              ),
              SizedBox(height: 20.0),
              Card(
                shadowColor: Colors.black,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Not Attempted", style: titleStyle),
                  trailing: Text("${total - (correct + incorrect)}", style: trailingStyle),
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.orange,
                    child: Text("Goto Home"),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

