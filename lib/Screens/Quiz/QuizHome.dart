import 'dart:ui';
import 'package:flutter/material.dart';
import 'PlayQuiz.dart';
import '../../Helper/Widgets/RequiredWidgets.dart';
import '../../Helper/Service/Services.dart';
import 'CreateQuiz.dart';

class QuizzHome extends StatefulWidget {
  @override
  _QuizzHomeState createState() => _QuizzHomeState();
}

class _QuizzHomeState extends State<QuizzHome> {
  Stream quizStream;
  DatabaseService databaseService = new DatabaseService();


  Widget quizList() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: StreamBuilder(
        stream: quizStream,
        builder: (context, snapshot) {
          return snapshot.data == null
              ? Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    return QuizTile(
                      imgUrl:
                          snapshot.data.documents[index].data()["quizImagURL"],
                      title: snapshot.data.documents[index].data()["quizTitle"],
                      desc: snapshot.data.documents[index].data()["quizDesc"],
                      quizId: snapshot.data.documents[index].data()["quizId"],
                    );
                  });
        },
      ),
    );
  }



  @override
  void initState() {
    databaseService.getQuizData().then((val) {
      setState(() {
        quizStream = val;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context, "Quiz"),
        backgroundColor: Colors.orange,
      ),
      body: quizList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreateQuiz()));
        },
      ),
    );
  }
}

class QuizTile extends StatelessWidget {
  final String imgUrl, title, desc, quizId;

  QuizTile(
      {@required this.imgUrl,
      @required this.title,
      @required this.desc,
      @required this.quizId});


  @override
  Widget build(BuildContext context) {

    print(quizId);

    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PlayQuiz(quizId, title)));
      },
      child: Container(
        height: 150,
        margin: EdgeInsets.only(bottom: 8),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imgUrl,
                width: MediaQuery.of(context).size.width - 48,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black26,
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    desc,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
