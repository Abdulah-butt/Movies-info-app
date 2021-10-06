import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MovieInfo {
  String _title = '',
      _headline = '',
      _summary = '',
      _publicationDate = '',
      _imgurl = '',
      _articalLink = '';

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  MovieInfo(this._title, this._headline, this._summary, this._publicationDate,
      this._imgurl, this._articalLink);

  MovieInfo.fromMap(dynamic map,int position) {
    try {
      _title = map['results'][position]['display_title'];
      _headline = map['results'][position]['headline'];
      _summary = map['results'][position]['summary_short'];
      _publicationDate = map['results'][position]['publication_date'];
      if(map['results'][position]['multimedia']==null){
        _imgurl='https://motivatevalmorgan.com/wp-content/uploads/2016/06/default-movie-800x800.jpg';
      }else{
        _imgurl = map['results'][position]['multimedia']['src'];
      }

      _articalLink = map['results'][position]['link']['url'];
    }catch(e){
      print(e.toString());
    }

  }

  get headline => _headline;

  set headline(value) {
    _headline = value;
  }

  get summary => _summary;

  set summary(value) {
    _summary = value;
  }

  get publicationDate => _publicationDate;

  set publicationDate(value) {
    _publicationDate = value;
  }

  get articalLink => _articalLink;

  set articalLink(value) {
    _articalLink = value;
  }

  get imgurl => _imgurl;

  set imgurl(value) {
    _imgurl = value;
  }
}



// Factory MovieInfo.fromMap(Map<String, dynamic> map) {
//   return MovieInfo(
// _title:
// map['results']['display_title'],
// _headline:
// map['results']['display_title'],
// _summary:
// map['results']['display_title'],
// _publicationDat:
// map['results']['display_title'],
// _imgurl:
// map['results']['display_title'],
// _articalLink:
// map['results']['display_title'],
// );



// _title:map['results']['display_title'],
// _headline:map['results']['display_title'],
// _summary:map['results']['display_title'],
// _publicationDat:map['results']['display_title'],
// _imgurl:map['results']['display_title'],
// _articalLink:map['results']['display_title']
