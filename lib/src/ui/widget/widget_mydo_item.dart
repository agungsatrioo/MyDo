import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydo/src/ui/widget/widget_round.dart';

class MyDoItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            WidgetRound(
              child: Text("A",
                  style: TextStyle(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      fontSize: 24)),
              color: Colors.green,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Catatan 1",
                  style: Theme.of(context).textTheme.subhead,
                ),
                SizedBox(
                  height: 4,
                ),
                Text("24 Agustus 2000",
                    style: Theme.of(context).textTheme.caption),
              ],
            )
          ],
        ));
  }
}
