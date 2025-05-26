import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';


class ExpandableTextWidget extends StatefulWidget {
  final String? text;

  const ExpandableTextWidget({super.key, this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  bool _expanded = false;

  // fixed initial text
  final String initialText =
      "Join Jamal, a gifted street dancer, as he overcomes urban challenges, rivalries, and personal struggles in a vibrant hip-hop journey filled with electrifying battles and raw emotion....";


  final String extraText = "my name is rimu";

  @override
  Widget build(BuildContext context) {
    final String content = widget.text?.trim().isNotEmpty == true
        ? widget.text!
        : initialText;

    return Container(
      color: Colors.black,
      child: RichText(
        text: TextSpan(
          style: AppTextStyle.bodyMediumStyle,
          children: [
            TextSpan(
              text: _expanded ? "$content\n$extraText " : "$content ",
            ),
            TextSpan(
              text: _expanded ? "View Less" : "View More",
              style: AppTextStyle.bodyMediumStyle.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
            ),
          ],
        ),
      ),
    );
  }
}


