import 'package:flutter/gestures.dart';
import 'package:material_ui/material_ui.dart';

/// A scroll controller that eases mouse-wheel steps instead of jumping.
///
/// Flutter web moves a scroll view by each wheel tick's full delta at once, so a mouse
/// wheel scrolls in visible jumps. This position animates toward the accumulated target,
/// as browsers do for HTML pages. Trackpads already send fine-grained deltas and keep the
/// default behavior, as does reduced motion.
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
  double? _target;

  @override
  void pointerScroll(double delta) {
    final notificationContext = context.notificationContext;
    final reduceMotion =
        notificationContext != null &&
        (MediaQuery.maybeDisableAnimationsOf(notificationContext) ?? false);
    if (delta == 0 || controller._wheelKind == PointerDeviceKind.trackpad || reduceMotion) {
      _target = null;
      super.pointerScroll(delta);
      return;
    }
    // Ticks that arrive mid-animation add to where the last one was heading.
    final from = _target != null && activity is DrivenScrollActivity ? _target! : pixels;
    final target = (from + delta).clamp(minScrollExtent, maxScrollExtent);
    if (target == pixels) return;
    _target = target;
    animateTo(
      target,
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOutCubic,
    ).whenComplete(() {
      if (_target == target) _target = null;
    });
  }
}
