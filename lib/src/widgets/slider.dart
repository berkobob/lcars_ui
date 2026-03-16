import 'package:flutter/material.dart';
import '../theme/colors.dart';

/// A Star Trek LCARS style slider widget.
///
/// Features a segmented track and a blocky thumb, providing an authentic
/// high-tech aesthetic consistent with the LCARS interface.
class LcarsSlider extends StatelessWidget {
  /// The current value of the slider.
  final double value;

  /// Called when the user starts selecting a new value for the slider.
  final ValueChanged<double> onChanged;

  /// The minimum value the user can select.
  final double min;

  /// The maximum value the user can select.
  final double max;

  /// The color of the active (left) side of the track.
  final Color activeColor;

  /// The color of the inactive (right) side of the track.
  final Color inactiveColor;

  /// The color of the slider's thumb.
  final Color thumbColor;

  /// An optional label to display above the slider.
  final String? label;

  /// The number of segments to display in the track.
  final int segments;

  /// How many decimal places to show in the value display.
  final int fractionDigits;

  /// Creates an LCARS-style slider.
  const LcarsSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 100,
    this.activeColor = LcarsColors.gold,
    this.inactiveColor = LcarsColors.peach,
    this.thumbColor = LcarsColors.lightGold,
    this.label,
    this.segments = 15,
    this.fractionDigits = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label!.toUpperCase(),
                  style: TextStyle(
                    color: activeColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                Text(
                  value.toStringAsFixed(fractionDigits).toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onHorizontalDragUpdate: (details) =>
              _handleInteraction(context, details.localPosition),
          onTapDown: (details) =>
              _handleInteraction(context, details.localPosition),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double width = constraints.maxWidth;
              const double height = 32.0;
              const double thumbWidth = 16.0;
              final double normalizedValue = (value - min) / (max - min);

              return SizedBox(
                height: height,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.centerLeft,
                  children: [
                    // Background track with segments
                    Container(
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Row(
                        children: List.generate(segments, (index) {
                          final isFirst = index == 0;
                          final isLast = index == segments - 1;
                          // A segment is active if its starting point is less than or equal to the value
                          final bool isActive =
                              (index / segments) < normalizedValue;

                          return Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: isLast ? 0 : 2),
                              decoration: BoxDecoration(
                                color: isActive
                                    ? activeColor
                                    : inactiveColor.withValues(alpha: 0.3),
                                borderRadius: BorderRadius.only(
                                  topLeft: isFirst
                                      ? const Radius.circular(4)
                                      : Radius.zero,
                                  bottomLeft: isFirst
                                      ? const Radius.circular(4)
                                      : Radius.zero,
                                  topRight: isLast
                                      ? const Radius.circular(4)
                                      : Radius.zero,
                                  bottomRight: isLast
                                      ? const Radius.circular(4)
                                      : Radius.zero,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    // Blocky thumb
                    Positioned(
                      left: normalizedValue * (width - thumbWidth),
                      child: Container(
                        width: thumbWidth,
                        height: height,
                        decoration: BoxDecoration(
                          color: thumbColor,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              color: thumbColor.withValues(alpha: 0.4),
                              blurRadius: 8,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _handleInteraction(BuildContext context, Offset localPosition) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final double width = renderBox.size.width;
    final double newValue = (localPosition.dx / width) * (max - min) + min;
    onChanged(newValue.clamp(min, max));
  }
}
