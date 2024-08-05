import 'package:flutter/material.dart';
import 'package:cgi_task_v1/shared/utils/styles/font_styles.dart';

class CGITextField extends StatelessWidget {
  const CGITextField(
      {super.key, required this.controller, required this.hintText});

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            offset: const Offset(-1, -1),
            blurRadius: 2,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(1, 1),
            blurRadius: 2,
            spreadRadius: 1,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        onChanged: (String value) {
          controller.value = controller.value.copyWith(
            text: value.toUpperCase(),
            selection: TextSelection.collapsed(offset: value.length),
          );
        },
        style: CGITaskFonts.regularFonts14,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: hintText.toUpperCase(),
          hintStyle: CGITaskFonts.hintRegularFonts14,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
    );
  }
}
