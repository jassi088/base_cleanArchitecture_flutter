import 'package:flutter/material.dart';

import '../../shared/shared.dart';
import '../presentation.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.title,
    this.hintText = '',
    this.suffixIcon,
    this.controller,
    this.onChanged,
    this.onTap,
    this.keyboardType = TextInputType.text,
    this.validator,
    super.key,
  });

  final String title;
  final String hintText;
  final SvgGenImage? suffixIcon;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.s14w400Secondary()),
        SizedBox(height: 8.rps),
        TextFormField(
          onTap: onTap,
          onChanged: onChanged,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(hintText: hintText, border: const OutlineInputBorder()),
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
