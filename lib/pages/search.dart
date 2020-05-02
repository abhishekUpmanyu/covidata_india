import 'package:flutter/material.dart';
import 'package:covidata/pages/district_page.dart';
import 'package:covidata/pages/state_page.dart';
import 'package:covidata/utils/data.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _controller = TextEditingController();

  List<StateData> _states = List<StateData>();
  List<DistrictData> _districts = List<DistrictData>();

  @override
  void initState() {
    _controller.addListener(() {
      _states = List<StateData>();
      _districts = List<DistrictData>();
      Data.caseData.states.forEach((state) {
        if (state.name.toLowerCase().contains(_controller.text.toLowerCase())) {
          _states.add(state);
        }
        state.districts.forEach((district) {
          if (district.name
              .toLowerCase()
              .contains(_controller.text.toLowerCase())) {
            _districts.add(district);
          }
        });
      });
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _searchListItem(int index) {
    return Material(
      elevation: 16.0,
      color: Theme.of(context).cardColor,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => index < _states.length
                ? StatePage(Data.caseData.states.indexWhere((data) => data.stateCode==_states[index].stateCode))
                : DistrictPage(_districts[index - _states.length])));},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                      index < _states.length
                          ? _states[index].name
                          : _districts[index - _states.length].name,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1.color,
                          fontFamily: 'Darker Grotesque',
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.width / 20)),
                  Container(
                    width: MediaQuery.of(context).size.width / 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2.0)),
                      color:
                          index < _states.length ? Colors.orange : Colors.green,
                    ),
                    child: Text(index < _states.length ? 'State' : 'District',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Darker Grotesque',
                            fontWeight: FontWeight.w700)),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                          index < _states.length
                              ? _states[index].confirmed.toString()
                              : _districts[index - _states.length]
                                  .confirmed
                                  .toString(),
                          textAlign: TextAlign.center),
                    ),
                    Container(
                      width: 1,
                      height: 16.0,
                      color: Colors.blueGrey,
                    ),
                    Expanded(
                      child: Text(
                        index < _states.length
                            ? _states[index].active.toString()
                            : _districts[index - _states.length]
                                .active
                                .toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xff0099cf)),
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 16.0,
                      color: Colors.blueGrey,
                    ),
                    Expanded(
                      child: Text(
                          index < _states.length
                              ? _states[index].recovered.toString()
                              : _districts[index - _states.length]
                                  .recovered
                                  .toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Color(0xff61dd74))),
                    ),
                    Container(
                      width: 1,
                      height: 16.0,
                      color: Colors.blueGrey,
                    ),
                    Expanded(
                      child: Text(
                        index < _states.length
                            ? _states[index].deceased.toString()
                            : _districts[index - _states.length]
                                .deceased
                                .toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xffe75f5f)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: <Widget>[
            Hero(
              tag: 'searchbar',
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  elevation: 16.0,
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.navigate_before),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          autofocus: true,
                          cursorColor: Theme.of(context).accentColor,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search for District or State', hintStyle: Theme.of(context).textTheme.bodyText2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _controller.text.isEmpty
                ? Container()
                : Expanded(
                    child: ListView.builder(
                        itemCount: _states.length + _districts.length,
                        itemBuilder: (context, index) =>
                            _searchListItem(index)))
          ],
        ),
      ),
    );
  }
}
