import 'package:covidata/pages/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covidata/pages/home.dart';
import 'package:covidata/utils/data.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
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
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
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
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (BuildContext context) => Home()))),
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
                onTap: () => Navigator.of(context).pop())
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('About',
                      style: Theme.of(context).textTheme.headline1),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      'CoviData India visualises COVID-19 data in India. '
                      'It provides live statistics, along with daily count of '
                      'confirmed, active, recovered and deceased patients. '
                      'CoviData covers nation level, state level and district level cases.',
                      style: Theme.of(context).textTheme.bodyText2),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'API',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'CoviData India uses COVID19-India API for sourcing it\'s data.',
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () => launch('https://api.covid19india.org'),
                    child: Text('https://api.covid19india.org',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.blue,
                            fontFamily: 'Darker Grotesque',
                            fontSize: MediaQuery.of(context).size.width / 24)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Disclaimer',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                      'CoviData India does not collect any personal data, nor '
                      'does it require access to Bluetooth, and is in no way '
                      'meant to be an alternative to Aarogya Setu launched by '
                      'Govt. of India. Aarogya Setu provides government '
                      'guidelines to fight the pandemic and makes it easier to '
                      'backtrack potential COVID-19 cases. It is strongly '
                      'recommended that you download Aarogya Setu too.',
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyText2),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Developed On',
                        style: TextStyle(
                            fontFamily: 'Darker Grotesque',
                            fontWeight: FontWeight.w600,
                            fontSize: MediaQuery.of(context).size.width / 24,
                            color: Colors.blue),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            color: Colors.blue),
                        height: MediaQuery.of(context).size.width / 10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/images/flutter-logo.png',
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => launch(
                      'https://github.com/abhishekUpmanyu/covidata_india'),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Open Source',
                          style: TextStyle(
                              fontFamily: 'Darker Grotesque',
                              fontWeight: FontWeight.w600,
                              fontSize: MediaQuery.of(context).size.width / 24),
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              color: Colors.black),
                          height: MediaQuery.of(context).size.width / 10,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('assets/images/github-logo.png',
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
