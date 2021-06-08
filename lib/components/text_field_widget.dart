import 'package:dystopianapp/core/app_colors.dart';
import 'package:dystopianapp/home/widgets/home_model_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextFieldWidget extends StatelessWidget {

  final TextInputType typeKeyBoard;

  final String hintText;
  final IconData prefixIconData;
  final IconData suffixIconData;
  final bool obscureText;
  final Function onChanged;

  final TextEditingController myController;

  TextFieldWidget({
    this.typeKeyBoard,
    this.hintText,
    this.prefixIconData,
    this.suffixIconData,
    this.obscureText,
    this.onChanged,
    this.myController
  });

  @override
  Widget build(BuildContext context) {

    final model = Provider.of<HomeModelWidget>(context);
    
    return TextField(
      keyboardType: typeKeyBoard,
      controller: myController,
      onChanged: onChanged,
      obscureText: obscureText,
      style: TextStyle(
        color: AppColors.lightGrey,
        fontSize: 14.0
      ),
      cursorColor: AppColors.lightGrey,
      decoration: InputDecoration(
        labelText: hintText,
        prefixIcon: Icon(
          prefixIconData,
          size: 24,
          color: AppColors.lightGrey,
        ),
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.lightGrey)
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            model.isVisible = !model.isVisible;
          },
          child: Icon(
            suffixIconData,
            size: 24,
            color: AppColors.lightGrey,
          ),
        ),
        labelStyle: TextStyle(
          color: AppColors.lightGrey,
        ),
        focusColor: AppColors.lightGrey,
      ),
    );
  }
}