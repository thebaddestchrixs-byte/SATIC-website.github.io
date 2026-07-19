import 'package:flutter/material.dart';
import '../theme/tokens.dart';
import '../widgets/satic_button.dart';
import '../widgets/glowing_bulb.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onSeeWork;
  final VoidCallback onJoin;
  const HeroSection({super.key, required this.onSeeWork, required this.onJoin});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < Breakpoints.mobile;
    final pad = horizontalPadding(width);

    final textCol = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('SCIENCE & TECHNOLOGY INNOVATION CLUB',
            style: AppText.mono(size: 12.5, letterSpacing: 0.14)),
        const SizedBox(height: 14),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Curiosity,\n',
                style: AppText.display(
                  size: isMobile ? 46 : 76,
                  height: 0.98,
                  weight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: 'wired up.',
                style: AppText.display(
                  size: isMobile ? 46 : 76,
                  height: 0.98,
                  weight: FontWeight.w500,
                  style: FontStyle.italic,
                  color: AppColors.red,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 440),
          child: Text(
            'SATIC is a student community that turns half-formed ideas into '
            'working prototypes — circuits, models, and small inventions '
            'built by hand, one meeting at a time.',
            style: AppText.body(size: 17, color: AppColors.inkSoft, height: 1.5),
          ),
        ),
        const SizedBox(height: 30),
        Wrap(
          spacing: 14,
          runSpacing: 12,
          children: [
            SaticButton(label: 'See the work', onTap: onSeeWork),
            SaticButton(
                label: 'Join the club',
                onTap: onJoin,
                style: SaticButtonStyle.ghost),
          ],
        ),
      ],
    );

    final bulb = Center(child: GlowingBulb(size: isMobile ? 220 : 300));

    return Padding(
      padding: EdgeInsets.fromLTRB(pad, isMobile ? 32 : 64, pad, 40),
      child: isMobile
          ? Column(
              children: [
                bulb,
                const SizedBox(height: 12),
                textCol,
              ],
            )
          : IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 11, child: textCol),
                  const SizedBox(width: 24),
                  Expanded(flex: 9, child: bulb),
                ],
              ),
            ),
    );
  }
}
