import 'package:flutter/material.dart';

class PaginationLoading extends StatefulWidget {
  const PaginationLoading({Key? key}) : super(key: key);

  @override
  State<PaginationLoading> createState() => _PaginationLoadingState();
}

class _PaginationLoadingState extends State<PaginationLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.primary.withOpacity(
                            0.3 +
                                (_animation.value * 0.7) *
                                    (index == 0
                                        ? 1
                                        : index == 1
                                            ? 0.5
                                            : 0.2),
                          ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 12),
              Text(
                'Loading more books...',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
