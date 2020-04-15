import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WidgetRound extends StatelessWidget {
  final Color color;
  final Widget child;
  final EdgeInsets iconMargin, iconPadding;

  WidgetRound({
    @required this.child,
    @required this.color,
    this.iconMargin = const EdgeInsets.only(right: 16),
    this.iconPadding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(
          color: this.color,
          shape: BoxShape.circle,
        ),
        margin: this.iconMargin,
        child: Padding(padding: this.iconPadding, child: this.child));
  }
}
