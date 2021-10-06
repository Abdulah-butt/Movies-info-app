
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/ui/home.dart';
import 'package:movies_app/util/APIConnection.dart';

Widget customTab(String name,action()){
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: new ElevatedButton(
      onPressed: ()  {
        action();
      },
      child: new Text(name,style: new TextStyle(color: Colors.black),),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.yellow))),
        backgroundColor: MaterialStateProperty.all(Colors.yellow),

      ),
    ),
  );
}