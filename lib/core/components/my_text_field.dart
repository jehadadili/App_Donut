import 'package:flutter/material.dart';
import 'package:marckit/core/constants/app_colors.dart';
import 'package:marckit/core/constants/app_size.dart';

class MyTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String hintText;
  final double? width;
  final double? height;
  final IconData? suffixIcon;
  final int maxLines;
  final void Function()? onTapSuffixIcon;
  final Function(String)? onChanged;

  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;

  const MyTextField({
    super.key,
    required this.hintText,
    this.width,
    this.height,
    required this.onChanged,
    this.suffixIcon,
    required this.validator,
    this.obscureText = false,
    this.keyboardType,
    this.prefixIcon,
    this.maxLines = 1,
    this.onTapSuffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 353,
      height: height ?? 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextFormField(
        onChanged: onChanged,
        keyboardType: keyboardType ?? TextInputType.text,
        obscureText: obscureText,
        validator: validator,
        style: TextStyle(
          color: AppColors.black,
          fontSize: Sizes.allSizes(context) / 70,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: Sizes.width(context) / 25,
            vertical: maxLines > 1 ? Sizes.height(context) / 50 : 10,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: InkWell(
            onTap: onTapSuffixIcon,
            child: (suffixIcon != null)
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                    ),
                    child: Icon(suffixIcon),
                  )
                : const SizedBox(),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: Sizes.allSizes(context) / 70,
            color: AppColors.grey,
            fontWeight: FontWeight.bold,
          ),

          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
          errorMaxLines: 1, // تحديد عدد الأسطر للخطأ
          helperMaxLines: 1, // تحديد عدد الأسطر للمساعدة
          errorStyle: const TextStyle(height: 0.1), // تقليل ارتفاع الخطأ
          helperStyle: const TextStyle(height: 0.1), // تقليل ارتفاع المساعدة
        ),
      ),
    );
  }
}
