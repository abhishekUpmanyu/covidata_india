import 'package:flutter/material.dart';

class MyOverlay extends StatefulWidget {
  final bool toggle;
  final Widget child;
  MyOverlay(this.toggle, {this.child});
  @override
  _MyOverlayState createState() => _MyOverlayState();
}

class _MyOverlayState extends State<MyOverlay> with SingleTickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.toggle?Container(
      color: Colors.black38,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: widget.child,
    ):Container();
  }
}

