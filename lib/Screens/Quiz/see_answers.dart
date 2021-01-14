import '../../Helper/Widgets/RequiredWidgets.dart';
import '../../Helper/Service/Services.dart';
import '../../Helper/Model/QuestionModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SeeAnswers extends StatefulWidget {

  final String quizId;
  SeeAnswers({this.quizId});

  @override
  _SeeAnswersState createState() => _SeeAnswersState();
}

class _SeeAnswersState extends State<SeeAnswers> {

  DatabaseService databaseService = new DatabaseService();
  QuerySnapshot questionsSnapshot;

  QuestionModel getQuestionModelFromDatasnapshot(
      DocumentSnapshot questionSnapshot) {
    QuestionModel questionModel = new QuestionModel();
    questionModel.question = questionSnapshot.data()["question"];
    questionModel.correctOption = questionSnapshot.data()["option1"];

    return questionModel;
  }

  @override
  void initState() {
    databaseService.getInsideQuizData(widget.quizId).then((value){
      questionsSnapshot = value;
      setState(() {

      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context, "See Answers"),
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
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: questionsSnapshot.docs.length,
                itemBuilder: (context, index) {
                  return SeeAnswersTile(
                    questionModel: getQuestionModelFromDatasnapshot(
                        questionsSnapshot.docs[index]),
                    index: index,
                  );
                }
            )
          ],),
      ),
    );
  }
}

  class SeeAnswersTile extends StatefulWidget {

    final QuestionModel questionModel;
    final int index;
    SeeAnswersTile({this.questionModel, this.index});

    @override
    _SeeAnswersTileState createState() => _SeeAnswersTileState();
  }

  class _SeeAnswersTileState extends State<SeeAnswersTile> {
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
                Row(
                  children: [
                    Text("Correct Answer : ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),),
                    Text("${widget.questionModel.correctOption}",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
              ],
            )
        ),
      );
    }
  }

