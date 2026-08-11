import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShellBody extends StatefulWidget {
  final Widget child;

  const ShellBody({super.key, required this.child});

  @override
  State<ShellBody> createState() => _ShellBodyState();
}

class _ShellBodyState extends State<ShellBody>
    with SingleTickerProviderStateMixin {
  static const _duration = Duration(milliseconds: 950);
  static String? _lastLocation;

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: _duration,
    value: 1,
  );

  late final Animation<double> _opacity = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOutCubic,
  );

  GoRouter? _router;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final router = GoRouter.of(context);
    if (!identical(_router, router)) {
      _router?.routerDelegate.removeListener(_onRouteChanged);
      _router = router;
      _router!.routerDelegate.addListener(_onRouteChanged);
    }
    _syncLocation();
  }

  void _onRouteChanged() => _syncLocation();

  void _syncLocation() {
    final location = GoRouterState.of(context).matchedLocation;
    if (_lastLocation == location) {
      return;
    }

    final shouldAnimate = _lastLocation != null;
    _lastLocation = location;
    if (shouldAnimate) {
      _play();
    }
  }

  void _play() {
    _controller.stop();
    _controller.value = 0;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _router?.routerDelegate.removeListener(_onRouteChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _opacity, child: widget.child);
  }
}
