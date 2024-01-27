import 'package:flutter/material.dart';

const Color backgroundcolor=Colors.black;

const Color nbtn=Colors.white12;
const Color tnbtn=Colors.white70;
const Color opbtn=Colors.orangeAccent;
const Color txtcolor=Colors.white;

class Mybutton extends StatelessWidget {

  final String title;
  final Color color;
  final VoidCallback onPress;

   const Mybutton({super.key,required this.title,this.color=nbtn,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: InkResponse(onTap: onPress,child: Container(padding: const EdgeInsets.all(20),decoration: BoxDecoration(shape: BoxShape.circle,color: color,),child: Center(child: FittedBox(child: Text(title,style: const TextStyle(color: txtcolor,fontSize: 30),))),)));
  }
}
