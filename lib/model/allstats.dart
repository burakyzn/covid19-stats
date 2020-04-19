class AllInfo {
  String totalCases;
  String totalRecovered;
  String totalUnresolved;
  String totalDeaths;
  String totalNewCasesToday;
  String totalNewDeathsToday;
  String totalActiveCases;
  String totalSeriousCases;

  AllInfo({this.totalCases, this.totalRecovered, this.totalUnresolved, this.totalDeaths, this.totalNewCasesToday,this.totalNewDeathsToday, this.totalActiveCases,this.totalSeriousCases});

  factory AllInfo.fromJson(Map<String, dynamic> map) {
    return AllInfo(
      totalCases: map["results"][0]['total_cases'].toString(),
      totalRecovered: map["results"][0]['total_recovered'].toString(),
      totalUnresolved: map["results"][0]['total_unresolved'].toString(),
      totalDeaths: map["results"][0]['total_deaths'].toString(),
      totalNewCasesToday: map["results"][0]['total_new_cases_today'].toString(),
      totalNewDeathsToday: map["results"][0]['total_new_deaths_today'].toString(),
      totalActiveCases: map["results"][0]['total_active_cases'].toString(),
      totalSeriousCases: map["results"][0]['total_serious_cases'].toString(),
    );
  }
}