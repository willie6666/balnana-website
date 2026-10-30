import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:material_ui/material_ui.dart';

/// A scroll controller that glides through mouse-wheel steps instead of jumping.
///
/// Flutter web moves a scroll view by each wheel tick's full delta at once, so a mouse
/// wheel scrolls in visible jumps. Here each tick only moves a target, and the position
/// follows it on a critically damped spring: its speed carries over from tick to tick,
/// so a spinning wheel scrolls in one continuous motion, as browsers do for HTML pages.
/// Trackpads already send fine-grained deltas and keep the default, as does reduced motion.
class SmoothWheelScrollController extends ScrollController {
  PointerDeviceKind? _wheelKind;

  /// Wrap the scroll view so the controller knows which device sent each wheel event.
  ///
  /// The listener sees the event before the scroll view's pointer-signal resolver runs.
  Widget wheelListener({required Widget child}) => Listener(
    onPointerSignal: (event) {
      if (event is PointerScrollEvent) _wheelKind = event.kind;
    },
    child: child,
  );

  @override
  ScrollPosition createScrollPosition(
    ScrollPhysics physics,
    ScrollContext context,
    ScrollPosition? oldPosition,
  ) => _SmoothWheelPosition(
    this,
    physics: physics,
    context: context,
    initialPixels: initialScrollOffset,
    keepScrollOffset: keepScrollOffset,
    oldPosition: oldPosition,
    debugLabel: debugLabel,
  );
}

class _SmoothWheelPosition extends ScrollPositionWithSingleContext {
  _SmoothWheelPosition(
    this.controller, {
    required super.physics,
    required super.context,
    super.initialPixels,
    super.keepScrollOffset,
    super.oldPosition,
    super.debugLabel,
  });

  final SmoothWheelScrollController controller;

  @override
  void pointerScroll(double delta) {
    final notificationContext = context.notificationContext;
    final reduceMotion =
        notificationContext != null &&
        (MediaQuery.maybeDisableAnimationsOf(notificationContext) ?? false);
    if (delta == 0 || controller._wheelKind == PointerDeviceKind.trackpad || reduceMotion) {
      super.pointerScroll(delta);
      return;
    }
    final current = activity;
    final from = current is _WheelGlide ? current.target : pixels;
    final target = (from + delta).clamp(minScrollExtent, maxScrollExtent);
    if (current is _WheelGlide) {
      current.target = target;
    } else if (target != pixels) {
      updateUserScrollDirection(delta > 0 ? ScrollDirection.reverse : ScrollDirection.forward);
      beginActivity(_WheelGlide(this, target: target, vsync: context.vsync));
    }
  }
}

/// Follows a moving target on a critically damped spring until it settles there.
class _WheelGlide extends ScrollActivity {
  _WheelGlide(this.position, {required this.target, required TickerProvider vsync})
    : super(position) {
    _ticker = vsync.createTicker(_tick)..start();
  }

  final _SmoothWheelPosition position;
  double target;
  late final Ticker _ticker;
  // The first tick reports zero elapsed time; count it as one frame so the glide starts at once.
  Duration _last = const Duration(microseconds: -16667);
  double _velocity = 0;

  /// Spring stiffness: settles within about a quarter second after the last tick.
  static const _omega = 26.0;

  void _tick(Duration elapsed) {
    final dt = (elapsed - _last).inMicroseconds / Duration.microsecondsPerSecond;
    _last = elapsed;
    if (dt <= 0) return;
    // Exact step of x'' = -ω²(x - target) - 2ωx', so any frame time stays stable.
    final offset = position.pixels - target;
    final decay = math.exp(-_omega * dt);
    final next = (offset + (_velocity + _omega * offset) * dt) * decay;
    _velocity = (_velocity - _omega * (_velocity + _omega * offset) * dt) * decay;
    if (next.abs() < .5 && _velocity.abs() < 20) {
      position.setPixels(target);
      position.goIdle();
      return;
    }
    final pixels = (target + next).clamp(position.minScrollExtent, position.maxScrollExtent);
    if (position.setPixels(pixels) != 0) position.goIdle();
  }

  @override
  bool get shouldIgnorePointer => false;

  @override
  bool get isScrolling => true;

  @override
  double get velocity => _velocity;

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }
}
