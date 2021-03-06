/**
 * Day 1
 * A stop watch
 */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';


class Day1 extends StatefulWidget {
  @override
  createState() => Day1State();
}

class Day1State extends State<Day1> {
  List<String> items= new List<String>();
  bool _isStart=false;
  Timer _timer;
  int _num=0;
  int _startForsmall=0;
  String _rightString="Start";
  Color _rightColor=Colors.green;
  String _leftString="Lap";
  Color _leftColor=Colors.grey;
  String _totalTime="00:00:00";
  String _smallTime="00:00:00";
  @override
  Widget build(BuildContext context) {

    Widget timeSection = Container(
      padding: const EdgeInsets.all(15.0),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Text(
                    _smallTime,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    _totalTime,
                    style: TextStyle(
                      fontSize: 75,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );

    void timerHandle(Timer t) {
      setState(() {
        _num += 1;
        // calculate for _totalTime
        int tempTime=_num;
        String minute=(tempTime~/6000%60).toString();
        String second=(tempTime~/100%60).toString();
        String millisecond=(tempTime%100).toString();
        if(minute.length==1){
          minute="0"+minute;
        }
        if(second.length==1){
          second="0"+second;
        }
        if(millisecond.length==1){
          millisecond="0"+millisecond;
        }
        _totalTime=minute+":"+second+"."+millisecond;

        // calculate for _smallTime
        int tempTimeSmall=_num-_startForsmall;
        String minuteSmall=(tempTimeSmall~/6000%60).toString();
        String secondSmall=(tempTimeSmall~/100%60).toString();
        String millisecondSmall=(tempTimeSmall%100).toString();
        if(minuteSmall.length==1){
          minuteSmall="0"+minuteSmall;
        }
        if(secondSmall.length==1){
          secondSmall="0"+secondSmall;
        }
        if(millisecondSmall.length==1){
          millisecondSmall="0"+millisecondSmall;
        }
        _smallTime=minuteSmall+":"+secondSmall+"."+millisecondSmall;
      });
    }
    // right func
    void _rightPress() {
      setState(() {
        if (this._isStart) {
          this._timer.cancel();
          this._rightString="Start";
          this._rightColor=Colors.green;
          _leftString="Reset";
        } else {
          this._timer = new Timer.periodic(const Duration(milliseconds: 10), timerHandle);
          this._rightString="Stop";
          this._rightColor=Colors.red;
          this._leftString="Lap";
          _leftColor=Colors.black;
        }
        this._isStart = !this._isStart;
      });
    }

    // left func
    void _leftPress() {
      setState(() {
        if (this._isStart) {
          _startForsmall=_num;
          items.add(_smallTime);
        } else {
          if(_leftString=="Reset"){
            _leftString="Lap";
            _leftColor=Colors.grey;
            _totalTime="00:00:00";
            _smallTime="00:00:00";
            _num=0;
            _startForsmall=0;
            items.clear();
          }
        }
      });
    }


    Column buildButtonColumn(Color color,String label,bool isRight) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 75.0,
            width: 75.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
            ),
            child: InkWell(
              child: new Text(
                label,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w200,
                  color: color,
                ),
              ),
              onTap: isRight ? _rightPress:_leftPress,
            ),
          ),
        ],
      );
    }

    Widget buttonSection = Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.only(top: 30.0,bottom: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(_leftColor, _leftString,false),
          buildButtonColumn(_rightColor, _rightString,true),
        ],
      ),
    );
    Widget listSection = ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        int lapNumber=index+1;
        return Container(
          height: 50.0,
          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Lap $lapNumber',style: TextStyle(fontSize: 18)),
                  Text('                     ',style: TextStyle(fontSize: 18)),
                  Text('${items[index]}',textAlign: TextAlign.right,style: TextStyle(fontSize: 18)),
                ],
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: 1,
                color: Colors.grey[300],
              )
            ],
          ),

        );
      },
    );


    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: CupertinoNavigationBar(
          middle: Text('A StopWatch'),
        ),
        body: Column(
          children: [
            timeSection,
            buttonSection,
            Expanded(
              child: listSection,
            )
          ],
        ),
    );
  }
}