import 'package:flutter/material.dart';
import '../theme/tokens.dart';
import '../data/content.dart';

class WorkSection extends StatelessWidget {
  final GlobalKey sectionKey;
  const WorkSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < Breakpoints.mobile;
    final pad = horizontalPadding(width);
    final cols = width < Breakpoints.mobile ? 1 : (width < Breakpoints.tablet ? 2 : 3);

    return Container(
      key: sectionKey,
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: Breakpoints.wrap),
      margin: EdgeInsets.symmetric(horizontal: pad),
      padding: EdgeInsets.symmetric(vertical: isMobile ? 56 : 88),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('02 — WORK', style: AppText.mono(size: 12.5, letterSpacing: 0.14)),
          const SizedBox(height: 14),
          Text('Recent builds & sessions',
              style: AppText.display(size: isMobile ? 28 : 38, height: 1.15)),
          const SizedBox(height: 40),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: kWork.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: cols,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.82,
            ),
            itemBuilder: (context, i) => _WorkCard(item: kWork[i]),
          ),
        ],
      ),
    );
  }
}

class _WorkCard extends StatefulWidget {
  final WorkItem item;
  const _WorkCard({required this.item});

  @override
  State<_WorkCard> createState() => _WorkCardState();
}

class _WorkCardState extends State<_WorkCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.line),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRect(
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 400),
                  scale: _hover ? 1.05 : 1.0,
                  child: Image.asset(widget.item.asset, fit: BoxFit.cover, width: double.infinity),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.item.tag.toUpperCase(),
                      style: AppText.mono(size: 11, color: AppColors.red, letterSpacing: 0.1)),
                  const SizedBox(height: 6),
                  Text(widget.item.caption,
                      style: AppText.body(size: 13.5, color: AppColors.inkSoft, height: 1.45)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
