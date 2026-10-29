import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/link.dart';

import '../core/preferences.dart';
import 'theme.dart';

const sourceUrl = 'https://github.com/willie6666/balnana';
const setupUrl = '$sourceUrl/blob/main/docs/SELF_HOSTING.md';
const memberNames = ['Alex', 'Jamie', 'Morgan', 'Sam'];

class BrandMark extends StatelessWidget {
  const BrandMark({super.key, this.size = 42});
  final double size;
  @override
  Widget build(BuildContext context) => ExcludeSemantics(
    child: CustomPaint(size: Size.square(size), painter: _BrandPainter()),
  );
}

class _BrandPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(size.width / 72);
    canvas.drawCircle(const Offset(36, 36), 36, Paint()..color = banana);
    final paint = Paint()..color = const Color(0xFF3A2C00);
    canvas.drawArc(const Rect.fromLTWH(8.5, 15.131, 48, 48), math.pi / 2, math.pi, true, paint);
    canvas.drawArc(const Rect.fromLTWH(15.5, 9.131, 48, 48), -math.pi / 2, math.pi, true, paint);
  }

  @override
  bool shouldRepaint(_BrandPainter oldDelegate) => false;
}

class Brand extends StatelessWidget {
  const Brand({super.key, this.small = false});
  final bool small;
  @override
  Widget build(BuildContext context) => FittedBox(
    fit: BoxFit.scaleDown,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        BrandMark(size: small ? 30 : 40),
        SizedBox(width: small ? 9 : 12),
        Text(
          'balnana',
          textScaler: TextScaler.noScaling,
          style: TextStyle(
            fontSize: small ? 21 : 27,
            fontWeight: FontWeight.w800,
            letterSpacing: -1.2,
          ),
        ),
      ],
    ),
  );
}

class PageWidth extends StatelessWidget {
  const PageWidth({super.key, required this.child, this.vertical = 0});
  final Widget child;
  final double vertical;
  @override
  Widget build(BuildContext context) => Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1328),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width < 600 ? 24 : 40,
          vertical: vertical,
        ),
        child: child,
      ),
    ),
  );
}

class Eyebrow extends StatelessWidget {
  const Eyebrow(this.text, {super.key, this.filled = false});
  final String text;
  final bool filled;
  @override
  Widget build(BuildContext context) => Container(
    padding: filled ? const EdgeInsets.symmetric(horizontal: 14, vertical: 9) : EdgeInsets.zero,
    decoration: filled
        ? BoxDecoration(color: context.c.primaryContainer, borderRadius: BorderRadius.circular(40))
        : null,
    child: Text(
      text,
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w800,
        letterSpacing: 1.8,
        color: filled ? context.c.onPrimaryContainer : context.c.primary,
      ),
    ),
  );
}

class SectionTitle extends StatelessWidget {
  const SectionTitle(this.title, {super.key, this.subtitle, this.eyebrow});
  final String title;
  final String? subtitle;
  final String? eyebrow;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (eyebrow != null) ...[Eyebrow(eyebrow!), const SizedBox(height: 20)],
      Text(
        title,
        style: TextStyle(
          fontSize: MediaQuery.sizeOf(context).width < 600 ? 35 : 49,
          height: 1.18,
          fontWeight: FontWeight.w800,
          letterSpacing: -1.8,
        ),
      ),
      if (subtitle != null) ...[
        const SizedBox(height: 20),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Text(
            subtitle!,
            style: TextStyle(fontSize: 17, height: 1.75, color: context.c.onSurfaceVariant),
          ),
        ),
      ],
    ],
  );
}

class Panel extends StatelessWidget {
  const Panel({
    super.key,
    required this.child,
    this.color,
    this.padding = const EdgeInsets.all(30),
  });
  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: padding,
    decoration: BoxDecoration(
      color: color ?? context.c.surfaceContainer,
      borderRadius: BorderRadius.circular(30),
    ),
    child: child,
  );
}

class PersonAvatar extends StatelessWidget {
  const PersonAvatar(this.member, {super.key, this.radius = 19});
  final int member;
  final double radius;
  @override
  Widget build(BuildContext context) => CircleAvatar(
    radius: radius,
    backgroundColor: memberColors[member],
    child: Text(
      memberNames[member][0],
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: radius * .78),
    ),
  );
}

class ExternalButton extends StatelessWidget {
  const ExternalButton({
    super.key,
    required this.label,
    required this.url,
    this.filled = false,
    this.icon = Icons.north_east_rounded,
  });
  final String label;
  final String url;
  final bool filled;
  final IconData icon;
  @override
  Widget build(BuildContext context) => Link(
    uri: Uri.parse(url),
    target: LinkTarget.blank,
    builder: (context, follow) => filled
        ? FilledButton.icon(
            onPressed: follow,
            label: Text(label),
            icon: Icon(icon, size: 18),
            iconAlignment: IconAlignment.end,
          )
        : TextButton.icon(
            onPressed: follow,
            label: Text(label),
            icon: Icon(icon, size: 17),
            iconAlignment: IconAlignment.end,
          ),
  );
}

class BananaArc extends CustomPainter {
  BananaArc(this.color);
  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(size.width * .65, size.height * .08)
      ..cubicTo(
        size.width * 1.22,
        size.height * .24,
        size.width * .99,
        size.height * 1.03,
        size.width * .32,
        size.height * .88,
      );
    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = size.width * .16
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(BananaArc oldDelegate) => color != oldDelegate.color;
}

Duration motionDuration(BuildContext context, int milliseconds) =>
    MediaQuery.disableAnimationsOf(context) ? Duration.zero : Duration(milliseconds: milliseconds);

String scenarioName(BuildContext context, int index) => switch (index) {
  0 => context.l.scenarioTravel,
  1 => context.l.scenarioHome,
  _ => context.l.scenarioDinner,
};
