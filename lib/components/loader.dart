import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  final double width;
  final double height;

  const Loader({super.key, required this.width, required this.height});
  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000), // Set your desired duration
    );

    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    // Repeat the animation indefinitely
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return ClipRect(
          child: Stack(
            children: [
              Positioned(
                left: (size.width * _animation.value),
                child: Container(
                  height: widget.height,
                  width: widget.width / 2,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(stops: [
                    0,
                    0.5,
                    1
                  ], colors: [
                    Colors.white,
                    Color(0xffdcdcdc),
                    Colors.white
                  ])),
                ),
              ),
              child!,
            ],
          ),
        );
      },
      child: Container(
        height: widget.height,
        width: widget.width,
        color: Colors.white38,
      ),
    );
  }
}
