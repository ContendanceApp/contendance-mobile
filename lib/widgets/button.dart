import 'package:flutter/material.dart';

import '../constant/theme.dart';

class Button extends StatelessWidget {
  final String text;
  final GestureTapCallback callback;
  final bool primary;
  final bool secondary;
  final bool? custom;
  final Widget? withChild;
  final Color? borderColor;
  final Color? fontColor;
  final Color? backgroundColor;
  final double? paddingY;
  final double? paddingX;
  final double? customFontSize;
  final double fontSize = 15.0;

  const Button(
      {Key? key,
      required this.text,
      required this.callback,
      required this.primary,
      required this.secondary,
      this.custom,
      this.withChild,
      this.borderColor,
      this.fontColor,
      this.backgroundColor,
      this.paddingY,
      this.paddingX,
      this.customFontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return primary
        ? withChild == null
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80.0),
                  gradient: colorGradient,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 18),
                    primary: Colors.white,
                    textStyle: fontInter.copyWith(
                      fontSize: fontSize,
                      fontWeight: fwBold,
                    ),
                  ),
                  onPressed: callback,
                  child: Text(text),
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80.0),
                  gradient: colorGradient,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 18),
                    primary: Colors.white,
                    textStyle: fontInter.copyWith(
                      fontSize: fontSize,
                      fontWeight: fwBold,
                    ),
                  ),
                  onPressed: callback,
                  child: withChild ?? Text(text),
                ),
              )
        : secondary
            ? withChild == null
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: colorPrimaryBlue),
                      color: colorWhite,
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        primary: colorPrimaryBlue,
                        textStyle: fontInter.copyWith(
                          fontSize: fontSize,
                          fontWeight: fwBold,
                        ),
                      ),
                      onPressed: callback,
                      child: Text(text),
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: colorPrimaryBlue),
                      color: colorWhite,
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        primary: colorPrimaryBlue,
                        textStyle: fontInter.copyWith(
                          fontSize: fontSize,
                          fontWeight: fwBold,
                        ),
                      ),
                      onPressed: callback,
                      child: withChild ?? Text(text),
                    ),
                  )
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: borderColor ?? colorPrimaryBlue),
                  color: backgroundColor,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: Size.zero,
                    padding: EdgeInsets.symmetric(
                        vertical: paddingY ?? 18, horizontal: paddingX ?? 40),
                    primary: fontColor,
                    textStyle: fontInter.copyWith(
                      fontSize: customFontSize ?? fontSize,
                      fontWeight: fwBold,
                    ),
                  ),
                  onPressed: callback,
                  child: Text(text),
                ),
              );
  }
}
