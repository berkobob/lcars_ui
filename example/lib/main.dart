import 'package:flutter/material.dart';
import 'package:lcars_ui/lcars_ui.dart';

void main() {
  runApp(const LcarsDemoApp());
}

class LcarsDemoApp extends StatelessWidget {
  const LcarsDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LCARS UI Demo',
      debugShowCheckedModeBanner: false,
      theme: LcarsTheme.dark,
      home: const LcarsDemoScreen(),
    );
  }
}

class LcarsDemoScreen extends StatefulWidget {
  const LcarsDemoScreen({super.key});

  @override
  State<LcarsDemoScreen> createState() => _LcarsDemoScreenState();
}

class _LcarsDemoScreenState extends State<LcarsDemoScreen> {
  String _lastAction = 'Awaiting input';
  double _sliderValue = 60;

  void _onAction(String label) {
    setState(() => _lastAction = label);
    SoundService.playLcarsBeep();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LcarsColors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LcarsSidebar(
                    title: 'NCC',
                    children: [
                      LcarsButton(
                        label: 'Nav',
                        color: LcarsColors.lavender,
                        shape: LcarsButtonShape.leftRounded,
                        onPressed: () => _onAction('Navigation'),
                      ),
                      LcarsButton(
                        label: 'Comm',
                        color: LcarsColors.mauve,
                        shape: LcarsButtonShape.leftRounded,
                        onPressed: () => _onAction('Communications'),
                      ),
                      LcarsButton(
                        label: 'Ops',
                        color: LcarsColors.blueLavender,
                        shape: LcarsButtonShape.leftRounded,
                        onPressed: () => _onAction('Operations'),
                      ),
                      LcarsButton(
                        label: 'Eng',
                        color: LcarsColors.peach,
                        shape: LcarsButtonShape.leftRounded,
                        onPressed: () => _onAction('Engineering'),
                      ),
                      LcarsButton(
                        label: 'Med',
                        color: LcarsColors.orange,
                        shape: LcarsButtonShape.leftRounded,
                        onPressed: () => _onAction('Medical'),
                      ),
                      LcarsButton(
                        label: 'Sci',
                        color: LcarsColors.lightGold,
                        shape: LcarsButtonShape.leftRounded,
                        onPressed: () => _onAction('Sciences'),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(top: 20, right: 20, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildStatusCard(),
                          const SizedBox(height: 16),
                          _buildButtonShowcaseCard(),
                          const SizedBox(height: 16),
                          _buildColorPaletteCard(),
                          const SizedBox(height: 16),
                          _buildControlsCard(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      height: 70,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Left elbow connecting to sidebar
          Container(
            width: 150,
            decoration: const BoxDecoration(
              color: LcarsColors.gold,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Title area
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: const BoxDecoration(
                      color: LcarsColors.mauve,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'LCARS INTERFACE DEMO',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 28,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                _headerPill(LcarsColors.lavender, '2364'),
                const SizedBox(width: 8),
                _headerPill(LcarsColors.peach, 'UFP'),
              ],
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget _headerPill(Color color, String label) {
    return Container(
      width: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(30),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildStatusCard() {
    return LcarsCard(
      title: 'System Status',
      color: LcarsColors.gold,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _statusRow('Last Command', _lastAction, LcarsColors.lightGold),
          const SizedBox(height: 12),
          _statusRow('Warp Core', 'Nominal', LcarsColors.mauve),
          const SizedBox(height: 12),
          _statusRow('Shields', 'Online', LcarsColors.lavender),
          const SizedBox(height: 12),
          _statusRow('Life Support', 'Optimal', LcarsColors.peach),
        ],
      ),
    );
  }

  Widget _statusRow(String label, String value, Color color) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 12),
        SizedBox(
          width: 130,
          child: Text(
            label.toUpperCase(),
            style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Text(
            value.toUpperCase(),
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildButtonShowcaseCard() {
    return LcarsCard(
      title: 'Button Shapes',
      color: LcarsColors.mauve,
      child: Wrap(
        spacing: 12,
        runSpacing: 10,
        children: [
          LcarsButton(
            label: 'Pill',
            color: LcarsColors.gold,
            shape: LcarsButtonShape.pill,
            onPressed: () => _onAction('Pill button'),
          ),
          LcarsButton(
            label: 'Left',
            color: LcarsColors.mauve,
            shape: LcarsButtonShape.leftRounded,
            onPressed: () => _onAction('Left rounded'),
          ),
          LcarsButton(
            label: 'Right',
            color: LcarsColors.lavender,
            shape: LcarsButtonShape.rightRounded,
            onPressed: () => _onAction('Right rounded'),
          ),
          LcarsButton(
            label: 'Rect',
            color: LcarsColors.peach,
            shape: LcarsButtonShape.rectangle,
            onPressed: () => _onAction('Rectangle'),
          ),
        ],
      ),
    );
  }

  Widget _buildColorPaletteCard() {
    final swatches = [
      ('Gold', LcarsColors.gold),
      ('Lt Gold', LcarsColors.lightGold),
      ('Mauve', LcarsColors.mauve),
      ('Lavender', LcarsColors.lavender),
      ('Blue Lav', LcarsColors.blueLavender),
      ('Peach', LcarsColors.peach),
      ('Orange', LcarsColors.orange),
      ('Dk Orange', LcarsColors.darkOrange),
    ];

    return LcarsCard(
      title: 'Color Palette',
      color: LcarsColors.lavender,
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: swatches
            .map(
              (e) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 56,
                    height: 36,
                    decoration: BoxDecoration(
                      color: e.$2,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    e.$1.toUpperCase(),
                    style: TextStyle(
                      color: e.$2,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildControlsCard() {
    return LcarsCard(
      title: 'Controls',
      color: LcarsColors.peach,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Warp Factor'.toUpperCase(),
                style: const TextStyle(
                  color: LcarsColors.peach,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                _sliderValue.toStringAsFixed(0),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: LcarsColors.gold,
              inactiveTrackColor: LcarsColors.darkOrange,
              thumbColor: LcarsColors.lightGold,
              overlayColor: LcarsColors.gold.withValues(alpha: 0.2),
              trackHeight: 6,
            ),
            child: Slider(
              value: _sliderValue,
              min: 0,
              max: 100,
              onChanged: (v) {
                setState(() => _sliderValue = v);
                SoundService.playLcarsSlider();
              },
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              LcarsButton(
                label: 'Engage',
                color: LcarsColors.gold,
                shape: LcarsButtonShape.pill,
                onPressed: () => _onAction('Engage warp ${_sliderValue.toStringAsFixed(0)}'),
              ),
              const SizedBox(width: 12),
              LcarsButton(
                label: 'All Stop',
                color: LcarsColors.orange,
                shape: LcarsButtonShape.pill,
                onPressed: () {
                  setState(() => _sliderValue = 0);
                  _onAction('All stop');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return SizedBox(
      height: 30,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 150,
            decoration: const BoxDecoration(
              color: LcarsColors.darkOrange,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: LcarsColors.darkOrange,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                ),
              ),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 24),
              child: const Text(
                'STARFLEET COMPUTER INTERFACE v0.0.1',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
