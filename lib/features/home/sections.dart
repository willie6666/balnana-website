import 'package:material_ui/material_ui.dart';

import '../../core/preferences.dart';
import '../../design/components.dart';
import '../../design/theme.dart';

class BenefitsSection extends StatelessWidget {
  const BenefitsSection({super.key});
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SectionTitle(context.l.featureTitle, eyebrow: context.l.featureLabel),
      const SizedBox(height: 36),
      LayoutBuilder(
        builder: (context, constraints) {
          Widget tile(IconData icon, String title, String body, bool warm) => Panel(
            color: warm ? context.c.primaryContainer : null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, size: 34, color: context.c.primary),
                const SizedBox(height: 28),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -.7,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  body,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.8,
                    color: warm ? context.c.onPrimaryContainer : context.c.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 30),
                if (warm) ...[
                  Row(
                    children: List.generate(
                      4,
                      (i) => Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(end: 5),
                          child: Container(
                            height: 15,
                            decoration: BoxDecoration(
                              color: memberColors[i],
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Wrap(
                    spacing: 18,
                    runSpacing: 8,
                    children: [context.l.splitEqual, context.l.splitShares]
                        .map(
                          (t) => Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.check_rounded, size: 16, color: context.c.primary),
                              const SizedBox(width: 6),
                              Flexible(child: Text(t, style: const TextStyle(fontSize: 13))),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ] else ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const PersonAvatar(2, radius: 25),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Icon(Icons.arrow_forward_rounded, size: 30),
                      ),
                      const PersonAvatar(0, radius: 25),
                    ],
                  ),
                  const SizedBox(height: 34),
                ],
              ],
            ),
          );
          final a = tile(
            Icons.call_split_rounded,
            context.l.featureSplitTitle,
            context.l.featureSplitBody,
            true,
          );
          final b = tile(
            Icons.swap_horiz_rounded,
            context.l.featureSettleTitle,
            context.l.featureSettleBody,
            false,
          );
          return constraints.maxWidth >= 750
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 6, child: a),
                    const SizedBox(width: 24),
                    Expanded(flex: 5, child: b),
                  ],
                )
              : Column(children: [a, const SizedBox(height: 20), b]);
        },
      ),
    ],
  );
}

class TravelSection extends StatefulWidget {
  const TravelSection({super.key});
  @override
  State<TravelSection> createState() => _TravelSectionState();
}

class _TravelSectionState extends State<TravelSection> {
  int selected = 0;
  static const files = ['expenses', 'foreign', 'statistics'];

