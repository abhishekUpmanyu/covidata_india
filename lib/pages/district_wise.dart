import 'package:covidata/ui/my_grid_tile.dart';
import 'package:flutter/material.dart';
import 'package:covidata/pages/district_page.dart';
import 'package:covidata/utils/data.dart';
import 'package:covidata/utils/sort.dart';

class DistrictWise extends StatefulWidget {
  final int index;

  DistrictWise(this.index);

  @override
  _DistrictWiseState createState() => _DistrictWiseState();
}

class _DistrictWiseState extends State<DistrictWise> {
  Sort _sort = Sort.ascending;
  SortParameter _parameter = SortParameter.name;

  @override
  void initState() {
    super.initState();
  }

  Future<Null> _sortData() async {
    Data.caseData.states[widget.index].districts.sort((a, b) {
      switch(_parameter) {
        case SortParameter.name:
          return _sort==Sort.ascending?a.name.compareTo(b.name):b.name.compareTo(a.name);
        case SortParameter.confirmed:
          return _sort==Sort.ascending?a.confirmed.compareTo(b.confirmed):b.confirmed.compareTo(a.confirmed);
        case SortParameter.active:
          return _sort==Sort.ascending?a.active.compareTo(b.active):b.active.compareTo(a.active);
        case SortParameter.recovered:
          return _sort==Sort.ascending?a.recovered.compareTo(b.recovered):b.recovered.compareTo(a.recovered);
        case SortParameter.deceased:
          return _sort==Sort.ascending?a.deceased.compareTo(b.deceased):b.deceased.compareTo(a.deceased);
        default:
          return a.name.compareTo(b.name);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Districts', style: TextStyle(color: Theme.of(context).appBarTheme.textTheme.headline6.color)),
        centerTitle: true,
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                      color: _parameter == SortParameter.name
                          ? Theme.of(context).accentColor
                          : Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(100.0))),
                  child: GestureDetector(
                    onTap: () =>
                        setState(() {_parameter = SortParameter.name; _sortData();}),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Name',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.button),
                    ),
                  )),
              Container(
                  decoration: BoxDecoration(
                      color: _parameter == SortParameter.confirmed
                          ? Theme.of(context).accentColor
                          : Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(100.0))),
                  child: GestureDetector(
                    onTap: () =>
                        setState(() {_parameter = SortParameter.confirmed; _sortData();}),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Confirmed',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.button),
                    ),
                  )),
              Container(
                  decoration: BoxDecoration(
                      color: _parameter == SortParameter.active
                          ? Theme.of(context).accentColor
                          : Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(100.0))),
                  child: GestureDetector(
                    onTap: () =>
                        setState(() {_parameter = SortParameter.active; _sortData();}),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Active',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.button),
                    ),
                  )),
              Container(
                  decoration: BoxDecoration(
                      color: _parameter == SortParameter.recovered
                          ? Theme.of(context).accentColor
                          : Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(100.0))),
                  child: GestureDetector(
                    onTap: () =>
                        setState(() {_parameter = SortParameter.recovered; _sortData();}),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Recovered',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.button),
                    ),
                  )),
              Container(
                  decoration: BoxDecoration(
                      color: _parameter == SortParameter.deceased
                          ? Theme.of(context).accentColor
                          : Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(100.0))),
                  child: GestureDetector(
                    onTap: () =>
                        setState(() {_parameter = SortParameter.deceased; _sortData();}),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Deceased',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.button),
                    ),
                  )),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100.0))),
                  child: GestureDetector(
                    onTap: () => setState(() {_sort = _sort == Sort.ascending
                        ? Sort.descending
                        : Sort.ascending;
                    _sortData();
                    }),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: _sort == Sort.ascending
                                ? Theme.of(context).accentColor.withOpacity(0.4)
                                : Theme.of(context).accentColor,
                          ),
                          Icon(
                            Icons.keyboard_arrow_up,
                            color: _sort == Sort.descending
                                ? Theme.of(context).accentColor.withOpacity(0.4)
                                : Theme.of(context).accentColor,
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: Data.caseData.states[widget.index].districts.length,
                itemBuilder: (context, index) => MyGridTile(
                    Data.caseData.states[widget.index].districts[index].name,
                    Data.caseData.states[widget.index].districts[index].confirmed,
                    Data.caseData.states[widget.index].districts[index].active,
                    Data.caseData.states[widget.index].districts[index].recovered,
                    Data.caseData.states[widget.index].districts[index].deceased,
                        () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            DistrictPage(Data.caseData.states[widget.index].districts[index])))
                )),
          ),
        ],
      ),
    );
  }
}
