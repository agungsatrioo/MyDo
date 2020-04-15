import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget loading() => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator()),
          Text("Harap tunggu...")
        ],
      ),
    );
