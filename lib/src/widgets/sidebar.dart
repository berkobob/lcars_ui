import 'package:flutter/material.dart';
import '../theme/colors.dart';

class LcarsSidebar extends StatelessWidget {
  final List<Widget> children;
  final String? title;

  const LcarsSidebar({super.key, required this.children, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20, right: 10),
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (title != null) ...[
            Container(
              height: 60,
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: LcarsColors.mauve,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(5),
                ),
              ),
              child: Text(
                title!.toUpperCase(),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(height: 5),
          ],
          ...children.map(
            (child) => Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: child,
            ),
          ),
          const Spacer(),
          Container(
            height: 40,
            decoration: const BoxDecoration(
              color: LcarsColors.gold,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                topLeft: Radius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
