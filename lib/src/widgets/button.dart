import 'package:flutter/material.dart';
import '../theme/colors.dart';

enum LcarsButtonShape { pill, leftRounded, rightRounded, rectangle }

class LcarsButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;
  final LcarsButtonShape shape;
  final double? width;
  final double height;

  const LcarsButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color = LcarsColors.gold,
    this.shape = LcarsButtonShape.pill,
    this.width,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Material(
        color: color,
        borderRadius: _getBorderRadius(),
        child: InkWell(
          onTap: () {
            onPressed();
          },
          borderRadius: _getBorderRadius(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            alignment: Alignment.centerRight,
            child: Text(
              label.toUpperCase(),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  BorderRadius _getBorderRadius() {
    const radius = Radius.circular(30);
    switch (shape) {
      case LcarsButtonShape.pill:
        return BorderRadius.circular(30);
      case LcarsButtonShape.leftRounded:
        return const BorderRadius.only(topLeft: radius, bottomLeft: radius);
      case LcarsButtonShape.rightRounded:
        return const BorderRadius.only(topRight: radius, bottomRight: radius);
      case LcarsButtonShape.rectangle:
        return BorderRadius.zero;
    }
  }
}
