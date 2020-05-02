import 'package:flutter/material.dart';
import 'package:covidata/utils/data.dart';
import 'package:covidata/utils/data_containers.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DistrictPage extends StatefulWidget {
  final DistrictData data;

  DistrictPage(this.data);

  @override
  _DistrictPageState createState() => _DistrictPageState();
}

class _DistrictPageState extends State<DistrictPage> {
  bool _animateCharts = true;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 500), () => _animateCharts = false);
    super.initState();
  }

  List<charts.Series<CADRPie, String>> _seriesPieData() {
    var pieData = [
      CADRPie('Active', widget.data.active, Color(0xff0099cf)),
      CADRPie('Recovered', widget.data.recovered, Color(0xff61dd74)),
      CADRPie('Deceased', widget.data.deceased, Color(0xffe75f5f))
    ];
    return [
      charts.Series(
          data: pieData,
          domainFn: (CADRPie cadr, _) => cadr.label,
          measureFn: (CADRPie cadr, _) => cadr.value,
          colorFn: (CADRPie cadr, _) =>
              charts.ColorUtil.fromDartColor(cadr.color),
          id: 'Cases Pie Chart',
          labelAccessorFn: (CADRPie cadr, _) => '${cadr.value}')
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(widget.data.name, style: TextStyle(color: Theme.of(context).textTheme.headline6.color)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
      ),
      body: Column(
        children: <Widget>[
          Text('Total Cases (${widget.data.confirmed} Confirmed)',
              style: TextStyle(
                  fontFamily: 'Darker Grotesque',
                  fontSize: MediaQuery.of(context).size.width / 24,
                  fontWeight: FontWeight.w500)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 20),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: charts.PieChart(
                      _seriesPieData(),
                      animate: _animateCharts,
                      animationDuration: Duration(milliseconds: 300),
                      defaultRenderer: charts.ArcRendererConfig(
                          arcWidth: MediaQuery.of(context).size.width ~/ 6,
                          arcRendererDecorators: [
                            charts.ArcLabelDecorator(
                                labelPosition: charts.ArcLabelPosition.auto)
                          ]),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.lens, color: Color(0xff0099cf)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Hero(
                                  tag: 'activetext',
                                  child: Text('Active',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1)),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.lens, color: Color(0xff61dd74)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Hero(
                                  tag: 'recoveredtext',
                                  child: Text('Recovered',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1)),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.lens, color: Color(0xffe75f5f)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Hero(
                                  tag: 'deceasedtext',
                                  child: Text('Deceased',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1)),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
