import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quiz/controller/dataController.dart';

void main(){
  runApp(MaterialApp(home: Progress(),));
}

class Progress extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 80,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
             width: double.infinity,
             height: 40,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(50),
               border: Border.all(color: Color(0xffa807ff),width: 3)
             ),
              child: GetBuilder<Controller>(
                init: Controller(),
                builder: (controller) {
                  return Stack(
                    children: [
                      LayoutBuilder(builder: (context,constraints)=>Container(
                        width: constraints.maxWidth * controller.animation.value,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xffa807f6),
                                Color(0xff9b0d74),
                                Color(0xffe70b2d)],
                              begin: Alignment.topLeft,
                              end: Alignment.topRight),
                          borderRadius: BorderRadius.circular(50)
                        ),
                      )),
                      Positioned.fill(child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${(controller.animation.value * 30).round()}sec",
                              style: TextStyle(color: Colors.white,fontSize: 17,
                                  fontWeight: FontWeight.w100,
                                  decoration: TextDecoration.none),),
                            Icon(CupertinoIcons.clock,color: Colors.white,)
                          ],
                        ),
                      ))
                    ],
                  );
                },
              ),
            ),
          )
        ],
      );
  }

}


class Controller extends GetxController with SingleGetTickerProviderMixin{

  late AnimationController animationController;
  late Animation _animation;

  //so we can access our animation outside
  Animation get animation => this._animation;

  @override
  void onInit() {
  animationController = AnimationController(duration:Duration(seconds: 30) ,vsync: this);
  _animation = Tween<double>(begin: 0,end: 1).animate(animationController)..addListener(() {
    update();
  });

  //start our animation
  animationController.forward();
  }
}