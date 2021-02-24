
class Countries {
  List<Country> countries;

  Countries({this.countries});

  Countries.fromJson(List<dynamic> json) {
    countries = json.map((e) => Country.fromJson(e)).toList();
  }

  List<dynamic> toJson() {
    return countries;
  }
}


class Country {
  DateTime update;
  String country;
  CountryInfo countryInfo;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  int casesPerOneMillion;
  var deathsPerOneMillion;
  int tests;
  int testsPerOneMillion;

  Country({
    this.update,
    this.country,
    this.countryInfo,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.tests,
    this.testsPerOneMillion,
  });

  Country.fromJson(Map<String, dynamic> json) {
    update = json['update'];
    country = json['country'];
    countryInfo = CountryInfo.fromJson(json['countryInfo']);
    cases = json['cases'];
    todayCases = json['todayCases'];
    deaths = json['deaths'];
    todayDeaths = json['todayDeaths'];
    recovered = json['recovered'];
    active = json['active'];
    critical = json['critica'];
    casesPerOneMillion = json['casesperOneMillion'];
    deathsPerOneMillion = json['deathsPerOneMillion'];
    tests = json['tests'];
    testsPerOneMillion = json['testsPerOneMillion'];
  }

  Map<String, dynamic> toJson() {
    return {
      'update': update,
      'country': country,
      'countryInfo': countryInfo,
      'cases': cases,
      'todayCases': todayCases,
      'deaths': deaths,
      'todayDeaths': todayDeaths,
      'recovered': recovered,
      'active': active,
      'critical': critical,
      'casesPerOneMillion': casesPerOneMillion,
      'deathsPerOneMillion': deathsPerOneMillion,
      'tests': tests,
      'testsPerOneMillion': testsPerOneMillion,
    };
  }
}

class CountryInfo {
  int _id;
  String iso2;
  String iso3;
  var lat;
  var long;
  String flag;

  CountryInfo(this._id,{this.iso2, this.iso3, this.lat, this.long, this.flag});

  CountryInfo.fromJson(Map<String, dynamic> json) {
    _id = json['_id'];
    iso2 = json['iso2'];
    iso3 = json['iso3'];
    lat = json['lat'];
    long = json['long'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': _id,
      'iso2': iso2,
      'iso3': iso3,
      'lat': lat,
      'long': long,
      'flag': flag
    };
  }
}