  void open(int index) => showDialog<void>(
    context: context,
    builder: (context) => Dialog(
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: 520,
        height: MediaQuery.sizeOf(context).height * .88,
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: IconButton(
                tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close_rounded),
              ),
            ),
            Expanded(
              child: InteractiveViewer(
                minScale: .7,
                maxScale: 3,
                child: Image.asset('assets/screenshots/${files[index]}.png', fit: BoxFit.contain),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Text(context.l.screenshotsNote, style: const TextStyle(fontSize: 11)),
            ),
          ],
        ),
      ),
    ),
  );

  Widget screenshot(int index, String label) => Column(
    children: [
      Semantics(
        button: true,
        label: '${context.l.screenshotOpen}: $label',
        child: InkWell(
          onTap: () => open(index),
          borderRadius: BorderRadius.circular(28),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 278),
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: context.c.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .06),
                  blurRadius: 28,
                  offset: const Offset(0, 14),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: AspectRatio(
                aspectRatio: 1344 / 2761,
                child: Image.asset(
                  'assets/screenshots/${files[index]}.png',
                  fit: BoxFit.cover,
                  excludeFromSemantics: true,
                  filterQuality: FilterQuality.medium,
                ),
              ),
            ),
          ),
        ),
      ),
      const SizedBox(height: 22),
      Text(label, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final labels = [
      context.l.screenshotExpenses,
      context.l.screenshotForeign,
      context.l.screenshotStats,
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          context.l.travelTitle,
          eyebrow: context.l.travelLabel,
          subtitle: context.l.travelBody,
        ),
        const SizedBox(height: 48),
        LayoutBuilder(
          builder: (context, constraints) => constraints.maxWidth >= 780
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    3,
                    (i) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: screenshot(i, labels[i]),
                      ),
                    ),
                  ),
                )
              : Column(
                  children: [
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: List.generate(
                        3,
                        (i) => ChoiceChip(
                          label: Text(labels[i]),
                          selected: selected == i,
                          onSelected: (_) => setState(() => selected = i),
                          showCheckmark: false,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Center(child: screenshot(selected, labels[selected])),
                  ],
                ),
        ),
        const SizedBox(height: 30),
        Center(
          child: Text(
            context.l.screenshotsNote,
            style: TextStyle(fontSize: 11, color: context.c.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class ExtraFeatures extends StatelessWidget {
  const ExtraFeatures({super.key});
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        context.l.extraTitle,
        style: const TextStyle(fontSize: 29, fontWeight: FontWeight.w800, letterSpacing: -1),
      ),
      const SizedBox(height: 38),
      LayoutBuilder(
        builder: (context, constraints) {
          final columns = constraints.maxWidth >= 980
              ? 4
              : constraints.maxWidth >= 580
              ? 2
              : 1;
          return Wrap(
            spacing: 28,
            runSpacing: 35,
            children:
                [
                      (
                        Icons.event_repeat_rounded,
                        context.l.recurringTitle,
                        context.l.recurringBody,
                      ),
                      (
                        Icons.receipt_long_outlined,
                        context.l.receiptsTitle,
                        context.l.receiptsBody,
                      ),
                      (Icons.sync_rounded, context.l.liveTitle, context.l.liveBody),
                      (Icons.ios_share_rounded, context.l.exportTitle, context.l.exportBody),
                    ]
                    .map(
                      (item) => SizedBox(
                        width: (constraints.maxWidth - 28 * (columns - 1)) / columns,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                color: context.c.surfaceContainer,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Icon(item.$1, size: 23, color: context.c.primary),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              item.$2,
                              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              item.$3,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.8,
                                color: context.c.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
          );
        },
      ),
    ],
  );
}

class HostingSection extends StatelessWidget {
  const HostingSection({super.key});
  @override
  Widget build(BuildContext context) {
    // The band is always dark; on a dark page it sits a step deeper and gets hairlines so
    // it still reads as its own section.
    final onDarkPage = context.isDark;
    return Theme(
      data: siteTheme(Brightness.dark),
      child: Builder(
        builder: (context) => DecoratedBox(
          decoration: BoxDecoration(
            color: onDarkPage ? const Color(0xFF0E0F0C) : context.c.surface,
            border: onDarkPage
                ? Border.symmetric(horizontal: BorderSide(color: context.c.outlineVariant))
                : null,
          ),
          child: PageWidth(
            vertical: 76,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final copy = Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionTitle(
                      context.l.hostingTitle,
                      eyebrow: context.l.hostingLabel,
                      subtitle: context.l.hostingBody,
                    ),
                    const SizedBox(height: 24),
                    ExternalButton(label: context.l.hostingLink, url: setupUrl, filled: true),
                  ],
                );
                final diagram = Panel(
                  color: context.c.surfaceContainer,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          for (final color in [
                            const Color(0xFFF07C2E),
                            banana,
                            const Color(0xFF3C9D6B),
                          ])
                            Padding(
                              padding: const EdgeInsetsDirectional.only(end: 7),
                              child: CircleAvatar(radius: 4, backgroundColor: color),
                            ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const Center(child: Brand()),
                      const SizedBox(height: 25),
                      Center(
                        child: Icon(Icons.swap_vert_rounded, color: context.c.primary, size: 30),
                      ),
                      const SizedBox(height: 14),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                          decoration: BoxDecoration(
                            color: context.c.surfaceContainerHigh,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.dns_outlined, size: 22),
                              SizedBox(width: 12),
                              Flexible(child: Text('PostgreSQL')),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Divider(),
                      const SizedBox(height: 18),
                      Text(
                        context.l.hostingModeLink,
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.8,
                          color: context.c.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        context.l.hostingModeAccounts,
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.8,
                          color: context.c.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                );
                return constraints.maxWidth >= 850
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(flex: 6, child: copy),
                          const SizedBox(width: 80),
                          Expanded(flex: 5, child: diagram),
                        ],
                      )
                    : Column(children: [copy, const SizedBox(height: 45), diagram]);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class FaqSection extends StatelessWidget {
  const FaqSection({super.key});
  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final title = SectionTitle(context.l.faqTitle);
      final questions = Column(
        children: [
          for (final pair in [
            (context.l.faqAccountQ, context.l.faqAccountA),
            (context.l.faqOfflineQ, context.l.faqOfflineA),
            (context.l.faqCurrencyQ, context.l.faqCurrencyA),
            (context.l.faqPlatformQ, context.l.faqPlatformA),
            (context.l.faqCostQ, context.l.faqCostA),
          ])
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: context.c.outlineVariant)),
              ),
              child: ExpansionTile(
                tilePadding: const EdgeInsets.symmetric(vertical: 10),
                childrenPadding: const EdgeInsets.only(bottom: 24),
                shape: const Border(),
                collapsedShape: const Border(),
                title: Text(
                  pair.$1,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      pair.$2,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.9,
                        color: context.c.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      );
      return constraints.maxWidth >= 850
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 4, child: title),
                const SizedBox(width: 80),
                Expanded(flex: 6, child: questions),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [title, const SizedBox(height: 30), questions],
            );
    },
  );
}

class EndSection extends StatelessWidget {
  const EndSection({super.key});
  @override
  Widget build(BuildContext context) => Panel(
    color: context.c.primaryContainer,
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 56),
    child: Column(
      children: [
        const BrandMark(size: 56),
        const SizedBox(height: 26),
        Text(
          context.l.endTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: context.c.onPrimaryContainer,
            fontSize: MediaQuery.sizeOf(context).width < 600 ? 36 : 55,
            fontWeight: FontWeight.w800,
            height: 1.2,
            letterSpacing: -1.8,
          ),
        ),
        const SizedBox(height: 22),
        Text(
          context.l.endBody,
          textAlign: TextAlign.center,
          style: TextStyle(color: context.c.onPrimaryContainer, height: 1.8, fontSize: 16),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: [
            ExternalButton(label: context.l.selfHost, url: setupUrl, filled: true),
            ExternalButton(label: context.l.github, url: sourceUrl, icon: Icons.code_rounded),
          ],
        ),
      ],
    ),
  );
}

class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key});
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Wrap(
        spacing: 26,
        runSpacing: 24,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          const Brand(small: true),
          ExternalButton(label: context.l.github, url: sourceUrl, icon: Icons.code_rounded),
          ExternalButton(label: context.l.reportIssue, url: '$sourceUrl/issues'),
          const ExternalButton(label: 'AGPL-3.0', url: '$sourceUrl/blob/main/LICENSE'),
        ],
      ),
      const SizedBox(height: 22),
      Text(context.l.footerNote, style: TextStyle(color: context.c.onSurfaceVariant, fontSize: 12)),
    ],
  );
}
