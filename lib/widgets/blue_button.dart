import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../themes/color_theme.dart';
import '../../themes/text_theme.dart';

class BlueButton extends StatelessWidget {
  final String content;
  final bool isLong;
  final bool isSmall;
  final bool isFill;
  final bool isDisable;
  BlueButton({required this.content, required this.isLong, required this.isSmall, required this.isFill, required this.isDisable});

  @override
  Widget build(BuildContext context) {
    double _displayWidth = MediaQuery.of(context).size.width;
    double _displayHeight = MediaQuery.of(context).size.height;


    TextStyle textStyle = isLong ? btnTitle1 : btnTitle2;

    return Container(
      width: (isSmall ? 78 : (isLong ? 330 : 141)),
      height: (isSmall ? 40 : 47),
      decoration: BoxDecoration(
        color: isDisable ? dalgeurakGrayTwo : (isFill ? dalgeurakBlueOne : Colors.white),
        borderRadius: BorderRadius.circular(isSmall ? 4 : isLong ? 15 : 5),
        border: Border.all(
          width: isFill ? 2 : 1,
          color: isDisable ? Colors.transparent : dalgeurakBlueOne,
        ),
      ),
      child: Center(
          child: Text(content, style: (isDisable ? textStyle.copyWith(color: dalgeurakGrayOne) : (isFill ? textStyle.copyWith(color: Colors.white) : textStyle)))),
    );
  }
}