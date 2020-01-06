import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemPriceButton extends StatefulWidget {
  String buttonText;
  Color buttonTextColor;
  Color bgColor;
  ItemPriceButton({Key key, this.buttonText,this.buttonTextColor,this.bgColor}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ItemPriceButton();
  }
}

class _ItemPriceButton extends State<ItemPriceButton> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: double.minPositive, //宽度尽可能小
        minHeight: double.minPositive, //最小高度为50像素
      ),
      child: Container(
          decoration: new BoxDecoration(
            //背景
            color: widget.bgColor ?? Color.fromRGBO(253, 249, 236, 1),
            //设置四周圆角 角度
            borderRadius: BorderRadius.circular(5),
            //设置四周边框
//        border: new Border.all(width: 1, color: Colors.red),
          ),
          child: Padding(
            padding: widget.buttonText.isNotEmpty ? const EdgeInsets.fromLTRB(9, 2, 9, 2) : const EdgeInsets.fromLTRB(0, 0, 0, 0),  //,默认text为空时,就不设置padding,相当于隐藏view
            child: Center(
              child: Text(
                widget.buttonText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: widget.buttonTextColor ?? Color.fromRGBO(173, 143, 63, 1),
                ),
              ),
            ),
          )),
    );
  }
}
