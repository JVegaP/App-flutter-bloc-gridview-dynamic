import 'package:flutter/material.dart';
import 'package:giphy_flutter_app/core/constants/app_constants.dart';
import 'package:giphy_flutter_app/core/themes/app_theme.dart';

class WidgetEmptyView extends StatelessWidget {

  final bool visible;
  final String? message;

  const WidgetEmptyView({
    required Key key,
    this.visible = false,
    this.message = kDefaultViewEmpty,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Visibility(
        visible: visible,
        child: Text(
          message ?? kDefaultViewEmpty,
          style: AppTheme.getAppTheme().textTheme.bodyText2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}