// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:touch_ripple_effect/touch_ripple_effect.dart';

const Color clr = Color.fromRGBO(75, 116, 255, 1);

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.title,
      required this.onPress,
      this.color = clr,
      this.icon,
      this.fontSize = 15,
      this.textColor = Colors.white,
      this.borderRadius = 5,
      this.iconHeightWidth = 20,
      this.iconColor,
      this.isDisabled = false});

  final String title;
  final Function onPress;
  final Color color;
  final Color textColor;
  final String? icon;
  final double? fontSize;
  final double borderRadius;
  final double iconHeightWidth;
  final Color? iconColor;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return isDisabled
        ? Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(borderRadius)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (icon != null)
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Image.asset(
                              icon!,
                              color: iconColor,
                              height: iconHeightWidth,
                              width: iconHeightWidth,
                            ),
                          ),
                        Flexible(
                          child: Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.baloo2(
                                fontSize: fontSize,
                                color: textColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ))
        : TouchRippleEffect(
            borderRadius: BorderRadius.circular(5),
            rippleColor: Colors.white60,
            onTap: () => onPress(),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(borderRadius)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (icon != null)
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Image.asset(
                              icon!,
                              color: iconColor,
                              height: iconHeightWidth,
                              width: iconHeightWidth,
                            ),
                          ),
                        Flexible(
                          child: Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                                fontSize: fontSize,
                                color: textColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ));
  }
}
