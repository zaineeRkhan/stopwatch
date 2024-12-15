import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class stopwatch extends StatefulWidget {
 @override
  State<stopwatch> createState() => _stopwatchState();
}

class _stopwatchState extends State<stopwatch> {

  late Stopwatch stopwatch;
  late Timer t;
  void handleStartStop(){
   if(stopwatch.isRunning){
     stopwatch.stop();
   }
   else{
     stopwatch.start();
   }
  }
  String returnFormatedText(){
    var milli = stopwatch.elapsed.inMilliseconds;
    String milliseconds = (milli % 1000).toString().padLeft(3,"0");
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2,"0");
    String minuts = ((milli ~/ 1000)~/60).toString().padLeft(2,"0");
    return"$minuts:$seconds:$milliseconds";
  }
  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();
    t = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red.shade900,
        title: Text('Stopwatch',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:25),),
        centerTitle:true,
      ),
      body:Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CupertinoButton(onPressed: (){
            handleStartStop();
          },
        padding: EdgeInsets.all(0),
        child:
        Container(
          height:250,
          alignment:Alignment.center,
          
          decoration:BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.red.shade900,width: 5),
          ) ,
          child: Text(returnFormatedText(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:30),),
        ),
          ),
          SizedBox(height: 10,),
          CupertinoButton(child: Text('Reset',style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold,fontSize:15),)
              , onPressed:(){
            stopwatch.reset();
              })
        ], ),
      ), );
  }
}

  
 
  
