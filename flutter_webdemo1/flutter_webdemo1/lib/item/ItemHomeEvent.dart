import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemHomeEvent extends StatelessWidget {
  String eventPoster;
  String eventTitle;
  String eventTime;
  String eventLocation;
  GestureTapCallback itemHomeEventOnTap;
  ItemHomeEvent(
      {Key key,
      this.eventPoster,
      this.eventTitle,
      this.eventTime,
      this.eventLocation,
      this.itemHomeEventOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: itemHomeEventOnTap,
      child: Container(
        height: (MediaQuery.of(context).size.width) * (168/180),
        decoration: new BoxDecoration(
          //背景
          color: Colors.white,
          //设置四周圆角 角度
          borderRadius: BorderRadius.circular(10),
          //设置四周边框
          border:
              new Border.all(width: 1, color: Color.fromRGBO(242, 242, 242, 1)),
        ),
        child: Flex(
          direction: Axis.vertical,
          mainAxisSize: MainAxisSize.min,
//        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  image:  DecorationImage(
                    image: NetworkImage(eventPoster??'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 3),
              child: Text(
                eventTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 3),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.calendar_today,
                    size: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Text(
                      eventTime,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(153, 153, 153, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 3),
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    size: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      eventLocation,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(153, 153, 153, 1),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
