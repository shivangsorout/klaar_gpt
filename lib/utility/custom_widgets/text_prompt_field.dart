import 'package:flutter/material.dart';
import 'package:open_ai_test/constants.dart';
import 'package:open_ai_test/extensions/context_extension.dart';
import 'package:open_ai_test/utility/utility.dart';

class TextPromptField extends StatelessWidget {
  final TextEditingController controller;
  final void Function()? onPressed;
  final bool disable;

  const TextPromptField({
    super.key,
    required this.controller,
    this.onPressed,
    required this.disable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: const Border(
          // For the line on top of the container behind the textfield
          top: BorderSide(
            width: 0.5,
            color: Colors.grey,
          ),
        ),
      ),
      padding: EdgeInsets.all(context.mqSize.height * 0.02),
      child: TextFormField(
        readOnly: disable,
        validator: (value) {
          if (value == null || value == '') {
            return 'Please enter something!';
          } else {
            return null;
          }
        },
        controller: controller,
        minLines: 1,
        maxLines: 3,
        style: TextStyle(
          color: textColor,
          fontSize: context.mqSize.height * 0.02281,
        ),
        textInputAction: TextInputAction.newline,
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          hintText: 'Message KlaarGPT...',
          suffixIconColor: iconColor,
          suffixIcon: IconButton(
            disabledColor: iconDisableColor,
            onPressed: onPressed,
            icon: const Icon(
              Icons.send_rounded,
            ),
          ),
          fillColor: backgroundColor,
          filled: true,
          enabledBorder: borderStyle,
          border: borderStyle,
          disabledBorder: borderStyle.copyWith(
              borderSide: BorderSide(
            color: Colors.grey[700]!,
          )),
          focusedBorder: borderStyle,
          errorBorder: borderStyle,
          focusedErrorBorder: borderStyle,
          contentPadding: EdgeInsets.only(
            left: context.mqSize.width * 0.04,
            top: context.mqSize.height * 0.0114,
            bottom: context.mqSize.height * 0.0114,
          ),
        ),
      ),
    );
  }
}
