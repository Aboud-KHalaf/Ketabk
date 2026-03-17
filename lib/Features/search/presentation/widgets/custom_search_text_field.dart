import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/utils/styles.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField(
      {super.key, required this.onSubmitted, this.initialValue});
  final void Function(String searchText, String orderBy) onSubmitted;
  final String? initialValue;

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  late final TextEditingController _controller;
  bool _isFocused = false;
  String _currentSort = 'relevance';

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Search Options',
                style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 24),
              _FilterOptionTile(
                title: 'Most Relevant',
                icon: FontAwesomeIcons.bolt,
                isSelected: _currentSort == 'relevance',
                onTap: () {
                  setState(() => _currentSort = 'relevance');
                  Navigator.pop(context);
                  widget.onSubmitted(_controller.text, _currentSort);
                },
              ),
              const SizedBox(height: 12),
              _FilterOptionTile(
                title: 'Newest First',
                icon: FontAwesomeIcons.clock,
                isSelected: _currentSort == 'newest',
                onTap: () {
                  setState(() => _currentSort = 'newest');
                  Navigator.pop(context);
                  widget.onSubmitted(_controller.text, _currentSort);
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

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
              onSubmitted: (value) {
                widget.onSubmitted(value, _currentSort);
              },
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
                      onPressed: _showFilterBottomSheet,
                      icon: Icon(
                        FontAwesomeIcons.sliders,
                        size: 16,
                        color: _currentSort == 'relevance'
                            ? Theme.of(context).hintColor
                            : Theme.of(context).primaryColor,
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

class _FilterOptionTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterOptionTile({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isSelected
              ? Theme.of(context).primaryColor.withOpacity(0.1)
              : Colors.transparent,
          border: Border.all(
            color: isSelected
                ? Theme.of(context).primaryColor
                : Theme.of(context).hintColor.withOpacity(0.2),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).hintColor,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: Styles.textStyle16.copyWith(
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).hintColor,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            const Spacer(),
            if (isSelected)
              Icon(
                Icons.check_circle,
                size: 20,
                color: Theme.of(context).primaryColor,
              ),
          ],
        ),
      ),
    );
  }
}
