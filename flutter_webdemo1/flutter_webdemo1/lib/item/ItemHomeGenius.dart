import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webdemo1/bean/selection_bean_entity.dart';
import 'package:flutter_webdemo1/view/ItemPriceButton.dart';

class ItemHomeGenius extends StatelessWidget {
  String imageUrl;
  String price;
  String geniusName = "";
  String geniusDesc = "";
  String helpCount = "";
  String score = "";
  List<SelectionBeanDataGeniusTopic> topics;
  GestureTapCallback onTapLisenter;
  ItemHomeGenius(
      {Key key,
      this.imageUrl,
      this.price,
      this.geniusName,
      this.geniusDesc,
      this.topics,
      this.helpCount,
      this.score,
      this.onTapLisenter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onTapLisenter,
      child: Container(
        margin: EdgeInsets.fromLTRB(13, 16, 13, 16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.network(
                  imageUrl,
                  width: 35,
                  height: 35,
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          geniusName,
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          geniusDesc,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
              child: ListView.separated(
                primary: false,
                shrinkWrap: true,
                itemCount: topics == null ? 0 : topics.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text("# " + topics[index].topicTitle);
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 6,
                  );
                },
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Text(
                  "帮助",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Text(
                    helpCount,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(250, 175, 8, 1),
                      fontSize: 12,
                    ),
                  ),
                ),
                Text(
                  "人",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 5, 0),
                  child: Text(
                    "评分",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    score,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(250, 175, 8, 1),
                      fontSize: 12,
                    ),
                  ),
                ),
                ItemPriceButton(
                  buttonText: "¥" + price,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
