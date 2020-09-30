import 'package:endeavor_stake_pools/components/pool_card.dart';
import 'package:flutter/material.dart';

class PoolDetails extends StatefulWidget {
  static String id = 'Dashboard';
  final String title;

  PoolDetails({@required this.title});

  @override
  _PoolDetailsState createState() => _PoolDetailsState();
}

class _PoolDetailsState extends State<PoolDetails> {
  String appBarTitleText = 'Title';

  @override
  Widget build(BuildContext context) {
    if (widget.title != null) {
      setState(() {
        appBarTitleText = widget.title;
      });
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(widget.title),
        // actions: [
        //   Icon(Icons.favorite),
        //   Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 16),
        //     child: Icon(Icons.search),
        //   ),
        //   Icon(Icons.more_vert),
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PoolCard(
              cardTitle: appBarTitleText,
            ),
            MaterialButton(
              child: Text('Go Back'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
