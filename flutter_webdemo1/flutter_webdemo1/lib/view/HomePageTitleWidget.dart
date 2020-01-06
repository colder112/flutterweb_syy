
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageTitleWidget extends StatelessWidget{
  String title="";
  String rightText="";

  HomePageTitleWidget(
      {Key key,
        this.title,
        this.rightText,
        })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.fromLTRB(14, 20, 14, 20),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: Text(
              rightText,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(6, 0, 0, 0),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 10,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

}