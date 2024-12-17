import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.controller,
    this.onChanged,
    this.clearOnPressed,
    this.onSearchPressed,
    this.onSubmitted,
  });

  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function()? clearOnPressed;
  final void Function()? onSearchPressed;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      controller: controller,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: clearOnPressed,
          icon: const Icon(Icons.clear, color: Colors.white),
        ),
        prefixIcon: IconButton(
          onPressed: onSearchPressed,
          icon: const Icon(
            Icons.book,
            color: Colors.white,
          ),
        ),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.75),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.8),
          ),
          borderRadius: BorderRadius.circular(25.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.8),
          ),
          borderRadius: BorderRadius.circular(25.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.8),
          ),
          borderRadius: BorderRadius.circular(25.r),
        ),
        hintText: 'Search',
        hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white.withOpacity(0.8),
            ),
      ),
    );
  }
}
