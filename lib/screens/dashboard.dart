import 'package:endeavor_stake_pools/components/epoch_status_card.dart';
import 'package:endeavor_stake_pools/components/pool_card.dart';
import 'package:endeavor_stake_pools/components/stacked_bar_chart.dart';
import 'package:endeavor_stake_pools/screens/pool_details.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  static String id = 'Dashboard';
  DashboardScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Stake Pools',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          print('ENDVR tapped');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PoolDetails(
                                title: 'ENDVR',
                              ),
                            ),
                          );
                        },
                        splashColor:
                            Theme.of(context).primaryColor.withAlpha(30),
                        child: PoolCard(
                          cardTitle: 'ENDVR',
                          cardSubtitle: 'Endeavor ENDVR',
                          bodyText:
                              'AWS-backed, international stake pool for maximizing, uptime, reliability, and performance.',
                          backgroundColor: Theme.of(context).primaryColorLight,
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          print('PEACE tapped');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PoolDetails(
                                title: 'PEACE',
                              ),
                            ),
                          );
                        },
                        splashColor: Colors.green.shade300.withAlpha(30),
                        child: PoolCard(
                          cardTitle: 'PEACE',
                          cardSubtitle:
                              '☮ Endeavor Peace / 平和 - Premium Stake Pool ☮',
                          bodyText:
                              'Achieving PEACE one ₳D₳ at a time! Professionally run, AWS-backed pool.',
                          backgroundColor: Colors.green.shade100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Network Details',
                  style: Theme.of(context).textTheme.headline5),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                elevation: 2.0,
                child: Container(
                  child: EpochStatusCard(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Card(
                elevation: 3.0,
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Last 4 Epoch Performance',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                      child: SizedBox(
                        height: 100,
                        child: StackedFillColorBarChart.withSampleData(),
                      ),
                    ),
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
