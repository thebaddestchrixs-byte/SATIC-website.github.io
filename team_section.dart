import 'package:flutter/material.dart';
import '../theme/tokens.dart';
import '../data/content.dart';

class TeamSection extends StatelessWidget {
  final GlobalKey sectionKey;
  const TeamSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < Breakpoints.mobile;
    final pad = horizontalPadding(width);
    final cols = width < Breakpoints.mobile
        ? 2
        : (width < Breakpoints.tablet ? 3 : 5);

    return Container(
      key: sectionKey,
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: Breakpoints.wrap),
      margin: EdgeInsets.symmetric(horizontal: pad),
      padding: EdgeInsets.symmetric(vertical: isMobile ? 56 : 88),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('03 — TEAM', style: AppText.mono(size: 12.5, letterSpacing: 0.14)),
          const SizedBox(height: 14),
          Text('The people behind the projects',
              style: AppText.display(size: isMobile ? 28 : 38, height: 1.15)),
          const SizedBox(height: 8),
          Text('Member names to be added — edit lib/data/content.dart.',
              style: AppText.mono(size: 12.5)),
          const SizedBox(height: 36),

          // Group photo, full width feature
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: AspectRatio(
              aspectRatio: isMobile ? 4 / 5 : 16 / 7,
              child: Image.asset(kGroupPhoto, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 4),
          Container(height: 2, color: AppColors.line),
          const SizedBox(height: 28),

          // Individual grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: kTeam.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: cols,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              childAspectRatio: 3 / 4,
            ),
            itemBuilder: (context, i) => _MemberCard(member: kTeam[i]),
          ),
        ],
      ),
    );
  }
}

class _MemberCard extends StatefulWidget {
  final TeamMember member;
  const _MemberCard({required this.member});

  @override
  State<_MemberCard> createState() => _MemberCardState();
}

class _MemberCardState extends State<_MemberCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: _hover
                ? Image.asset(
                    widget.member.asset,
                    key: const ValueKey('color'),
                    fit: BoxFit.cover,
                  )
                : ColorFiltered(
                    key: const ValueKey('gray'),
                    colorFilter: const ColorFilter.matrix(<double>[
                      0.2126, 0.7152, 0.0722, 0, 0,
                      0.2126, 0.7152, 0.0722, 0, 0,
                      0.2126, 0.7152, 0.0722, 0, 0,
                      0, 0, 0, 1, 0,
                    ]),
                    child: Image.asset(widget.member.asset, fit: BoxFit.cover),
                  ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [AppColors.ink.withOpacity(0.85), Colors.transparent],
                ),
              ),
              child: Text(
                '${widget.member.name}\n${widget.member.role}',
                style: AppText.mono(size: 10.5, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
