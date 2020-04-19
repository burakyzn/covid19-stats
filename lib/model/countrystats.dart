class CountryInfo {
  String totalCases;
  String totalRecovered;
  String totalUnresolved;
  String totalDeaths;
  String totalNewCasesToday;
  String totalNewDeathsToday;
  String totalActiveCases;
  String totalSeriousCases;

  CountryInfo({this.totalCases, this.totalRecovered, this.totalUnresolved, this.totalDeaths, this.totalNewCasesToday,this.totalNewDeathsToday, this.totalActiveCases,this.totalSeriousCases});

  factory CountryInfo.fromJson(Map<String, dynamic> map) {
    return CountryInfo(
      totalCases: map["countrydata"][0]['total_cases'].toString(),
      totalRecovered: map["countrydata"][0]['total_recovered'].toString(),
      totalUnresolved: map["countrydata"][0]['total_unresolved'].toString(),
      totalDeaths: map["countrydata"][0]['total_deaths'].toString(),
      totalNewCasesToday: map["countrydata"][0]['total_new_cases_today'].toString(),
      totalNewDeathsToday: map["countrydata"][0]['total_new_deaths_today'].toString(),
      totalActiveCases: map["countrydata"][0]['total_active_cases'].toString(),
      totalSeriousCases: map["countrydata"][0]['total_serious_cases'].toString(),
    );
  }
}