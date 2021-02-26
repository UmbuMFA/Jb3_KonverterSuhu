import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TempApp(),
    );
  }
}

class TempApp extends StatefulWidget {
  @override
  TempState createState() => TempState();
}

class TempState extends State<TempApp> {
  double input;
  double kelvin;
  double reamur;

  @override
  void initState() {
    super.initState();
    input = 0.0;
    kelvin = 0.0;
    reamur = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [],
    );

    Container allContainer = Container(
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          TextFormField(
            decoration:
                InputDecoration(hintText: 'Masukkan Suhu dalam Celcius'),
            keyboardType: TextInputType.number,
            onChanged: (str) {
              try {
                input = double.parse(str);
              } catch (e) {
                input = 0.0;
              }
            },
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ], // Only numbers can be entered
          ),
          Container(
            width: 500,
            height: 50,
            margin: EdgeInsets.only(top: 150),
            
            // ignore: deprecated_member_use
            child: Text(
              "Hasil Konversi Suhu",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25 ,color : Colors.blue,),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 150,
                height: 150,
                margin: EdgeInsets.only(top: 0, right: 20),
                padding: EdgeInsets.all(10),
                child: Text(
                  "${kelvin.toStringAsFixed(2)} K",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              Container(
                width: 150,
                height: 150,
                margin: EdgeInsets.only(top: 0),
                padding: EdgeInsets.all(10),
                child: Text(
                  "${reamur.toStringAsFixed(2)} R",
                  textAlign: TextAlign.center,
                  // overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                // decoration: BoxDecoration(
                //     border: Border.all(
                //   color: Colors.red,
                //   width: 1,
                // )),
              ),
            ],
          ),
          Container(
            width: 500,
            height: 50,
            margin: EdgeInsets.only(top: 150),
            // ignore: deprecated_member_use
            child: new RaisedButton(
              child: Text("Konverter Suhu"),
              onPressed: () {
                setState(() {
                  reamur = (input * (4 / 5));
                  kelvin = input + 273;
                });
              },
              color: Colors.blueAccent,
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );

    AppBar appBar = AppBar(
      title: Text("Konverter Suhu"),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        padding: EdgeInsets.all(0.0),
        child: Column(
          children: <Widget>[
            allContainer,
          ],
        ),
      ),
    );
  }
}
