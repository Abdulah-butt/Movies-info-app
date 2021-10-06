

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/css/style.dart';
import 'package:movies_app/util/movieInformation.dart';
class DetailPage extends StatefulWidget {

  @override
  _DetailPageState createState() => _DetailPageState();

  DetailPage(MovieInfo _movieInfo){
    title=_movieInfo.title;
    heading=_movieInfo.headline;
    summary=_movieInfo.summary;
    article_link=_movieInfo.articalLink;
    date=_movieInfo.publicationDate;
    imgUrl=_movieInfo.imgurl;

  }
}

String title='';
String heading='';
String summary='';
String article_link='';
String date='';
String imgUrl='';


class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: new AppBar(
        title: new Text("Information"),
        centerTitle: true,
        backgroundColor: headerColor,
      ),
      body: new Column(
        children: <Widget>[
          new Container(
            height: size.height*0.4,
            decoration: BoxDecoration(
              image: new DecorationImage(image: NetworkImage(imgUrl),
                fit: BoxFit.fill
              ),
              color: Colors.white,
            ),
          ),
          new SizedBox(height: size.height*0.03,),
          Container(
            padding: new EdgeInsets.only(left: 20),
            width:size.width,
              child: new Text(
                "MOVIE TITLE : ${title}",
                style: new TextStyle(color: Colors.white,fontSize: 25,fontStyle: FontStyle.italic),
              )),
          Expanded(
            child: Container(
              padding: new EdgeInsets.all(20),
              alignment: Alignment.topLeft,
              width:size.width,
              child: new ListView(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text("Headline : \n",style: titleStyle(),),
                  new Text("\t${heading}\n",style: detailsStyle(),),
              new Text("Summary : \n",style: titleStyle(),),
              new Text("\t${summary}\n",style: detailsStyle(),),
              new Text("Publication Date : \n",style: titleStyle(),),
              new Text("\t${date}\n",style: detailsStyle(),),
              new Text("Artical Link : \n",style: titleStyle(),),
              new Text("\t${article_link}\n",style: detailsStyle(),),

                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
