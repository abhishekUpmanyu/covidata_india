import 'package:flutter/material.dart';

class MyGridTile extends StatelessWidget {
  final String _title;
  final int _confirmed;
  final int _active;
  final int _recovered;
  final int _deceased;
  final int _newConfirmed;
  final VoidCallback _onTap;

  MyGridTile(this._title, this._confirmed, this._active, this._recovered,
      this._deceased, this._onTap, [this._newConfirmed]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        color: Theme.of(context).cardColor,
        elevation: 16.0,
        child: InkWell(
          onTap: () => _onTap(),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Text(_title,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 26,
                              fontFamily: 'Darker Grotesque',
                              fontWeight: FontWeight.w500)),
                    ),
                    Text(_confirmed.toString(),
                        style: TextStyle(
                            fontFamily: 'Darker Grotesque',
                            fontSize: MediaQuery.of(context).size.width / 24,
                            fontWeight: FontWeight.w500)),
                    _newConfirmed!=null?Text(' (+${_newConfirmed.toString()})',
                        style: TextStyle(
                            fontFamily: 'Darker Grotesque',
                            fontSize: MediaQuery.of(context).size.width / 34,
                            fontWeight: FontWeight.w500)):Container(),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Flexible(
                    flex: _active,
                    child: Container(
                      height: 5,
                      color: Color(0xff0099cf),
                    ),
                  ),
                  Flexible(
                    flex: _recovered,
                    child: Container(
                      height: 5,
                      color: Color(0xff61dd74),
                    ),
                  ),
                  Flexible(
                    flex: _deceased,
                    child: Container(height: 5, color: Color(0xffe75f5f)),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Active',
                            style: TextStyle(
                                fontFamily: 'Darker Grotesque',
                                color: Color(0xff0099cf),
                                fontWeight: FontWeight.w500)),
                        Text(_active.toString(),
                            style: TextStyle(
                                fontFamily: 'Darker Grotesque',
                                color: Color(0xff0099cf),
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Recovered',
                            style: TextStyle(
                                fontFamily: 'Darker Grotesque',
                                color: Color(0xff61dd74),
                                fontWeight: FontWeight.w500)),
                        Text(_recovered.toString(),
                            style: TextStyle(
                                fontFamily: 'Darker Grotesque',
                                color: Color(0xff61dd74),
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Deceased',
                            style: TextStyle(
                                fontFamily: 'Darker Grotesque',
                                color: Color(0xffe75f5f),
                                fontWeight: FontWeight.w500)),
                        Text(_deceased.toString(),
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
}
