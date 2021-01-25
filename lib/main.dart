import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>with SingleTickerProviderStateMixin {
    //SingleTickerProviderStateMixin it response of animationController
    //we will define the duration that the pointer will take by controller
    //we will create animation to define opacity value at begin and it's end
    //all of above will do in init state method before built in of the page
    //and we will remove controller from the ram after it finish
    AnimationController _controller;
    Animation _animation;

    @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: Duration(seconds: 2));
    _animation = Tween(begin: 0.0,end: 1.0).animate(_controller);

    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    //we will start the animation by call the forward method
    _controller.forward();
    return MaterialApp(
      title: "FadeTransition",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Fade Transition"),
        ),
        body: Center(child:
          FadeTransition(opacity: _animation,
          child: Text("My name is ahmed",style: TextStyle(fontSize: 50,color:Colors.blue),),
          )
          ,),
      ),
    );
  }
}

