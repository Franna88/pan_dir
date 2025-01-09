import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Widget child; // The page to display after the splash screen
  final String animationPath; // Path to the Lottie animation
  final Duration duration; // Duration of the splash screen

  const SplashScreen({
    super.key,
    required this.child,
    required this.animationPath,
    this.duration = const Duration(seconds: 4),
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    // Combined scale and opacity animation
    final curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 1.2).animate(curvedAnimation);
    _opacityAnimation =
        Tween<double>(begin: 0.7, end: 1.0).animate(curvedAnimation);

    // Start pulse animation
    _controller.repeat(reverse: true);

    // Schedule splash screen removal after the duration
    Future.delayed(widget.duration, () {
      _controller.stop(); // Stop the pulse animation
      setState(() {
        _showSplash = false; // Remove the splash screen
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // The underlying main content
        widget.child,

        // The splash screen overlay
        if (_showSplash)
          Positioned.fill(
            child: Scaffold(
              body: Container(
                color: Colors.black, // Background color for the splash
                child: Center(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.scale(
                        scale:
                            _scaleAnimation.value, // Apply scale transformation
                        child: Opacity(
                          opacity: _opacityAnimation
                              .value, // Apply opacity transformation
                          child: Image.asset(
                            widget.animationPath,
                            width: 200,
                            height: 200,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
