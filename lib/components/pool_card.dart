import 'package:flutter/material.dart';

class PoolCard extends StatelessWidget {
  final String cardTitle;
  final String cardSubtitle;
  final String bodyText;
  final Color backgroundColor;

  PoolCard(
      {this.cardTitle, this.cardSubtitle, this.bodyText, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    //print(cardTitle);
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 3.0,
      color: this.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            //leading: Icon(Icons.arrow_drop_down_circle),
            title: Text(
              this.cardTitle,
              style: TextStyle(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: this.cardSubtitle == null
                ? null
                : Text(
                    this.cardSubtitle,
                    style: TextStyle(color: Colors.black54),
                    overflow: TextOverflow.ellipsis,
                  ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: this.bodyText == null ? null : Text(this.bodyText),
          ),
        ],
      ),
    );
  }
}
