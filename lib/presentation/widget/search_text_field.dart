import 'package:bloc_rick/constant/color.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField(
      {super.key, required this.textController, required this.onChanged});
  final TextEditingController textController;
  final void Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      cursorColor: AppColor.grey,
      decoration: const InputDecoration(
        hintText: "Find a character",
        border: InputBorder.none,
        hintStyle: TextStyle(color: AppColor.grey, fontSize: 18),
      ),
      style: const TextStyle(color: AppColor.grey, fontSize: 18),
      onChanged: onChanged,
    );
  }
}
