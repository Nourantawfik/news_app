import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Adaptiveindcator extends StatelessWidget {

  String oS ;
  Adaptiveindcator(this.oS) ;

  @override
  Widget build(BuildContext context) {

   if(this.oS == 'android')
     {
     return  CircularProgressIndicator() ;
     }
   else
     {
       return CupertinoActivityIndicator();
     }
  }
}
