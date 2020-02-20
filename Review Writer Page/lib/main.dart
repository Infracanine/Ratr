import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Review Page',
      home: ReviewPage(),
    );
  }
}

//class ReviewPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        //todo get from backend stuff
//        title: Text(
//          'Property Name Here',
//          textDirection: TextDirection.ltr,
//          style: TextStyle(
//            fontSize: 25,
//          ),
//        ),
//      ),
//      body: SafeArea(
//        child: Container(
//          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
//          child: Text(
//            'Please write your review below for '
//            'the property chosen:',
//            textDirection: TextDirection.ltr,
//            style: TextStyle(fontSize: 18, color: Colors.black),
//          ),
//        ),
//      ),
//    );
//  }
//}

class ReviewPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //todo get from backend stuff
        title: Text(
          'Property Name Here',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
          children: <Widget>[
            Column(children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  'Please write your review below for '
                  'the property chosen:',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 5),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Property Review:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    )),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                    keyboardType: TextInputType.multiline,
                    minLines: 4,
                    maxLines: 4,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            borderSide: BorderSide(
                                width: 10.0, style: BorderStyle.solid)),
                        filled: true,
                        hintText: 'Write your review here...')
                    //labelText: 'House Review')
                    ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: RaisedButton(
                  padding: EdgeInsets.all(5.0),
                  color: Colors.orange,
                  disabledColor: Colors.pink,
                  disabledTextColor: Colors.black,
                  splashColor: Colors.blue,
                  child: Text(
                    'POST',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Landlord Review:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    )),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                    keyboardType: TextInputType.multiline,
                    minLines: 4,
                    maxLines: 4,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            borderSide: BorderSide(
                                width: 10.0, style: BorderStyle.solid)),
                        filled: true,
                        hintText: 'Write your review here...')
                    //labelText: 'House Review')
                    ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: RaisedButton(
                    padding: EdgeInsets.all(5.0),
                    color: Colors.orange,
                    disabledColor: Colors.pink,
                    disabledTextColor: Colors.black,
                    splashColor: Colors.blue,
                    child: Text(
                      'POST',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      print("Lol");
                    }),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Upload Images:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    )),
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.add_circle_outline,
                        size: 50.0,
                      )))
            ])
          ],
        ),
      ),
    );
  }
}
