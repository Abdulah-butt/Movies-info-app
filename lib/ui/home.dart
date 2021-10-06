import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/css/style.dart';
import 'package:movies_app/ui/detailPage.dart';
import 'package:movies_app/util/APIConnection.dart';
import 'package:movies_app/util/movieInformation.dart';
import 'package:movies_app/model/customUI.dart';
import 'package:loading_animations/loading_animations.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  String currentAPI=API_key;
  String currentType=type;

  bool _showLoadingicon=true;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: bgColor,
        appBar: new AppBar(
          title: new Text("MOVIES HOUSE",
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          centerTitle: true,
          backgroundColor: headerColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: new Column(
            children: <Widget>[
              Container(
                  height: size.height * 0.1,
                  width: double.infinity,
                  decoration: headerDecoration(),
                  child: new ListView(
                    padding: new EdgeInsets.fromLTRB(10, 0, 0, 0),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                    customTab("All", (){
                      currentType='all';
                      setState(() {});
                    }),
                      customTab("Horror", (){
                        currentType='horror';
                        setState(() {});
                      }),
                      customTab("Funny", (){
                        currentType='funny';
                        setState(() {});
                      }),
                      customTab("Trending", (){
                        //currentType='trending';

                        setState(() {});
                      }),

                    ],
                  )),

              new SizedBox(height: size.height*0.02,),
              new Divider(color: Colors.white54,),
              Container(
                alignment: Alignment.topLeft,
               // color: Colors.white,
                padding: new EdgeInsets.only(left: 20),
                child: new Text(
                  "${currentType.toUpperCase()}",
                  style:new TextStyle(color: Colors.white,fontSize: 30,fontStyle: FontStyle.italic,fontWeight:FontWeight.bold),),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: FutureBuilder(
                      future:getJson(currentAPI,currentType),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if(!snapshot.hasData||_showLoadingicon){
                          return Center(
                            child: Container(
                              child: LoadingBouncingGrid.square(
                                borderColor: Colors.white,
                                borderSize: 3.0,
                                size: 100.0,
                                backgroundColor: Colors.orange,
                                duration: Duration(milliseconds: 1000),

                              )
                            ),
                          );
                        }else {
                          _showLoadingicon=true;

                          return new ListView.builder(
                              itemCount: snapshot.data['results'].length,
                              itemBuilder: (BuildContext context, int position) {
                                MovieInfo obj= MovieInfo.fromMap(snapshot.data,position);
                                var media=snapshot.data['results'][position]['multimedia'];
                                var url;
                                if(media==null){
                                  url='https://motivatevalmorgan.com/wp-content/uploads/2016/06/default-movie-800x800.jpg';
                                  print("null value exits");
                                }else{
                                  url=snapshot.data['results'][position]['multimedia']['src'];
                                }

                                return ListTile(
                                  onTap: () {
                                    //print(obj.summary);
                                    Navigator.of(context).push(new MaterialPageRoute(builder: (context){
                                      return new DetailPage(obj);
                                    }));
                                  },
                                  leading: new CircleAvatar(
                                      radius: 40,
                                      backgroundImage: NetworkImage(url),
                                      backgroundColor: Colors.transparent),
                                  title: new Text(
                                    //snapshot.data['results'][position]['display_title']
                                    obj.title
                                    ,
                                    style: titleStyle(),
                                  ),
                                  subtitle: new Text(
                                    obj.summary,
                                    style: detailsStyle(),
                                  ),
                                  trailing: new Text(
                                    'Published Date\n${obj.publicationDate}',
                                    style: titleStyle(),
                                  ),
                                );
                              });
                        }
                      }),
                ),
              )
            ],
          ),
        ));


  }





  Future<Map> getJson(String api, String type) async {
    var url = Uri.parse(
        'https://api.nytimes.com/svc/movies/v2/reviews/search.json?query=$type&api-key=$api');
    http.Response response = await http.get(url);
    _showLoadingicon=false;
    return json.decode(response.body); //that was returnning Map
  }





}


