import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userinput='';
  String ans='';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundcolor,
        body: SafeArea(

            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.end,
          children: [
              const SizedBox(height: 50,),
              Expanded(flex: 2,child: Text(userinput,style: const TextStyle(color: Colors.white,fontSize: 50,),maxLines: 3,)),
              Expanded(flex: 1,child: Text(ans,style: const TextStyle(color: Colors.white70,fontSize: 50),)),


              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(children: [
                  Mybutton(title: 'C', onPress: (){
                    userinput=(userinput.length>1)?userinput.substring(0,userinput.length-1):'';

                    setState(() {
                      solve();
                    });
                  },color: tnbtn,),
                  Mybutton(title: 'DEL', onPress: (){
                    userinput='';
                    ans='';
                    setState(() {
                    });
                  },color: tnbtn,),
                  Mybutton(title: '%', onPress: (){
                    userinput+='%';
                    setState(() {
                    });
                  },color: tnbtn,),
                  Mybutton(title: '/', onPress: (){
                    userinput+='/';
                    setState(() {

                    });
                  },color: opbtn,),
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(children: [
                  Mybutton(title: '7', onPress: (){

                    userinput+='7';
                    solve();
                    setState(() {

                    });
                  },color: nbtn,),
                  Mybutton(title: '8', onPress: (){
                    userinput+='8';
                    solve();
                    setState(() {
                    });
                  },color: nbtn,),
                  Mybutton(title: '9', onPress: (){
                    userinput+='9';
                    solve();
                    setState(() {
                    });
                  },color: nbtn,),
                  Mybutton(title: 'x', onPress: (){
                    userinput+='x';
                    setState(() {

                    });
                  },color: opbtn,),
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(children: [
                  Mybutton(title: '4', onPress: (){
                    userinput+='4';
                    solve();
                    setState(() {

                    });
                  },color: nbtn,),
                  Mybutton(title: '5', onPress: (){
                    userinput+='5';
                    solve();
                    setState(() {
                    });
                  },color: nbtn,),
                  Mybutton(title: '6', onPress: (){
                    userinput+='6';
                    solve();
                    setState(() {
                    });
                  },color: nbtn,),
                  Mybutton(title: '-', onPress: (){
                    userinput+='-';
                    setState(() {

                    });
                  },color: opbtn,),
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(children: [
                  Mybutton(title: '1', onPress: (){
                    userinput+='1';
                    solve();
                    setState(() {

                    });
                  },color: nbtn,),
                  Mybutton(title: '2', onPress: (){
                    userinput+='2';
                    solve();
                    setState(() {
                    });
                  },color: nbtn,),
                  Mybutton(title: '3', onPress: (){
                    userinput+='3';
                    solve();
                    setState(() {
                    });
                  },color: nbtn,),
                  Mybutton(title: '+', onPress: (){
                    userinput+='+';
                    setState(() {

                    });
                  },color: opbtn,),
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(children: [
                  Mybutton(title: '0', onPress: (){
                    userinput+='0';
                    solve();
                    setState(() {

                    });
                  },color: nbtn,),
                  Mybutton(title: '00', onPress: (){
                    userinput+='00';
                    solve();
                    setState(() {
                    });
                  },color: nbtn,),
                  Mybutton(title: '.', onPress: (){
                    userinput+='.';
                    setState(() {
                    });
                  },color: nbtn,),
                  Mybutton(title: '=', onPress: (){
                    setState(() {
                          solve();
                          userinput=ans;
                          ans='';
                    });
                  },color: opbtn,),
                ],),
              ),


          ],
        ),
            )),
      ),
    );

  }
  void solve(){

    String userinput2=userinput.replaceAll('x', '*');
    Parser p=Parser();
    Expression expression=p.parse(userinput2);
    ContextModel contextModel=ContextModel();
    double evaluate=expression.evaluate(EvaluationType.REAL, contextModel);
    ans=evaluate.toString();
  }
}
