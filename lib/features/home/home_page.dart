import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/preferences.dart';
import '../../design/components.dart';
import '../../design/theme.dart';
import '../demo/demo_section.dart';
import 'sections.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.tag, required this.preferences, this.section = ''});
  final String tag;
  final SitePreferences preferences;
  final String section;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scroll = ScrollController();
  final anchors = {
    for (final section in ['demo', 'features', 'hosting', 'faq']) section: GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    scheduleScroll(initial: true);
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.section != widget.section) scheduleScroll();
  }

  @override
  void dispose() {
    scroll.dispose();
    super.dispose();
  }

  /// Scrolls to the section in the URL fragment.
  ///
  /// A direct link (`/en#hosting`) jumps instead of animating, then re-aligns a few times
  /// while web fonts and images settle, as long as the reader has not scrolled meanwhile.
  void scheduleScroll({bool initial = false}) => WidgetsBinding.instance.addPostFrameCallback((_) {
    if (!mounted) return;
    final target = anchors[widget.section]?.currentContext;
    if (target != null) {
      if (!initial) {
        Scrollable.ensureVisible(target, duration: motionDuration(context, 450), alignment: .04);
        return;
      }
      Scrollable.ensureVisible(target, alignment: .04);
      var settled = scroll.offset;
      for (final delay in const [150, 500, 1200]) {
        Future<void>.delayed(Duration(milliseconds: delay), () {
          if (!mounted || !scroll.hasClients || scroll.offset != settled) return;
          final current = anchors[widget.section]?.currentContext;
          if (current == null || !current.mounted) return;
          Scrollable.ensureVisible(current, alignment: .04);
          settled = scroll.offset;
        });
      }
    } else if (widget.section.isEmpty && scroll.hasClients && !initial) {
      scroll.animateTo(0, duration: motionDuration(context, 300), curve: Curves.easeOutCubic);
    }
  });

  void goSection(String section) {
    context.go(Uri(path: '/${widget.tag}', fragment: section.isEmpty ? null : section).toString());
    if (widget.section == section) scheduleScroll();
  }

  Future<void> pickLanguage() async {
    var query = '';
    final selected = await showDialog<String>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, update) {
          final entries = languageNames.entries
              .where((e) => '${e.key} ${e.value}'.toLowerCase().contains(query.toLowerCase()))
              .toList();
          return AlertDialog(
            title: Text(context.l.languageLabel),
            content: SizedBox(
              width: 360,
              height: MediaQuery.sizeOf(context).height.clamp(200, 480) * .8,
              child: Column(
                children: [
                  TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search_rounded),
                      labelText: context.l.languageLabel,
                    ),
                    onChanged: (value) => update(() => query = value),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ListView.builder(
                      itemCount: entries.length,
                      itemBuilder: (context, index) {
                        final entry = entries[index];
                        return ListTile(
                          title: Text(entry.value),
                          subtitle: Text(entry.key),
                          trailing: entry.key == widget.tag
                              ? Icon(Icons.check_rounded, color: context.c.primary)
                              : null,
                          onTap: () => Navigator.pop(context, entry.key),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: Text(context.l.cancel)),
            ],
          );
        },
      ),
    );
    if (selected != null && mounted) {
      unawaited(widget.preferences.setLanguage(selected));
      context.go(
        Uri(
          path: '/$selected',
          fragment: widget.section.isEmpty ? null : widget.section,
        ).toString(),
      );
    }
  }

  void menu() => showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    builder: (context) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final (section, label, icon) in [
              ('features', context.l.navFeatures, Icons.widgets_outlined),
              ('demo', context.l.navDemo, Icons.touch_app_outlined),
              ('hosting', context.l.navHosting, Icons.dns_outlined),
              ('faq', context.l.navFaq, Icons.help_outline_rounded),
            ])
              ListTile(
                leading: Icon(icon),
                title: Text(label),
                onTap: () {
                  Navigator.pop(context);
                  goSection(section);
                },
              ),
            const ExternalButton(label: 'GitHub', url: sourceUrl, icon: Icons.code_rounded),
          ],
        ),
      ),
    ),
  );

  Widget header() => PageWidth(
    child: SizedBox(
      height: 90,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final wide = constraints.maxWidth >= 1000;
          return Row(
            children: [
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Semantics(
                    button: true,
                    label: context.l.backHome,
                    child: InkWell(
                      onTap: () => goSection(''),
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Brand(small: constraints.maxWidth < 400),
                      ),
                    ),
                  ),
                ),
              ),
              if (wide) ...[
                TextButton(
                  onPressed: () => goSection('features'),
                  child: Text(context.l.navFeatures),
                ),
                TextButton(onPressed: () => goSection('demo'), child: Text(context.l.navDemo)),
                TextButton(
                  onPressed: () => goSection('hosting'),
                  child: Text(context.l.navHosting),
                ),
                TextButton(onPressed: () => goSection('faq'), child: Text(context.l.navFaq)),
                const SizedBox(width: 18),
              ],
              IconButton(
                key: const ValueKey('language-picker'),
                tooltip: '${context.l.languageLabel}: ${languageNames[widget.tag]}',
                onPressed: pickLanguage,
                icon: const Icon(Icons.language_rounded, size: 21),
              ),
              PopupMenuButton<ThemeMode>(
                key: const ValueKey('theme-picker'),
                tooltip: context.l.themeLabel,
                initialValue: widget.preferences.themeMode,
                onSelected: widget.preferences.setTheme,
                icon: Icon(
                  context.isDark ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
                  size: 21,
                ),
                itemBuilder: (context) => [
                  for (final (mode, label, icon) in [
                    (ThemeMode.system, context.l.themeSystem, Icons.brightness_auto_outlined),
                    (ThemeMode.light, context.l.themeLight, Icons.light_mode_outlined),
                    (ThemeMode.dark, context.l.themeDark, Icons.dark_mode_outlined),
                  ])
                    PopupMenuItem(
                      value: mode,
                      child: Row(
                        children: [
                          Icon(icon, size: 18),
                          const SizedBox(width: 12),
                          Flexible(child: Text(label)),
                          if (widget.preferences.themeMode == mode) ...[
                            const SizedBox(width: 12),
                            const Icon(Icons.check_rounded, size: 17),
                          ],
                        ],
                      ),
                    ),
                ],
              ),
              if (wide)
                const ExternalButton(label: 'GitHub', url: sourceUrl, icon: Icons.code_rounded)
              else
                IconButton(
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                  onPressed: menu,
                  icon: const Icon(Icons.menu_rounded, size: 23),
                ),
            ],
          );
        },
      ),
    ),
  );

  Widget hero() => LayoutBuilder(
    builder: (context, constraints) {
      final wide = constraints.maxWidth >= 900;
      final cjk = ['zh', 'ja', 'ko'].contains(Localizations.localeOf(context).languageCode);
      final title = Text(
        context.l.heroTitle,
        style: TextStyle(
          fontSize: wide
              ? 76
              : cjk
              ? 61
              : 49,
          height: 1.12,
          letterSpacing: cjk ? -2 : -3.3,
          fontWeight: FontWeight.w800,
        ),
      );
      final copy = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Eyebrow(context.l.heroEyebrow, filled: true),
          const SizedBox(height: 30),
          Semantics(
            header: true,
            // CJK lines have no spaces to wrap at, so keep each authored line whole and
            // shrink it to fit instead of breaking mid-phrase.
            child: cjk
                ? FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: AlignmentDirectional.centerStart,
                    child: title,
                  )
                : title,
          ),
          const SizedBox(height: 27),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 530),
            child: Text(
              context.l.heroBody,
              style: TextStyle(
                fontSize: wide ? 18 : 16,
                height: 1.8,
                color: context.c.onSurfaceVariant,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              FilledButton.icon(
                onPressed: () => goSection('demo'),
                label: Text(context.l.tryDemo),
                icon: const Icon(Icons.arrow_forward_rounded, size: 19),
                iconAlignment: IconAlignment.end,
              ),
              TextButton(
                onPressed: () => goSection('hosting'),
                style: TextButton.styleFrom(
                  backgroundColor: context.c.surfaceContainerHigh,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  minimumSize: const Size(48, 54),
                ),
                child: Text(context.l.selfHost),
              ),
            ],
          ),
          const SizedBox(height: 23),
          Row(
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(color: context.c.primary, shape: BoxShape.circle),
              ),
              const SizedBox(width: 9),
              Expanded(
                child: Text(
                  context.l.development,
                  style: TextStyle(fontSize: 11, color: context.c.onSurfaceVariant),
                ),
              ),
            ],
          ),
        ],
      );
      final visual = Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            left: -24,
            right: -40,
            top: -58,
            bottom: -30,
            child: ExcludeSemantics(
              child: CustomPaint(
                painter: BananaArc(
                  context.isDark ? const Color(0xFF51431E) : const Color(0xFFF2D477),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 18, bottom: 14),
                child: Text(
                  context.l.demoNotice,
                  style: TextStyle(fontSize: 11, color: context.c.onSurfaceVariant),
                ),
              ),
              const BalancePreview(hero: true),
            ],
          ),
        ],
      );
      return Padding(
        padding: EdgeInsets.only(top: wide ? 72 : 32, bottom: wide ? 76 : 45),
        child: wide
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 6, child: copy),
                  const SizedBox(width: 55),
                  Expanded(flex: 5, child: visual),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [copy, const SizedBox(height: 64), visual],
              ),
      );
    },
  );

  Widget trust() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 23),
    decoration: BoxDecoration(
      color: context.c.surfaceContainer,
      borderRadius: BorderRadius.circular(24),
    ),
    child: LayoutBuilder(
      builder: (context, constraints) => Wrap(
        spacing: 12,
        runSpacing: 22,
        children:
            [
                  (Icons.call_split_rounded, context.l.trustSplit),
                  (Icons.language_rounded, context.l.trustLanguages),
                  (Icons.code_rounded, context.l.trustOpen),
                  (Icons.dns_outlined, context.l.trustServer),
                ]
                .map(
                  (entry) => SizedBox(
                    width:
                        (constraints.maxWidth - (constraints.maxWidth > 800 ? 36 : 12)) /
                        (constraints.maxWidth > 800 ? 4 : 2),
                    child: Row(
                      children: [
                        Icon(entry.$1, size: 18, color: context.c.primary),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            entry.$2,
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Column(
      children: [
        header(),
        Expanded(
          child: SelectionArea(
            child: SingleChildScrollView(
              controller: scroll,
              child: Column(
                children: [
                  PageWidth(
                    child: Column(
                      children: [
                        hero(),
                        trust(),
                        SizedBox(height: MediaQuery.sizeOf(context).width < 600 ? 80 : 118),
                        const DemoSection(key: ValueKey('demo-section'))
                            .withAnchor(anchors['demo']!),
                        const SizedBox(height: 110),
                        const BenefitsSection().withAnchor(anchors['features']!),
                        const SizedBox(height: 110),
                        const TravelSection(),
                        const SizedBox(height: 95),
                        const ExtraFeatures(),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                  const HostingSection().withAnchor(anchors['hosting']!),
                  PageWidth(
                    child: Column(
                      children: [
                        const SizedBox(height: 100),
                        const FaqSection().withAnchor(anchors['faq']!),
                        const SizedBox(height: 100),
                        const EndSection(),
                        const SizedBox(height: 60),
                        const SiteFooter(),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

extension on Widget {
  Widget withAnchor(GlobalKey anchor) => SizedBox(key: anchor, child: this);
}
