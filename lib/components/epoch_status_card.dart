import 'dart:async';

import 'package:endeavor_stake_pools/components/epoch_status_bar.dart';
import 'package:flutter/material.dart';

const String epochStart = '2020-09-27 21:44:51';
Timer timer;

int epochDone = 1;
int epochLeft = 99;

class EpochStatusCard extends StatefulWidget {
  @override
  _EpochStatusCardState createState() => _EpochStatusCardState();
}

class _EpochStatusCardState extends State<EpochStatusCard> {
  @override
  void initState() {
    super.initState();

    timer =
        Timer.periodic(Duration(seconds: 2), (Timer t) => updateEpochState());
  }

  void updateEpochState() {
    // Update epoch state
    //the birthday's date
    final epochStartDate =
        DateTime.parse(epochStart); // DateTime(2020, 9, 22, 2, 44, 51);

    print(epochStartDate);

    final nowDate = DateTime.now();
    final difference = nowDate.difference(epochStartDate).inSeconds;

    //print(((difference / 432000) * 100).toStringAsFixed(0));

    setState(() {
      epochDone = int.parse(((difference / 432000) * 100).toStringAsFixed(0));
      epochLeft = 100 - epochDone;
    });

    //print(epochDone);
    //print(epochLeft);
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          //leading: Icon(Icons.arrow_drop_down_circle),
          title: const Text('Epoch Summary (219)',
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(
            '$epochDone% complete',
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          child: Material(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: EpochStatusBar(epochDone: epochDone, epochLeft: epochLeft),
          ),
        ),
      ],
    );
  }
}
