import 'package:flutter/material.dart';
import '../theme/tokens.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < Breakpoints.mobile;
    final pad = horizontalPadding(width);

    final lede = ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 480),
      child: Text(
        'SATIC brings together students who want hands-on time with '
        'electronics, basic engineering, and software — outside of a '
        'syllabus. Meetings are spent breadboarding circuits, sketching '
        'app ideas on flip-chart paper, and building physical models that '
        'prove a concept actually works.',
        style: AppText.body(size: 18, color: AppColors.inkSoft, height: 1.55),
      ),
    );

    final list = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _AboutRow('Hands-on', 'Every project starts on a breadboard, not a slide deck.'),
        _AboutRow('Peer-led', "Members teach members — that's most of the curriculum."),
        _AboutRow("Show, don't tell", 'Work gets exhibited, not just submitted.'),
      ],
    );

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: Breakpoints.wrap),
      margin: EdgeInsets.symmetric(horizontal: pad),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: isMobile ? 56 : 88),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('01 — ABOUT', style: AppText.mono(size: 12.5, letterSpacing: 0.14)),
          const SizedBox(height: 14),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Text(
              "A club for people who'd rather build the thing than just talk about it.",
              style: AppText.display(size: isMobile ? 28 : 38, height: 1.15),
            ),
          ),
          const SizedBox(height: 40),
          Container(height: 1, color: AppColors.line),
          const SizedBox(height: 40),
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [lede, const SizedBox(height: 32), list],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 11, child: lede),
                    const SizedBox(width: 60),
                    Expanded(flex: 9, child: list),
                  ],
                ),
        ],
      ),
    );
  }
}

class _AboutRow extends StatelessWidget {
  final String num;
  final String label;
  const _AboutRow(this.num, this.label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 130,
                child: Text(num, style: AppText.mono(size: 14, color: AppColors.red)),
              ),
              Expanded(
                child: Text(label, style: AppText.body(size: 15, height: 1.4)),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(height: 1, color: AppColors.line),
        ],
      ),
    );
  }
}
