import 'package:flutter/material.dart';
import 'package:quiz/view/splash.dart';

class Resultpage extends StatefulWidget {
  final int correctAnswer;
  final int questionsTotal;

  const Resultpage(
      {super.key, required this.correctAnswer, required this.questionsTotal});

  @override
  State<Resultpage> createState() => _ResultpageState();
}

class _ResultpageState extends State<Resultpage> {
  var finalResult;
  var completed;

  @override
  void initState() {
    finalResult = (((widget.correctAnswer / widget.questionsTotal) * 100));
    if (finalResult > 50) {
      completed = true;
    } else {
      completed = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xA96B0875),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Image.asset(
                    "assets/images/congrats.jpg",
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${finalResult}% Score",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: completed ? Colors.green : Colors.red,
                    ),
                  ),
                  Text("Quiz Completed Successfully..!"),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "You attempt ${widget.questionsTotal} Questions and \nfrom that ${widget.correctAnswer} answer is correct.",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Splash()));
            },
            child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: completed ? Colors.green : Colors.red),
                child: completed
                    ? Center(
                  child: Text(
                    "Play Again!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                )
                    : Center(
                  child: Text(
                    "Try again",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                )),
          )
        ],
      ),
    );
  }
}