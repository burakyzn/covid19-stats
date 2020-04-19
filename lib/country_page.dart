import 'package:coronavirusstatistics/http/stat_service.dart';
import 'package:coronavirusstatistics/list_page.dart';
import 'package:coronavirusstatistics/model/countrystats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CountryPage extends StatefulWidget {
  String countryCode;
  String countryName;

  CountryPage({this.countryCode, this.countryName});
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  StatService _statService;
  String _countryCode;
  String _countryName;

  Material cardItem (String heading, String content, Color _color){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x80219F3),
      borderRadius: BorderRadius.circular(20.0),
      child:Center(
        child: Padding(
          padding:const EdgeInsets.all(5.0),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment : MainAxisAlignment.center,
                children: <Widget>[
                  // heading
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child:Text(
                      heading,
                      style : TextStyle(color: Colors.black, fontSize: 23.0),
                    )
                  ),
                  // context
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child:Text(
                      content,
                      style : TextStyle(color: _color, fontSize: 25.0),
                    )
                  )
                ],
              )
            ],
          )
        ),
      )
    );
  }
  @override
  void initState() {
    _statService = StatService();
    _countryCode = widget.countryCode;
    _countryName = widget.countryName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Country Statictics"),
      ),
      body: FutureBuilder(
          future: _statService.country(_countryCode),
          builder: (BuildContext context, AsyncSnapshot<CountryInfo> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                return StaggeredGridView.count(
                  crossAxisCount: 2,
                  physics: ScrollPhysics(),
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  padding: EdgeInsets.symmetric(horizontal:12.0, vertical:10.0),
                  children: <Widget>[
                    cardItem("Selected Country", _countryName, Colors.red),
                    cardItem("Total Cases", snapshot.data.totalCases, Colors.red),
                    cardItem("New Cases", snapshot.data.totalNewCasesToday, Colors.redAccent),
                    cardItem("New Deaths", snapshot.data.totalNewDeathsToday, Colors.black38),
                    cardItem("Recovered", snapshot.data.totalRecovered, Colors.green),
                    cardItem("Deaths", snapshot.data.totalDeaths, Colors.black38),
                    Container(
                      padding:const EdgeInsets.all(12.0),
                      child:RaisedButton(
                      padding: const EdgeInsets.all(8.0),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () {
                        //Navigator.of(context).pop();
                        Navigator.push(context, MaterialPageRoute(builder: (context) { return ListPage();}));
                      },
                      child: new Text("Back"),
                    ),
                    )
                  ],
                  staggeredTiles: [
                    StaggeredTile.extent(2, 135.0),
                    StaggeredTile.extent(2, 150.0),
                    StaggeredTile.extent(1, 160.0),
                    StaggeredTile.extent(1, 160.0),
                    StaggeredTile.extent(1, 160.0),
                    StaggeredTile.extent(1, 160.0),
                    StaggeredTile.extent(2, 80.0),
                  ],
                );
              }
            }
            return Center(child: CircularProgressIndicator());
          }),
    ));
  }
}

