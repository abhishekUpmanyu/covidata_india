import 'dart:convert';

import 'package:http/http.dart' as http;

class Data {
  Cases caseData;

  Map<String, int> _months = <String, int>{
    'Jan': DateTime.january,
    'Feb': DateTime.february,
    'Mar': DateTime.march,
    'Apr': DateTime.april,
    'May': DateTime.may,
    'Jun': DateTime.june,
    'Jul': DateTime.july,
    'Aug': DateTime.august,
    'Sep': DateTime.september,
    'Oct': DateTime.october,
    'Nov': DateTime.november,
    'Dec': DateTime.december
  };

  Future getData() async {
    await _getCaseData();
    await _getDailyData();
  }

  Future _getCaseData() async {
    var data =
        await http.get('https://api.covid19india.org/state_district_wise.json');
    var jsonData = await json.decode(data.body);
    var states = List<StateData>();
    var totalConfirmed = 0;
    var totalActive = 0;
    var totalDeceased = 0;
    var totalRecovered = 0;
    var dailyData = await _getDailyData();
    List<Daily> indiaDaily = dailyData[0];
    List<StateDaily> daily = dailyData[1];
    int stateIndex = -1;
    jsonData.forEach((sk, sv) {
      ++stateIndex;
      var districts = List<DistrictData>();
      var confirmed = 0;
      var active = 0;
      var deceased = 0;
      var recovered = 0;
      sv['districtData'].forEach((dk, dv) {
        confirmed += dv['confirmed'];
        active += dv['active'];
        deceased += dv['deceased'];
        recovered += dv['recovered'];
        districts.add(DistrictData(
            name: dk,
            confirmed: dv['confirmed'],
            active: dv['active'],
            deceased: dv['deceased'],
            recovered: dv['recovered']));
      });
      states.add(StateData(
          name: sk,
          stateCode: sv['statecode'],
          districts: districts,
          confirmed: confirmed,
          active: active,
          deceased: deceased,
          recovered: recovered,
          daily: daily
              .sublist(stateIndex)
              .firstWhere((daily) =>
                  daily.stateCode.toLowerCase() ==
                  sv['statecode'].toString().toLowerCase())
              .daily));
      totalConfirmed += confirmed;
      totalActive += active;
      totalDeceased += deceased;
      totalRecovered += recovered;
    });
    caseData = Cases(
        daily: indiaDaily,
        states: states,
        confirmed: totalConfirmed,
        active: totalActive,
        deceased: totalDeceased,
        recovered: totalRecovered);
  }

  Future<List> _getDailyData() async {
    var data = await http.get('https://api.covid19india.org/states_daily.json');
    var jsonData = await json.decode(data.body);
    var unformattedDate;
    var date;
    List<Daily> indiaDaily = List<Daily>();
    List<StateDaily> daily;
    int dayIndex = -1;
    jsonData.forEach((k, v) {
      if (daily == null) {
        daily =
            List<StateDaily>.generate(v.length - 2, (index) => StateDaily());
      }
      var confirmed;
      var recovered;
      var deceased;
      for (var i = 0; i < v.length; ++i) {
        switch (i % 3) {
          case 0:
            confirmed = int.parse(v[i]['tt']);
            ++dayIndex;
            unformattedDate = v[i]['date'];
            date = DateTime(
                int.parse('20' + unformattedDate.substring(7)),
                _months[unformattedDate.substring(3, 6)],
                int.parse(unformattedDate.substring(0, 2)));
            var index = -1;
            v[i].forEach((dk, dv) {
              if (!['date', 'status'].contains(dk)) {
                ++index;
                if (i == 0) {
                  daily[index].stateCode = dk;
                }
                daily[index].daily.add(Daily(
                    date: date, confirmed: int.parse(dv == "" ? "0" : dv)));
              }
            });
            break;
          case 1:
            recovered = int.parse(v[i]['tt']);
            var index = -1;
            v[i].forEach((dk, dv) {
              if (!['date', 'status'].contains(dk)) {
                ++index;
                daily[index].daily[dayIndex].recovered =
                    int.parse(dv == "" ? "0" : dv);
              }
            });
            break;
          case 2:
            deceased = int.parse(v[i]['tt']);
            var index = -1;
            v[i].forEach((dk, dv) {
              if (!['date', 'status'].contains(dk)) {
                ++index;
                daily[index].daily[dayIndex].deceased =
                    int.parse(dv == "" ? "0" : dv);
              }
            });
            indiaDaily.add(Daily(
                confirmed: confirmed,
                recovered: recovered,
                deceased: deceased,
                date: date));
            break;
          default:
            continue;
        }
      }
    });
    return [indiaDaily, daily];
  }
}

class Cases {
  List<StateData> states;
  int confirmed;
  int active;
  int deceased;
  int recovered;
  List<Daily> daily;

  Cases(
      {this.states,
      this.confirmed,
      this.active,
      this.deceased,
      this.recovered,
      this.daily});
}

class StateData {
  List<DistrictData> districts;
  String name;
  String stateCode;
  int confirmed;
  int active;
  int deceased;
  int recovered;
  List<Daily> daily;

  StateData(
      {this.name,
      this.stateCode,
      this.districts,
      this.confirmed,
      this.active,
      this.deceased,
      this.recovered,
      this.daily = const <Daily>[]});
}

class DistrictData {
  String name;
  int confirmed;
  int active;
  int deceased;
  int recovered;

  DistrictData(
      {this.name, this.confirmed, this.active, this.deceased, this.recovered});
}

class StateDaily {
  String stateCode;
  List<Daily> daily = List<Daily>();
}

class Daily {
  DateTime date;
  int confirmed;
  int deceased;
  int recovered;

  Daily({this.date, this.confirmed, this.deceased, this.recovered});
}
