import 'package:coronavirusstatistics/country_page.dart';
import 'package:coronavirusstatistics/model/countries.dart';
import 'package:flutter/material.dart';

 
class SelectionPage extends StatefulWidget {
  SelectionPage() : super();
 
  @override
  SelectionPageState createState() => SelectionPageState();
}
 
class SelectionPageState extends State<SelectionPage> {
  List<Country> _countries = Country.getCountries();
  List<DropdownMenuItem<Country>> _dropdownMenuItems;
  Country _selectedCountry;
 
  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_countries);
    _selectedCountry = _dropdownMenuItems[0].value;
    super.initState();
  }
 
  List<DropdownMenuItem<Country>> buildDropdownMenuItems(List countries) {
    List<DropdownMenuItem<Country>> items = List();
    for (Country country in countries) {
      items.add(
        DropdownMenuItem(
          value: country,
          child: Text(country.name),
        ),
      );
    }
    return items;
  }
 
  onChangeDropdownItem(Country selectedCountry) {
    setState(() {
      _selectedCountry = selectedCountry;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Country Selection"),
        ),
        body: new Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Please select a country"),
                SizedBox(
                  height: 20.0,
                ),
                DropdownButton(
                  value: _selectedCountry,
                  items: _dropdownMenuItems,
                  onChanged: onChangeDropdownItem,
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CountryPage(countryCode : _selectedCountry.code, countryName:_selectedCountry.name),
                      ),
                    );
                  },
                  child: new Text("OK"),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}