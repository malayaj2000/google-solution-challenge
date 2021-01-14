import 'CreateQuiz.dart';
import '../../Helper/Widgets/RequiredWidgets.dart';
import '../../Helper/Service/Services.dart';
import '../../Helper/Widgets/PlayQuizTile.dart';
import '../../Helper/Model/QuestionModel.dart';
import '../../Screens/Quiz/Results.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayQuiz extends StatefulWidget {

  final String quizId, quizTitle;

   PlayQuiz(this.quizId, this.quizTitle);

  @override
  _PlayQuizState createState() => _PlayQuizState();
}

int total = 0, _correct = 0, _incorrect = 0;

class _PlayQuizState extends State<PlayQuiz> {

  DatabaseService databaseService = new DatabaseService();
  QuerySnapshot questionsSnapshot;

  QuestionModel getQuestionModelFromDatasnapshot(DocumentSnapshot questionSnapshot) {
    QuestionModel questionModel = new QuestionModel();
    questionModel.question = questionSnapshot.data()["question"];

    List<String> options = [
      questionSnapshot.data()["option1"],
      questionSnapshot.data()["option2"],
      questionSnapshot.data()["option3"],
      questionSnapshot.data()["option4"],
    ];
    options.shuffle();
    questionModel.option1 = options[0];
    questionModel.option2 = options[1];
    questionModel.option3 = options[2];
    questionModel.option4 = options[3];

    questionModel.correctOption = questionSnapshot.data()["option1"];
    questionModel.answered = false;

    return questionModel;

}

  @override
  void initState() {
    databaseService.getInsideQuizData(widget.quizId).then((value){
      questionsSnapshot = value;
      _correct = 0;
      _incorrect = 0;
      total = questionsSnapshot.docs.length;

      setState(() {

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    print(quizId);

    return Scaffold(
      appBar: AppBar(
        title: appBar(context, widget.quizTitle),
          backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            questionsSnapshot == null ?
                Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ) :
                ListView.builder(
                  padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                  shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: questionsSnapshot.docs.length,
                    itemBuilder: (context, index)  {
                      return QuizPlayTile(
                          questionModel: getQuestionModelFromDatasnapshot(questionsSnapshot.docs[index]),
                        index: index,
                      );
                  }
                )
          ],),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          String youAre = "";
          if(_correct<=2) {
            youAre = "Highly Corrupt";
          } else if (_correct == 3) {
             youAre = "Not Sure";
             }
            else {
              youAre = "TrustWorthy";
          }
          Navigator.pushReplacement(context, MaterialPageRoute(builder:
          (context) => Results(
            quizId: quizId,
            correct: _correct,
            incorrect: _incorrect,
            total: total,
            youAre: youAre,
          )));
        },
      ),
    );
  }
}

class QuizPlayTile extends StatefulWidget {

  final QuestionModel questionModel;
  final int index;
  QuizPlayTile({this.questionModel, this.index});

  @override
  _QuizPlayTileState createState() => _QuizPlayTileState();
}

class _QuizPlayTileState extends State<QuizPlayTile> {

  String optionSelected = "";


  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Q${widget.index+1} ${widget.questionModel.question}",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),),
            SizedBox(height: 12,),
            GestureDetector(
              onTap: () {
                if(!widget.questionModel.answered) {
                  if(widget.questionModel.option1 == widget.questionModel.correctOption) {
                    optionSelected = widget.questionModel.option1;
                    widget.questionModel.answered = true;
                    _correct++;
                    setState(() {

                    });
                  }else {
                    optionSelected = widget.questionModel.option1;
                    widget.questionModel.answered = true;
                    _incorrect++;
                    setState(() {

                    });
                  }
                }
              },
              child: OptionTile(
                correctAnswer: widget.questionModel.correctOption,
                description: widget.questionModel.option1,
                option: "A",
                optionSelected: optionSelected,
              ),
            ),
            GestureDetector(
              onTap: (){
                if(!widget.questionModel.answered) {
                  if(widget.questionModel.option2 == widget.questionModel.correctOption) {
                    optionSelected = widget.questionModel.option2;
                    widget.questionModel.answered = true;
                    _correct++;
                    setState(() {

                    });
                  }else {
                    optionSelected = widget.questionModel.option2;
                    widget.questionModel.answered = true;
                    _incorrect++;
                    setState(() {

                    });
                  }
                }
              },
              child: OptionTile(
                correctAnswer: widget.questionModel.correctOption,
                description: widget.questionModel.option2,
                option: "B",
                optionSelected: optionSelected,
              ),
            ),
            GestureDetector(
              onTap: (){
                if(!widget.questionModel.answered) {
                  if(widget.questionModel.option3 == widget.questionModel.correctOption) {
                    optionSelected = widget.questionModel.option3;
                    widget.questionModel.answered = true;
                    _correct++;
                    setState(() {

                    });
                  }else {
                    optionSelected = widget.questionModel.option3;
                    widget.questionModel.answered = true;
                    _incorrect++;
                    setState(() {

                    });
                  }
                }
              },
              child: OptionTile(
                correctAnswer: widget.questionModel.correctOption,
                description: widget.questionModel.option3,
                option: "C",
                optionSelected: optionSelected,
              ),
            ),
            GestureDetector(
              onTap: (){
                if(!widget.questionModel.answered) {
                  if(widget.questionModel.option4 == widget.questionModel.correctOption) {
                    optionSelected = widget.questionModel.option4;
                    widget.questionModel.answered = true;
                    _correct++;
                    setState(() {

                    });
                  }else {
                    optionSelected = widget.questionModel.option4;
                    widget.questionModel.answered = true;
                    _incorrect++;
                    setState(() {

                    });
                  }
                }
              },
              child: OptionTile(
                correctAnswer: widget.questionModel.correctOption,
                description: widget.questionModel.option4,
                option: "D",
                optionSelected: optionSelected,
              ),
            ),
            SizedBox(height: 10,),
          ],
        )
      ),
    );
  }
}

