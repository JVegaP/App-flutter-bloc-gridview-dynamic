import 'package:flutter/material.dart';
import 'package:giphy_flutter_app/core/constants/color_constants.dart';
import 'package:giphy_flutter_app/core/constants/style_constants.dart';

class WidgetAnimationCircularLoading extends StatelessWidget {

  final Color? color;
  final bool visible;

  const WidgetAnimationCircularLoading({
    required Key key,
    this.color = kBlack,
    this.visible = false,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Visibility(
        visible: visible,
        child: CircularProgressIndicator(
          color: color,
          strokeWidth: kDimens3,
        ),
      ),
    );
  }
}