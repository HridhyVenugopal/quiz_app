import 'package:flutter/material.dart';
import 'package:quiz/view/questions.dart';


class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xA96B0875),
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          SizedBox(height: 150,),
          const Image(image: AssetImage("assets/images/Screenshot_2024-02-03_011614-removebg-preview.png")),
          const SizedBox(height: 50,),
          Column(
            children: [
              ElevatedButton(onPressed: (){},
                  style: ButtonStyle(
                      maximumSize: MaterialStateProperty.all(Size.fromHeight(100)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                      backgroundColor: MaterialStatePropertyAll(Color(
                          0xffa807ff))),
                  child:InkWell(
                    onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QuestionPage())),
                      child: const  Text("Start Quiz",style: TextStyle(color: Colors.white),))),
              SizedBox(height: 100,),
              const  Text("Powered by",style: TextStyle(color: Colors.grey,fontSize: 15),),
              SizedBox(height: 5,),
              const  Text("www.artifitia.com",style: TextStyle(color: Colors.grey,fontSize: 18))
            ],
          ),
        ],
      ),
    );
  }
}