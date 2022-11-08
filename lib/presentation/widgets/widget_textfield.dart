import 'package:flutter/material.dart';
import 'package:giphy_flutter_app/core/constants/app_constants.dart';
import 'package:giphy_flutter_app/core/constants/color_constants.dart';
import 'package:giphy_flutter_app/core/constants/style_constants.dart';
import 'package:giphy_flutter_app/core/themes/app_theme.dart';

class WidgetTextField extends StatefulWidget {

  final TextEditingController _controller;
  final FocusNode? _focusNode;
  final String? _labelText;
  final Function(String) _onSubmitted;
  final Widget? _prefix;

  WidgetTextField({
    TextEditingController? controller,
    FocusNode? focusNode,
    String? labelText,
    required Key key,
    required Function(String) onSubmitted,
    Widget? prefix
  }):
        _controller = controller ?? TextEditingController(text: kDefaultEmptyString),
        _focusNode = focusNode,
        _labelText = labelText,
        _onSubmitted = onSubmitted,
        _prefix = prefix,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _WidgetTextField();
}

class _WidgetTextField extends State<WidgetTextField> {

  @override
  Widget build(BuildContext context) {
    return _createTextField();
  }

  /// Method that creates the main content of the textFieldInput
  Widget _createTextField() {
    return TextField(
      controller: widget._controller,
      decoration: _createInputDecoration(),
      focusNode: widget._focusNode,
      keyboardType: TextInputType.text,
      onSubmitted: (String value) {
        widget._onSubmitted(value);
      },
      style: AppTheme.getAppTheme().textTheme.bodyText1?.copyWith(
        color: kBlack
      ),
      textAlign: TextAlign.start,
      textCapitalization: TextCapitalization.none,
      textInputAction: TextInputAction.search,
    );
  }

  /// Method that configure the icon in the prefix
  Widget? _createPrefixIcon() {
    if(widget._prefix == null) {
      return null;
    } else {
      return widget._prefix;
    }
  }

  /// Method that customize the textField input decoration
  InputDecoration _createInputDecoration() {
    return InputDecoration(
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kWhite),
            borderRadius: BorderRadius.all(Radius.circular(kDimens15))
        ),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: kWhite),
            borderRadius: BorderRadius.all(Radius.circular(kDimens15))
        ),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kWhite),
            borderRadius: BorderRadius.all(Radius.circular(kDimens15))
        ),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kWhite),
            borderRadius: BorderRadius.all(Radius.circular(kDimens15))
        ),
        contentPadding: const EdgeInsetsDirectional.all(5),
        fillColor: kGray.withOpacity(.2),
        filled: true,
        hintText: widget._labelText,
        hintStyle: AppTheme.getAppTheme().textTheme.bodyText2,
        prefixIcon: _createPrefixIcon()
    );
  }
}