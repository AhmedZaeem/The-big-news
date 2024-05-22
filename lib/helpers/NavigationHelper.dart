import 'package:flutter/material.dart';

mixin Navigationhelper{
  void jmp(context,{required Widget to ,bool withReplace = false }){
  if (withReplace) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => to));
  }
  else{
    Navigator.push(context, MaterialPageRoute(builder: (context) => to));

  }
  }
}