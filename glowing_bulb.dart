import 'package:flutter/material.dart';
import '../theme/tokens.dart';

/// Recreates the club's split red/yellow bulb mark as a gently pulsing
/// "power on" moment using the real logo asset plus a painted glow —
/// no external SVG/image-generation, just the club's own icon crop.
class GlowingBulb extends StatefulWidget {
  final double size;
  const GlowingBulb({super.key, this.size = 300});

  @override
  State<GlowingBulb> createState() => _GlowingBulbState();
}

class _GlowingBulbState extends State<GlowingBulb>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2600),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size * 1.35,
      child: AnimatedBuilder(
        animation: _ctrl,
        builder: (context, child) {
          final glow = 0.35 + (_ctrl.value * 0.35);
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: 10,
                child: Container(
                  width: widget.size * 0.9,
                  height: widget.size * 0.9,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppColors.yellow.withOpacity(glow * 0.55),
                        AppColors.yellow.withOpacity(0),
                      ],
                    ),
                  ),
                ),
              ),
              child!,
            ],
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Image.asset(
            'assets/brand/logo_icon.png',
            width: widget.size * 0.72,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
