import 'package:flutter/material.dart';

class EpochStatusBar extends StatefulWidget {
  final int epochDone;
  final int epochLeft;

  EpochStatusBar({@required this.epochDone, @required this.epochLeft});

  @override
  _EpochStatusBarState createState() => _EpochStatusBarState();
}

class _EpochStatusBarState extends State<EpochStatusBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        EpochDoneBar(epochDone: widget.epochDone),
        EpochLeftBar(epochLeft: widget.epochLeft),
      ],
    );
  }
}

class EpochDoneBar extends StatefulWidget {
  final int epochDone;

  EpochDoneBar({@required this.epochDone});

  @override
  _EpochDoneBarState createState() => _EpochDoneBarState();
}

class _EpochDoneBarState extends State<EpochDoneBar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.epochDone,
      child: Material(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        child: Container(
          height: 36,
          width: double.infinity,
        ),
      ),
    );
  }
}

class EpochLeftBar extends StatefulWidget {
  final int epochLeft;

  EpochLeftBar({@required this.epochLeft});

  @override
  _EpochLeftBarState createState() => _EpochLeftBarState();
}

class _EpochLeftBarState extends State<EpochLeftBar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.epochLeft,
      child: Container(
        //color: Colors.blue.shade100,
        color: Theme.of(context).primaryColor.withAlpha(25),
        height: 36,
        width: double.infinity,
      ),
    );
  }
}
