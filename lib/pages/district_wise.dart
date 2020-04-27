import 'package:flutter/material.dart';
import 'package:covidata/pages/district_page.dart';
import 'package:covidata/utils/data.dart';
import 'package:covidata/utils/sort.dart';

class DistrictWise extends StatefulWidget {
  final StateData data;

  DistrictWise(this.data);

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

  Widget _stateListTile(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        color: Colors.white,
        elevation: 16.0,
        child: InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) =>
                  DistrictPage(widget.data.districts[index]))),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Text(widget.data.districts[index].name,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 24,
                              fontFamily: 'Darker Grotesque',
                              fontWeight: FontWeight.w500)),
                    ),
                    Text(widget.data.districts[index].confirmed.toString(),
                        style: TextStyle(
                            fontFamily: 'Darker Grotesque',
                            fontSize: MediaQuery.of(context).size.width / 24,
                            fontWeight: FontWeight.w500))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Flexible(
                    flex: widget.data.districts[index].active,
                    child: Container(
                      height: 5,
                      color: Color(0xff0099cf),
                    ),
                  ),
                  Flexible(
                    flex: widget.data.districts[index].deceased,
                    child: Container(height: 5, color: Color(0xffe75f5f)),
                  ),
                  Flexible(
                    flex: widget.data.districts[index].deceased,
                    child: Container(
                      height: 5,
                      color: Color(0xff61dd74),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Active',
                            style: TextStyle(
                                fontFamily: 'Darker Grotesque',
                                color: Color(0xff0099cf),
                                fontWeight: FontWeight.w500)),
                        Text(widget.data.districts[index].active.toString(),
                            style: TextStyle(
                                fontFamily: 'Darker Grotesque',
                                color: Color(0xff0099cf),
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Recovered',
                            style: TextStyle(
                                fontFamily: 'Darker Grotesque',
                                color: Color(0xff61dd74),
                                fontWeight: FontWeight.w500)),
                        Text(widget.data.districts[index].recovered.toString(),
                            style: TextStyle(
                                fontFamily: 'Darker Grotesque',
                                color: Color(0xff61dd74),
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Deceased',
                            style: TextStyle(
                                fontFamily: 'Darker Grotesque',
                                color: Color(0xffe75f5f),
                                fontWeight: FontWeight.w500)),
                        Text(widget.data.districts[index].deceased.toString(),
                            style: TextStyle(
                                fontFamily: 'Darker Grotesque',
                                color: Color(0xffe75f5f),
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Districts', style: TextStyle(color: Colors.black54)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black54),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: <Widget>[
          /*Row(
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
                        setState(() => _parameter = SortParameter.name),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Name',
                          textAlign: TextAlign.center,
                          style: _parameter == SortParameter.name
                              ? Theme.of(context).accentTextTheme.button
                              : Theme.of(context).textTheme.button),
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
                        setState(() => _parameter = SortParameter.confirmed),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Confirmed',
                          textAlign: TextAlign.center,
                          style: _parameter == SortParameter.confirmed
                              ? Theme.of(context).accentTextTheme.button
                              : Theme.of(context).textTheme.button),
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
                        setState(() => _parameter = SortParameter.active),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Active',
                          textAlign: TextAlign.center,
                          style: _parameter == SortParameter.active
                              ? Theme.of(context).accentTextTheme.button
                              : Theme.of(context).textTheme.button),
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
                        setState(() => _parameter = SortParameter.recovered),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Recovered',
                          textAlign: TextAlign.center,
                          style: _parameter == SortParameter.recovered
                              ? Theme.of(context).accentTextTheme.button
                              : Theme.of(context).textTheme.button),
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
                        setState(() => _parameter = SortParameter.deceased),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Deceased',
                          textAlign: TextAlign.center,
                          style: _parameter == SortParameter.deceased
                              ? Theme.of(context).accentTextTheme.button
                              : Theme.of(context).textTheme.button),
                    ),
                  )),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100.0))),
                  child: GestureDetector(
                    onTap: () => setState(() => _sort = _sort == Sort.ascending
                        ? Sort.descending
                        : Sort.ascending),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: _sort == Sort.ascending
                                ? Colors.black12
                                : Colors.black87,
                          ),
                          Icon(
                            Icons.keyboard_arrow_up,
                            color: _sort == Sort.descending
                                ? Colors.black12
                                : Colors.black87,
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),*/
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: widget.data.districts.length,
                itemBuilder: (context, index) => _stateListTile(index)),
          ),
        ],
      ),
    );
  }
}
