import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/tokens.dart';
import '../widgets/satic_button.dart';
import '../data/content.dart';

class JoinSection extends StatelessWidget {
  final GlobalKey sectionKey;
  const JoinSection({super.key, required this.sectionKey});

  Future<void> _openMail() async {
    final uri = Uri(scheme: 'mailto', path: kEmail);
    if (await canLaunchUrl(uri)) launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < Breakpoints.mobile;
    final pad = horizontalPadding(width);

    return Container(
      key: sectionKey,
      width: double.infinity,
      color: AppColors.ink,
      padding: EdgeInsets.symmetric(horizontal: pad, vertical: isMobile ? 64 : 100),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Column(
            children: [
              Image.asset('assets/brand/logo_icon.png',
                  width: 56, color: AppColors.paper),
              const SizedBox(height: 26),
              Text(
                'Got an idea worth prototyping?',
                textAlign: TextAlign.center,
                style: AppText.display(
                    size: isMobile ? 28 : 40, color: AppColors.paper),
              ),
              const SizedBox(height: 18),
              Text(
                'SATIC meets regularly to build, break, and rebuild things. '
                'No prior experience required — just curiosity and a '
                'willingness to get your hands on a breadboard.',
                textAlign: TextAlign.center,
                style: AppText.body(
                    size: 16, color: const Color(0xFFC9C6BA), height: 1.5),
              ),
              const SizedBox(height: 32),
              SaticButton(
                label: 'Get in touch',
                onTap: _openMail,
                style: SaticButtonStyle.onDark,
                horizontalPad: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final pad = horizontalPadding(width);

    return Container(
      width: double.infinity,
      color: AppColors.ink,
      padding: EdgeInsets.fromLTRB(pad, 0, pad, 48),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/brand/logo_icon.png',
                  width: 20, color: const Color(0xFFF1F3EC)),
              const SizedBox(width: 8),
              Text('SATIC',
                  style: AppText.display(
                      size: 18, weight: FontWeight.w700, color: AppColors.paper)),
            ],
          ),
          const SizedBox(height: 10),
          Text('Science and Technology Innovation Club',
              style: AppText.body(size: 13, color: const Color(0xFF8B8778))),
          const SizedBox(height: 4),
          Text('Site built from the club\'s own project photos.',
              style: AppText.mono(size: 11, color: const Color(0xFF8B8778))),
        ],
      ),
    );
  }
}
