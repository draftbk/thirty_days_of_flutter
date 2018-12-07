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

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 50.0),
                  child: Text(
                    '00:00.00',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    '00:00.00',
                    style: TextStyle(
                      fontSize: 80,
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

    Column buildButtonColumn(Color color,String label) {
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
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w200,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.only(top: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Colors.black, 'Lap'),
          buildButtonColumn(Colors.green, 'Start'),
        ],
      ),
    );

    Widget textSection = Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(32.0),
      child: Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );

    return Scaffold(
        appBar: CupertinoNavigationBar(
          middle: Text('A StopWatch'),
        ),
        body: ListView(
          children: [
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
    );
  }
}