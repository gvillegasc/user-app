import 'package:flutter/material.dart';
import 'package:userapp/core/app_colors.dart';
import 'package:userapp/core/responsive.dart';

class InputTextFormField extends StatelessWidget {
  final bool obscureText;
  final IconData iconData;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String errorText;
  final String hintText;
  final VoidCallback onChanged;

  const InputTextFormField(
      {Key key,
      this.obscureText = false,
      @required this.iconData,
      @required this.textEditingController,
      this.textInputType = TextInputType.text,
      @required this.errorText,
      @required this.hintText,
      @required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      margin: EdgeInsets.only(
        bottom: responsive.heightR(.15),
      ),
      child: TextField(
        autocorrect: false,
        controller: this.textEditingController,
        decoration: InputDecoration(
            errorText: this.errorText,
            hintText: this.hintText,
            hintStyle: TextStyle(fontWeight: FontWeight.w500),
            icon: Icon(
              this.iconData,
              color: AppColors.yellow50,
            )),
        obscureText: this.obscureText,
        keyboardType: this.textInputType,
        onChanged: (_) => this.onChanged(),
      ),
    );
  }
}
