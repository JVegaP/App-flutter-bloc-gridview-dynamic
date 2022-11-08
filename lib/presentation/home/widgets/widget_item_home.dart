import 'package:flutter/material.dart';
import 'package:giphy_flutter_app/core/constants/color_constants.dart';
import 'package:giphy_flutter_app/core/constants/style_constants.dart';

class WidgetItemHome extends StatefulWidget {

  final String image;
  final String height;

  const WidgetItemHome({
     Key? key,
     required this.image,
     required this.height
  }): super(key: key);

  @override
  State<WidgetItemHome> createState() => _WidgetItemHomeState();
}

class _WidgetItemHomeState extends State<WidgetItemHome> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: kDimens10),
      decoration: const BoxDecoration(
        color:kBackgroundImage
      ),
      height: double.parse(widget.height),
      child:  FadeInImage.assetNetwork(
        height: double.parse(widget.height),
        fit: BoxFit.cover,
        placeholderScale: 0.1,
        placeholderFit: BoxFit.cover,
        placeholder: kIconPlaceHolder,
        image: widget.image,
      ),
    );
  }
}