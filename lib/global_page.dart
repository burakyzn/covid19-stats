import 'package:coronavirusstatistics/http/stat_service.dart';
import 'package:coronavirusstatistics/model/allstats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GlobalPage extends StatefulWidget {
  @override
  _GlobalPageState createState() => _GlobalPageState();
}

class _GlobalPageState extends State<GlobalPage> {
  StatService _statService;

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Global Statictics"),
      ),
      body: FutureBuilder(
          future: _statService.overview(),
          builder: (BuildContext context, AsyncSnapshot<AllInfo> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                return StaggeredGridView.count(
                  crossAxisCount: 2,
                  physics: ScrollPhysics(),
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  padding: EdgeInsets.symmetric(horizontal:12.0, vertical:8.0),
                  children: <Widget>[
                    cardItem("Total Cases", snapshot.data.totalCases, Colors.red),
                    cardItem("New Cases", snapshot.data.totalNewCasesToday, Colors.redAccent),
                    cardItem("New Deaths", snapshot.data.totalNewDeathsToday, Colors.black38),
                    cardItem("Recovered", snapshot.data.totalRecovered, Colors.green),
                    cardItem("Deaths", snapshot.data.totalDeaths, Colors.black38),
                    cardItem("Active Cases", snapshot.data.totalActiveCases, Colors.blue),
                    cardItem("Serious Cases", snapshot.data.totalSeriousCases, Colors.red),
                  ],
                  staggeredTiles: [
                    StaggeredTile.extent(2, 145.0),
                    StaggeredTile.extent(1, 165.0),
                    StaggeredTile.extent(1, 165.0),
                    StaggeredTile.extent(1, 165.0),
                    StaggeredTile.extent(1, 165.0),
                    StaggeredTile.extent(1, 165.0),
                    StaggeredTile.extent(1, 165.0),
                  ],
                );
              }
            }
            return Center(child: CircularProgressIndicator());
          }),
    ));
  }
}

