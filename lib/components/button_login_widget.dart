import 'package:dystopianapp/core/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonLoginWidget extends StatelessWidget {

  final String title;
  final bool hasBorder;
  final Function actionProp;

  const ButtonLoginWidget({
    this.title,
    this.hasBorder,
    this.actionProp
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          color: hasBorder ? Colors.transparent : AppColors.black,
          borderRadius: BorderRadius.circular(10),
          border: hasBorder
            ? Border.all(
              color: AppColors.lightGrey,
              width: 1.0
            )
            : Border.fromBorderSide(BorderSide.none),
        ),
        child: InkWell(
          onTap: actionProp,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: !hasBorder ? 60.0 : 45.0,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}