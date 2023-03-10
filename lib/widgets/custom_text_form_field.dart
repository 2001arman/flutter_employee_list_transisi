import 'package:flutter/material.dart';
import 'package:flutter_employee_list_transisi/constant.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.isPassword = false,
    required this.title,
    this.minLines = 1,
    required this.controller,
    this.keyboarType = TextInputType.text,
  }) : super(key: key);

  final String hintText, title;
  final bool isPassword;
  final int minLines;
  final TextEditingController controller;
  final TextInputType keyboarType;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: blackTextStyle.copyWith(
            fontSize: 14,
            fontWeight: semiBold,
          ),
        ),
        const SizedBox(height: 10),
        widget.isPassword
            ? TextFormField(
                controller: widget.controller,
                obscureText: obscure,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please fill email section';
                  }
                  return null;
                },
                keyboardType: widget.keyboarType,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      if (obscure == false) {
                        obscure = true;
                      } else {
                        obscure = false;
                      }
                      setState(() {});
                    },
                    child: obscure
                        ? Icon(Icons.visibility_off, color: kBlackColor)
                        : Icon(Icons.visibility, color: kBlackColor),
                  ),
                  hintStyle: greyTextStyle.copyWith(fontSize: 13),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: kGreyColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: kOrangeColor),
                  ),
                ),
              )
            : TextFormField(
                controller: widget.controller,
                obscureText: widget.isPassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please fill password section';
                  }
                  return null;
                },
                keyboardType: widget.keyboarType,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: greyTextStyle.copyWith(fontSize: 13),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: kGreyColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: kOrangeColor),
                  ),
                ),
                maxLines: widget.minLines,
              ),
        const SizedBox(height: 12),
      ],
    );
  }
}
