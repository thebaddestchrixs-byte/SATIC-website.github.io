import 'package:flutter/material.dart';
import '../theme/tokens.dart';

enum SaticButtonStyle { primary, ghost, onDark }

class SaticButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final SaticButtonStyle style;
  final double horizontalPad;

  const SaticButton({
    super.key,
    required this.label,
    required this.onTap,
    this.style = SaticButtonStyle.primary,
    this.horizontalPad = 24,
  });

  @override
  State<SaticButton> createState() => _SaticButtonState();
}

class _SaticButtonState extends State<SaticButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color fg;
    Color border;

    switch (widget.style) {
      case SaticButtonStyle.primary:
        bg = AppColors.ink;
        fg = AppColors.paper;
        border = AppColors.ink;
        break;
      case SaticButtonStyle.ghost:
        bg = _hover ? AppColors.ink : Colors.transparent;
        fg = _hover ? AppColors.paper : AppColors.ink;
        border = AppColors.ink;
        break;
      case SaticButtonStyle.onDark:
        bg = AppColors.paper;
        fg = AppColors.ink;
        border = AppColors.paper;
        break;
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedSlide(
          duration: const Duration(milliseconds: 160),
          offset: _hover ? const Offset(0, -0.06) : Offset.zero,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: EdgeInsets.symmetric(
                horizontal: widget.horizontalPad, vertical: 14),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: border),
            ),
            child: Text(
              widget.label,
              style: AppText.mono(
                size: 13.5,
                color: fg,
                letterSpacing: 0.03,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
