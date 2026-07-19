import 'package:flutter/material.dart';
import 'theme/tokens.dart';
import 'widgets/nav_bar.dart';
import 'widgets/marquee_strip.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/tagline_banner.dart';
import 'sections/work_section.dart';
import 'sections/team_section.dart';
import 'sections/join_footer_section.dart';

void main() {
  runApp(const SaticApp());
}

class SaticApp extends StatelessWidget {
  const SaticApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SATIC — Science and Technology Innovation Club',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.paper,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.red,
          background: AppColors.paper,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  final _aboutKey = GlobalKey();
  final _workKey = GlobalKey();
  final _teamKey = GlobalKey();
  final _joinKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        onAbout: () => _scrollTo(_aboutKey),
        onWork: () => _scrollTo(_workKey),
        onTeam: () => _scrollTo(_teamKey),
        onJoin: () => _scrollTo(_joinKey),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HeroSection(
              onSeeWork: () => _scrollTo(_workKey),
              onJoin: () => _scrollTo(_joinKey),
            ),
            const MarqueeStrip(),
            Center(child: AboutSection(key: _aboutKey)),
            const TaglineBanner(),
            Center(child: WorkSection(sectionKey: _workKey)),
            Center(child: TeamSection(sectionKey: _teamKey)),
            JoinSection(sectionKey: _joinKey),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
