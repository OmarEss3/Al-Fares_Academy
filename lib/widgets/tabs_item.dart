import 'package:flutter/material.dart';
import 'package:moyeser_academy_web/utils/app_style.dart';

class TabsItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback? onTap;

  const TabsItem({
    super.key,
    required this.text,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: IntrinsicWidth(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 9),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: isSelected ? Colors.white : Colors.transparent,
                  width: 3, // Thickness of the bottom border
                ),
              ),
            ),
            child: Text(text, style: AppStyle.styleBold20(context)),
          ),
        ),
      ),
    );
  }
}
