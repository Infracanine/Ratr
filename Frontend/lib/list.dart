import 'package:flutter/material.dart';
import 'package:nexus_app/app.dart';
import 'package:nexus_app/prop.dart';
import 'functionsAndData.dart';

String filter = "default";

//page displaying all available properties in a relational database
//required to display only a small amount of information that nevertheless expresses the general sense for a property at a glance
//Maybe use tiles to display an image + price per month + an address
class ListPage extends StatefulWidget {
  @override
  _PropListState createState() => _PropListState();
}

final List<bool> isSelected = [true, false, false, false, false];

class _PropListState extends State<ListPage> {
  List<String> list = [
    'Price Highest',
    'Price Lowest',
    'Rating Highest',
    'Rating Lowest',
    'Bedrooms'
  ];
  String _sort;
  @override
  build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(title: Text("Property List")),
        body: Column(
          children: <Widget>[
            SizedBox(height: 5),
            Container(
              width: MediaQuery.of(context).size.width * 0.92,
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton(
                  isExpanded: true,
                  hint: Text(
                    'Sort houses by....',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: themeYellow),
                  ),
                  value: _sort,
                  items: list.map((sortBy) {
                    return DropdownMenuItem(
                      child: new Text(sortBy),
                      value: sortBy,
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    int index = list.indexOf(newValue);
                    toggleSort(index, 0);
                    setState(() {
                      _sort = newValue;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 5),
            Expanded(child: listBuildChild(context))
          ],
        ));
  }

  listBuildChild(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: houseList.length,
        itemBuilder: (BuildContext context, int index) {
          return makeHouseCard(context, index);
        });
  }
}

//Generates an instance of a card for a house
makeHouseCard(BuildContext context, int index) {
  print(index);
  return Card(
    elevation: 8.0,
    margin: new EdgeInsets.symmetric(
      horizontal: 10.0,
      vertical: 6.0,
    ),
    child: Container(
      decoration: BoxDecoration(
        color: themeGrey,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: themeYellow))),
            child: Icon(
              Icons.home,
              color: Colors.white,
              size: 40.0,
            ),
          ),
          title: Text(
            (houseList[index].houseNum.toString() +
                " " +
                houseList[index].street),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(houseList[index].bedrooms.toString() + " Bedroom House"),
              Text("£"+ (houseList[index].price / 12).toStringAsFixed(2) + " pcm")
            ],
          ),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: themeYellow, size: 50.0),
          onTap: () {
            //Navigator.pushNamed(context, '/property');
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Property(houseList[index].latlng)),
            );
          }),
    ),
  );
}
