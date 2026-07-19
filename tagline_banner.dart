import 'package:flutter/material.dart';
import '../theme/tokens.dart';

/// Full-bleed banner built around the club's own title-card photo
/// ("SATIC — Inventing for the future.").
class TaglineBanner extends StatelessWidget {
  const TaglineBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < Breakpoints.mobile;

    return SizedBox(
      width: double.infinity,
      height: isMobile ? 260 : 360,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/brand/tagline_card.jpg', fit: BoxFit.cover),
          Container(color: AppColors.ink.withOpacity(0.18)),
        ],
      ),
    );
  }
}
