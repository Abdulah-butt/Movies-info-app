
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Color headerColor=new Color(0xff1c262F);
Color bgColor=new Color(0xff182c38);

TextStyle titleStyle(){

  return TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic

  );
}

TextStyle detailsStyle() {
  return TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic

  );
}
  BoxDecoration headerDecoration(){
    return BoxDecoration(
        color: Colors.white54,
      borderRadius:new BorderRadius.all(Radius.circular(20.0))
    );
  }
