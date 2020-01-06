import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_webdemo1/item/ItemHomeEvent.dart';
import 'package:flutter_webdemo1/item/ItemHomeGenius.dart';
import 'package:flutter_webdemo1/view/HomePageTitleWidget.dart';

import 'bean/selection_bean_entity.dart';
import 'http/DioUtils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  List<SelectionBeanDataGroup> groups; //头顶轮播图
  List<SelectionBeanDataGeniu> genius;
  List<SelectionBeanDataNewProfessor> newProfessor;
  List<SelectionBeanDataEvent> events;
  List<SelectionBeanDataPublicMeat> publicMeats;

  void getData() async{
    DioUtils.postHttp(
      DioUtils.selection,
      parameters: {"PaimeetID":  "215"},
      onSuccess: (data) {
        Map<String, dynamic> map = json.decode(data);
        var selectionBean = SelectionBeanEntity.fromJson(map);
        groups = selectionBean.data.groups;
        genius = selectionBean.data.genius;
        newProfessor = selectionBean.data.newProfessor;
        events = selectionBean.data.events;
        publicMeats = selectionBean.data.publicMeats;
        setState(() {});
      },
      onError: (e) {},
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: HomePageTitleWidget(
              title: "推荐专家",
              rightText: "更多",
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return ItemHomeGenius(
                  imageUrl: genius[index].photoUrl,
                  price: genius[index].consultationFee.toString(),
                  geniusName: genius[index].geniusName,
                  geniusDesc: genius[index].geniusDescription,
                  topics: genius[index].topics,
                  helpCount: genius[index].helpCount.toString(),
                  score: genius[index].score.toString(),
//                  onTapLisenter: ()=>geniusClickLisenter(context,genius[index].geniusID.toString()),
                );
              },
              childCount: genius == null ? 0 : genius.length,
            ),
          ),
          SliverToBoxAdapter(
            child: HomePageTitleWidget(
              title: "最新加入",
              rightText: "更多",
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return ItemHomeGenius(
                  imageUrl: newProfessor[index].photoUrl,
                  price: newProfessor[index].consultationFee.toString(),
                  geniusName: newProfessor[index].geniusName,
                  geniusDesc: newProfessor[index].geniusDescription,
                  topics: null,
                  helpCount: newProfessor[index].helpCount.toString(),
                  score: newProfessor[index].score.toString(),
//                  onTapLisenter: ()=>geniusClickLisenter(context,newProfessor[index].geniusID.toString()),
                );
              },
              childCount: newProfessor == null ? 0 : newProfessor.length,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
            sliver: SliverGrid( //y = 180dp x = 168dp
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 168/180,
              ),
              delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    child: ItemHomeEvent(
                      eventPoster: events[index].eventPoster.toString(),
                      eventTitle: events[index].eventTitle.toString(),
                      eventTime: events[index].eventStartTime.toString(),
                      eventLocation: events[index].eventLocation.toString(),
//                      itemHomeEventOnTap: ()=>homeEventOnTap(context,events[index].eventId.toString()),
                    ),
                  );
                },
                childCount: events == null ? 0 : 2,
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: HomePageTitleWidget(
              title: "精选干货",
              rightText: "更多",
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return GestureDetector(
//                  onTap: ()=>publicMeatsOnTap(context,publicMeats[index].mtid.toString()),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Text(
                            publicMeats[index].meatsName.toString(),
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Text(
                          publicMeats[index].viewsNumber.toString() + "人看过",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(153, 153, 153, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: publicMeats == null ? 0 : publicMeats.length,
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return Text(index.toString());
            }, childCount: 200),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
