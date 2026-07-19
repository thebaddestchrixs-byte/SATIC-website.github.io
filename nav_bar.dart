import 'package:flutter/material.dart';
import '../theme/tokens.dart';
import 'satic_button.dart';

class NavBar extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback onAbout;
  final VoidCallback onWork;
  final VoidCallback onTeam;
  final VoidCallback onJoin;

  const NavBar({
    super.key,
    required this.onAbout,
    required this.onWork,
    required this.onTeam,
    required this.onJoin,
  });

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool _menuOpen = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < Breakpoints.mobile;
    final pad = horizontalPadding(width);

    return Material(
      color: AppColors.paper.withOpacity(0.92),
      elevation: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 64,
            padding: EdgeInsets.symmetric(horizontal: pad),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.line)),
            ),
            child: Row(
              children: [
                Image.asset('assets/brand/logo_icon.png', width: 26),
                const SizedBox(width: 10),
                Text('SATIC',
                    style: AppText.display(
                        size: 20, weight: FontWeight.w700)),
                const Spacer(),
                if (!isMobile) ...[
                  _NavLink('About', widget.onAbout),
                  const SizedBox(width: 32),
                  _NavLink('Work', widget.onWork),
                  const SizedBox(width: 32),
                  _NavLink('Team', widget.onTeam),
                  const SizedBox(width: 32),
                  SaticButton(
                    label: 'Join the club',
                    onTap: widget.onJoin,
                    style: SaticButtonStyle.ghost,
                    horizontalPad: 16,
                  ),
                ] else
                  IconButton(
                    icon: Icon(_menuOpen ? Icons.close : Icons.menu,
                        color: AppColors.ink),
                    onPressed: () => setState(() => _menuOpen = !_menuOpen),
                  ),
              ],
            ),
          ),
          if (isMobile && _menuOpen)
            Container(
              decoration: const BoxDecoration(
                color: AppColors.paper,
                border: Border(bottom: BorderSide(color: AppColors.line)),
              ),
              child: Column(
                children: [
                  _MobileLink('About', () {
                    setState(() => _menuOpen = false);
                    widget.onAbout();
                  }),
                  _MobileLink('Work', () {
                    setState(() => _menuOpen = false);
                    widget.onWork();
                  }),
                  _MobileLink('Team', () {
                    setState(() => _menuOpen = false);
                    widget.onTeam();
                  }),
                  _MobileLink('Join the club', () {
                    setState(() => _menuOpen = false);
                    widget.onJoin();
                  }),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _NavLink(this.label, this.onTap);

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 150),
          style: AppText.body(
            size: 14.5,
            color: _hover ? AppColors.red : AppColors.ink,
          ),
          child: Text(widget.label),
        ),
      ),
    );
  }
}

class _MobileLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _MobileLink(this.label, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration:
            const BoxDecoration(border: Border(top: BorderSide(color: AppColors.line))),
        child: Text(label, style: AppText.body(size: 15)),
      ),
    );
  }
}
