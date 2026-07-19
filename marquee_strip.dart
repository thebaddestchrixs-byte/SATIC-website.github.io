import 'package:flutter/material.dart';
import '../theme/tokens.dart';

class MarqueeStrip extends StatefulWidget {
  const MarqueeStrip({super.key});

  @override
  State<MarqueeStrip> createState() => _MarqueeStripState();
}

class _MarqueeStripState extends State<MarqueeStrip>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  final _scrollController = ScrollController();

  static const _text =
      '  BUILD  ·  TEST  ·  ITERATE  ·  BUILD  ·  TEST  ·  ITERATE  ·  '
      'BUILD  ·  TEST  ·  ITERATE  ·  BUILD  ·  TEST  ·  ITERATE  ·';

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 14),
    )..addListener(_tick);
    WidgetsBinding.instance.addPostFrameCallback((_) => _ctrl.repeat());
  }

  void _tick() {
    if (!_scrollController.hasClients) return;
    final max = _scrollController.position.maxScrollExtent;
    if (max <= 0) return;
    _scrollController.jumpTo(_ctrl.value * max);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.ink,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        child: Row(
          children: List.generate(
            4,
            (_) => Text(_text, style: AppText.mono(color: AppColors.paper)),
          ),
        ),
      ),
    );
  }
}
