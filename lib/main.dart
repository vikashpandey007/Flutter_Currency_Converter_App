import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var text = ["CNY", "JPY", "MYR", "EUR", "HYD", "JPY", "AUD", "MYR", "NZD"];
  int count = 0;
  changetext(int textCount) {
    setState(() {
      count = textCount;
    });
  }

  TextEditingController input = TextEditingController();
  TextEditingController output = TextEditingController();

  void botton_pressed(String bottonText) {

    setState(() {
      changetext(count);
      output.text="Please Enter Valid Number";
      return;
    });
    switch (bottonText) {
      case "CNY":   output.text= ((double.parse(input.text))*10.79).toString();
        break;
      case "JPY":   output.text = ((double.parse(input.text))*15.69).toString();
        break;
      case "MYR":  output.text = ((double.parse(input.text))*55.79).toString();
        break;
      case "EUR":  output.text = ((double.parse(input.text))*90.79).toString();
        break;
      case "HYD":  output.text = ((double.parse(input.text))*20.79).toString();
        break;
      case "JPY":   output.text = ((double.parse(input.text))*50.79).toString();
        break;
      case "AUD":  output.text = ((double.parse(input.text))*5.79).toString();
        break;
      case "MYR":  output.text = ((double.parse(input.text))*0.79).toString();
        break;
      case "NZD":   output.text = ((double.parse(input.text))*0.79).toString();
        break;
    }
  }

  Widget buildBotton(String bottonText,int i,Color colorName) {
    return MaterialButton(
      
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(12)),
        color: colorName,
      onPressed: () {
        botton_pressed(bottonText);
        changetext(i);
      },
      child: Text(bottonText,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      
      splashColor: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Currency Converter",
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(90, 20, 0, 0),
                padding: new EdgeInsets.only(top: 92.0),
                child: Text(
                  "Currency Converter",
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(),
                padding: EdgeInsets.all(25),
                child: TextFormField(
                  controller: input,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[300],
                    hintText: "Amount  In INR",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(),
                padding: EdgeInsets.all(25),
                child: TextFormField(
                  controller: output,
                  decoration: new InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[300],
                    hintText: "Result",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              Text(
                text[count],
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 28.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  buildBotton(text[0],0,Colors.red[100]),
                  buildBotton(text[1],1,Colors.redAccent),
                  buildBotton(text[2],2,Colors.tealAccent),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  buildBotton(text[3],3,Colors.greenAccent),
                  buildBotton(text[4],4,Colors.blueAccent),
                  buildBotton(text[5],5,Colors.cyanAccent),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  buildBotton(text[6],6,Colors.indigo),
                  buildBotton(text[7],7,Colors.lightGreen),
                  buildBotton(text[8],8,Colors.lime),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}