import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key, required this.onSubmitted});
  final void Function(String) onSubmitted;

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  final TextEditingController _controller = TextEditingController();
  bool _isFocused = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.text,
      child: Focus(
        onFocusChange: (focused) {
          setState(() {
            _isFocused = focused;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: _isFocused
                    ? [
                        Theme.of(context).cardColor,
                        Theme.of(context).cardColor.withOpacity(0.95),
                      ]
                    : [
                        Theme.of(context).cardColor.withOpacity(0.95),
                        Theme.of(context).cardColor,
                      ],
              ),
            ),
            child: TextField(
              controller: _controller,
              onSubmitted: widget.onSubmitted,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).hintColor,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                enabledBorder:
                    buildOutlineInputBorder(Theme.of(context).cardColor),
                focusedBorder:
                    buildOutlineInputBorder(Theme.of(context).primaryColor),
                hintText: 'Search for books...',
                hintStyle: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: 16,
                ),
                prefixIcon: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 18,
                  color: Theme.of(context).hintColor,
                ),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_controller.text.isNotEmpty)
                      IconButton(
                        onPressed: () {
                          _controller.clear();
                          setState(() {});
                        },
                        icon: Icon(
                          FontAwesomeIcons.xmark,
                          size: 16,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.sliders,
                        size: 16,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ],
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
        ),
      ),
    ).animate().fadeIn(duration: const Duration(milliseconds: 500));
  }

  OutlineInputBorder buildOutlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 1.5,
      ),
      borderRadius: BorderRadius.circular(16),
    );
  }
}
