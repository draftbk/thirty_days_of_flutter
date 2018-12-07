import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thirty_days_of_flutter/days/Day1.dart';
import 'package:thirty_days_of_flutter/days/Day2.dart';

void main() => runApp(new IndexPage());

class IndexPage extends StatelessWidget {
  Widget menuIcons (BuildContext context, Icon icon,String title, Widget nextPage) {
    return Container(
        decoration: BoxDecoration(
            border: BorderDirectional(
              bottom: const BorderSide(color: const Color(0xFFCCCCCC)),
              end: const BorderSide(color: const Color(0xFFCCCCCC)),
            )
        ),
        child: InkWell(
            onTap: (){
              Navigator.of(context).push(CupertinoPageRoute<bool>(
                builder: (BuildContext context) => nextPage,
              ),);
            },
            child: Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    icon,
                    Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child:  Text(
                            title,style: TextStyle(fontSize: 16)
                        )
                    )
                  ],
                )

            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: const Text('30 Days of Flutter'),
      ),
      body: GridView.count(
        primary: false,
        crossAxisCount: 3,
        children: <Widget>[
          menuIcons(context, Icon(FontAwesomeIcons.stopwatch, size: 50.0, color: Color(0xFFFF856C)), 'Day1' ,Day1()),
//          menuIcons(context, Icon(FontAwesomeIcons.cloudSunRain, size: 50.0, color: Color(0xFF90BDC1)), 'Day2' ,Day2()),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}