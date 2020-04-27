import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covidata/pages/about.dart';
import 'package:covidata/pages/live_stats.dart';
import 'package:covidata/pages/news.dart';
import 'package:covidata/pages/search.dart';
import 'package:covidata/utils/data.dart';
import 'package:share/share.dart';
import 'package:swipe_up/swipe_up.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  final Data data;

  Home(this.data);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Daily _yesterday;
  Daily _today;

  @override
  void initState() {
    _setYTData();
    super.initState();
  }

  void _setYTData() {
    if (DateTime.now().day == widget.data.caseData.daily.last.date.day) {
      _today = widget.data.caseData.daily.last;
      _yesterday =
          widget.data.caseData.daily[widget.data.caseData.daily.length - 2];
    } else {
      _yesterday = widget.data.caseData.daily.last;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Hero(
            tag: 'covidata',
            child: Text('CoviData',
                style: TextStyle(
                    color:
                        Theme.of(context).appBarTheme.textTheme.headline6.color,
                    fontFamily: 'Megrim',
                    fontSize: 28.0))),
        iconTheme: IconThemeData(color: Colors.black54),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.share, color: Colors.black54),
              onPressed: () => Share.share(
                  'Download this amazing app that provides visualised COVID-19 '
                  'data in India. https://play.google.com/store/apps/details?id=abhishekupmanyu.asciiemojis'))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('CoviData',
                    style: TextStyle(
                        color: Theme.of(context)
                            .appBarTheme
                            .textTheme
                            .headline6
                            .color,
                        fontFamily: 'Megrim',
                        fontSize: 38.0)),
                Text('India', style: TextStyle(fontSize: 18.0))
              ],
            )),
            ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () => Navigator.of(context).pop()),
            ListTile(
                leading: Icon(Icons.call),
                title: Text('Helpline'),
                onTap: () => launch('tel:+91 11 23978046')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                color: Colors.blueGrey,
                height: 0.25,
              ),
            ),
            ListTile(
                leading: Icon(Icons.info),
                title: Text('About'),
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (BuildContext context) => About(widget.data))))
          ],
        ),
      ),
      body: SwipeUp(
        onSwipe: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => News(
                  'https://www.google.com/search?tbm=nws&q=covid+19+india&oq=covid',
                ))),
        child: Text('News on COVID-19',
            style: TextStyle(
                fontFamily: 'Darker Grotesque',
                fontSize: MediaQuery.of(context).size.width / 24)),
        color: Theme.of(context).textTheme.bodyText1.color,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: 'searchbar',
              child: Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width / 24),
                child: Material(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  elevation: 16.0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Search(widget.data)));
                    },
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.search),
                        ),
                        Expanded(
                          child: Text(
                            'Search for District or State',
                            style: TextStyle(
                                fontFamily: 'Darker Grotesque',
                                fontSize:
                                    MediaQuery.of(context).size.width / 24,
                                color: Colors.black54),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(widget.data.caseData.confirmed.toString(),
                        style: TextStyle(
                            fontFamily: 'Darker Grotesque',
                            fontWeight: FontWeight.w500,
                            fontSize: MediaQuery.of(context).size.width / 10),
                        textAlign: TextAlign.center),
                    Text('Cases Confirmed',
                        style: TextStyle(
                            fontFamily: 'Darker Grotesque',
                            fontSize: MediaQuery.of(context).size.width / 24),
                        textAlign: TextAlign.center),
                    Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height / 40)),
                    Material(
                      elevation: 8.0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height / 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(widget.data.caseData.active.toString(),
                                    style: TextStyle(
                                        fontFamily: 'Darker Grotesque',
                                        color: Color(0xff0099cf),
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                20,
                                        fontWeight: FontWeight.bold)),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Hero(
                                    tag: 'activetext',
                                    child: Text('Active',
                                        style: TextStyle(
                                            fontFamily: 'Darker Grotesque',
                                            decoration: TextDecoration.none,
                                            color: Color(0xff0099cf),
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                28)),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              color: Colors.blueGrey,
                              width: 1,
                              height: MediaQuery.of(context).size.height / 20,
                            ),
                            Column(
                              children: <Widget>[
                                Text(widget.data.caseData.recovered.toString(),
                                    style: TextStyle(
                                        fontFamily: 'Darker Grotesque',
                                        color: Color(0xff61dd74),
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                20,
                                        fontWeight: FontWeight.bold)),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Hero(
                                    tag: 'recoveredtext',
                                    child: Text('Recovered',
                                        style: TextStyle(
                                            fontFamily: 'Darker Grotesque',
                                            decoration: TextDecoration.none,
                                            color: Color(0xff61dd74),
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                28)),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              color: Colors.blueGrey,
                              width: 1,
                              height: MediaQuery.of(context).size.height / 20,
                            ),
                            Column(
                              children: <Widget>[
                                Text(widget.data.caseData.deceased.toString(),
                                    style: TextStyle(
                                        fontFamily: 'Darker Grotesque',
                                        color: Color(0xffe75f5f),
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                20,
                                        fontWeight: FontWeight.bold)),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Hero(
                                    tag: 'deceasedtext',
                                    child: Text('Deceased',
                                        style: TextStyle(
                                            fontFamily: 'Darker Grotesque',
                                            decoration: TextDecoration.none,
                                            color: Color(0xffe75f5f),
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                28)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Material(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5.0),
                          bottomRight: Radius.circular(5.0)),
                      elevation: 16.0,
                      color: Colors.blue,
                      child: InkWell(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    LiveStats(widget.data))),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('View Data',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              24,
                                      fontFamily: 'Darker Grotesque',
                                      fontWeight: FontWeight.w600)),
                              Icon(Icons.navigate_next, color: Colors.white)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height / 40)),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Material(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            color: Theme.of(context).cardColor,
                            elevation: 16.0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Yesterday',
                                        style: TextStyle(
                                            fontFamily: 'Darker Grotesque',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                18)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('Confirmed',
                                            style: TextStyle(
                                                fontFamily:
                                                    'Darker Grotesque')),
                                        Text(_yesterday.confirmed.toString(),
                                            style: TextStyle(
                                                fontFamily: 'Darker Grotesque',
                                                fontWeight: FontWeight.w600))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('Recovered',
                                            style: TextStyle(
                                                fontFamily: 'Darker Grotesque',
                                                color: Color(0xff61dd74))),
                                        Text(_yesterday.recovered.toString(),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('Deceased',
                                            style: TextStyle(
                                                fontFamily: 'Darker Grotesque',
                                                color: Color(0xffe75f5f))),
                                        Text(_yesterday.deceased.toString(),
                                            style: TextStyle(
                                                fontFamily: 'Darker Grotesque',
                                                color: Color(0xffe75f5f),
                                                fontWeight: FontWeight.w600))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 8.0)),
                        Expanded(
                          child: Material(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            color: Theme.of(context).cardColor,
                            elevation: 16.0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Today So Far',
                                        style: TextStyle(
                                            fontFamily: 'Darker Grotesque',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                18)),
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text('Confirmed',
                                                style: TextStyle(
                                                    fontFamily:
                                                        'Darker Grotesque')),
                                            Text(
                                                _today == null
                                                    ? (widget.data.caseData
                                                                .confirmed -
                                                            widget.data.caseData
                                                                .daily
                                                                .reduce((a, b) => Daily(
                                                                    confirmed: a
                                                                            .confirmed +
                                                                        b
                                                                            .confirmed))
                                                                .confirmed)
                                                        .toString()
                                                    : _today.confirmed
                                                        .toString(),
                                                style: TextStyle(
                                                    fontFamily:
                                                        'Darker Grotesque',
                                                    fontWeight:
                                                        FontWeight.w600))
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
