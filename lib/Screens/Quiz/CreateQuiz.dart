import '../../Helper/Service/Services.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

import '../../Helper/Widgets/RequiredWidgets.dart';
import 'AddQuestion.dart';

bool _isLoading = false;

class CreateQuiz extends StatefulWidget {
  @override
  _CreateQuizState createState() => _CreateQuizState();
}

final _formKey = GlobalKey<FormState>();
String quizImageUrl, quizTitle, quizDescription, quizId;
DatabaseService databaseService = new DatabaseService();

class _CreateQuizState extends State<CreateQuiz> {
  createQuizOnline() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      quizId = randomAlphaNumeric(16);

      Map<String, String> quizMap = {
        "quizId": quizId,
        "quizImagURL": quizImageUrl,
        "quizTitle": quizTitle,
        "quizDesc": quizDescription,
      };

      await databaseService.addQuizData(quizMap, quizId).then((value) {
        setState(() {
          _isLoading = false;
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => AddQuestion(quizId: quizId,)
          ));
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context, "Create Quiz"),
        backgroundColor: Colors.orange,
      ),
      body: Form(
        key: _formKey,
        child: _isLoading
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? "Enter Image URL " : null,
                      decoration: InputDecoration(hintText: "Quiz Image URL"),
                      onChanged: (val) {
                        quizImageUrl = val;
                      },
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? "Enter Quiz Title " : null,
                      decoration: InputDecoration(hintText: "Quiz Title"),
                      onChanged: (val) {
                        quizTitle = val;
                      },
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? "Enter Quiz Description " : null,
                      decoration: InputDecoration(hintText: "Quiz Description"),
                      onChanged: (val) {
                        quizDescription = val;
                      },
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          createQuizOnline();
                        },
                        child: blueButton(
                            context: context,
                            label: "CreateQuiz",)),
                    SizedBox(
                      height: 70,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
