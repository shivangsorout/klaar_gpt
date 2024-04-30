import 'package:flutter/material.dart';
import 'package:open_ai_test/constants.dart';
import 'package:open_ai_test/extensions/context_extension.dart';

class IntroMessage extends StatelessWidget {
  const IntroMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            'assets/images/klaar_logo.png',
            height: context.mqSize.height * 0.07,
          ),
        ),
        SizedBox(
          height: context.mqSize.height * 0.02,
        ),
        Text(
          'How can I help you today?',
          style: TextStyle(
            color: textColor,
            fontSize: context.mqSize.height * 0.035,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
