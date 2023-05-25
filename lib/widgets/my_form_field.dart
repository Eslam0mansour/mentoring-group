import 'package:flutter/material.dart';

class MyFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final Widget? prefixIcon;
  final IconButton? suffixIcon;
  final bool? isPassword;
  final Function(String)? onSubmit;
  final Function(String)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? isAutoFocus;
  final Function()? onTap;
  final bool? readOnly ;
  const MyFormField({
    Key? key,
    this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword,
    this.onSubmit,
    this.validator,
    this.controller,
    this.keyboardType,
    this.isAutoFocus,
    this.onTap,
    this.readOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side:  BorderSide(color: Colors.grey.shade400)
          ),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
              child: TextFormField(
                validator: (value) => validator!(value!),
                controller: controller,
                onTap: onTap,
                readOnly: readOnly ?? false,
                keyboardType: keyboardType,
                autofocus: isAutoFocus ?? false,
                obscureText: isPassword ?? false,
                style: Theme.of(context).textTheme.bodySmall,
                onFieldSubmitted: (value) => onSubmit!(value) ?? "",
                decoration: InputDecoration(
                  errorStyle: const TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                  ),
                  hintStyle: TextStyle(color: Colors.grey.shade500 , fontSize: 15 , fontWeight: FontWeight.w400),
                  hintText: hint,
                  labelText: label,
                  prefixIcon: prefixIcon,
                  suffixIcon: suffixIcon,
                  border: InputBorder.none,
                ),
              ))),
    );
  }
}
