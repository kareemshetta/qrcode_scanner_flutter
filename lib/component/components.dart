import 'package:flutter/material.dart';


Widget buildDefaultTextFormField(
    {required TextEditingController controller,
    required String? Function(String? value)? validator,
    bool isPassword = false,
    bool isEnable = true,
    void Function()? onTap,
    void Function(String value)? onChange,
    void Function(String value)? onSubmit,
    required String labelText,
    TextInputType keyBoardType = TextInputType.text,
    Widget? suffixIcon,
    Widget? prefixIcon}) {
  return TextFormField(
    enabled: isEnable,
    onFieldSubmitted: onSubmit,
    onChanged: onChange,
    onTap: onTap,
    controller: controller,
    validator: validator,
    obscureText: isPassword,
    keyboardType: keyBoardType,
    decoration: InputDecoration(
      label: Text(labelText),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2)),
    ),
  );
}

Widget defaultButton(
    {required void Function()? onPressed,
    required String buttonTitle,
    bool isUpper = false,
    Color buttonTextColor = Colors.white,
    Color color = Colors.lightBlue,
    double width = double.infinity}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
    width: width,
    child: MaterialButton(
      onPressed: onPressed,
      child: Text(
        isUpper ? buttonTitle.toUpperCase() : buttonTitle,
        style: TextStyle(color: buttonTextColor, fontSize: 20),
      ),
    ),
  );
}
