

import 'dart:async';

import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  String? id;
  int? minute;

   CountDownTimer({Key? key, this.id, this.minute}) : super(key: key);

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  // Step 2
  Timer? countdownTimer;
  int min = 0;
  Duration myDuration = Duration();

  @override
  void initState() {
    super.initState();
    setState((){
      min = widget.minute!;
    });
    myDuration = Duration(minutes: min);
    if(min != 0 ){
      startTimer();
    }
  }

  /// Timer related methods ///
  // Step 3
  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }
  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }
  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(days: 5));
  }
  // Step 6
  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);
    // Step 7
    // final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return
      // Scaffold(
      // appBar: ...,
      // body:
      Center(
        child: Column(
          children: [

            // Step 8
            Text(
              '$minutes:$seconds',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
            SizedBox(height: 20),
            // Step 9
            // ElevatedButton(
            //   onPressed: startTimer,
            //   child: Text(
            //     'Start',
            //     style: TextStyle(
            //       fontSize: 14,
            //     ),
            //   ),
            // ),
            // Step 10
            // Step 11
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderDetail(
            //         id: widget.id,
            //         time: "300"
            //       )));
            //     },
            //     child: Text(
            //       'Next',
            //       style: TextStyle(
            //         fontSize: 30,
            //       ),
            //     ))
          ],
        ),
      )
    // )
    ;
  }
}