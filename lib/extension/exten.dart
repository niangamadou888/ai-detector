import 'package:flutter/material.dart';

extension Responsivenes on BuildContext {
  double sw(double presentage) => MediaQuery.of(this).size.width * presentage;
  double sh(double presentage) => MediaQuery.of(this).size.height * presentage;
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

extension TTT on String {
  Text txt({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) =>
      Text(
        this,
        style: TextStyle(
            color: color ?? Colors.white,
            fontSize: fontSize,
            fontWeight: fontWeight),
      );
  bool get isUrlValid {
    // Regular expression pattern for URL validation
    const pattern =
        r'^(?:http|https):\/\/[\w\-]+(?:\.[\w\-]+)+(?:[\w\-.,@?^=%&:/~+#]*[\w\-@?^=%&/~+#])?$';

    // Create a regular expression object
    final regex = RegExp(pattern);

    // Use the RegExp match method to check if the URL matches the pattern
    return regex.hasMatch(this);
  }
}

extension NNN on num {
  SizedBox get sh => SizedBox(
        height: toDouble(),
      );
  SizedBox get sw => SizedBox(
        width: toDouble(),
      );
}

extension WWW on Widget {
  InkWell onTap(onTap) {
    return InkWell(
      onTap: onTap,
      child: this,
    );
  }
}
