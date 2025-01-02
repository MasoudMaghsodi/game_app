import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purple.shade700,
        body: Center(
          child: Builder(builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomGameButton(
                      size: 80,
                      icon: Icons.home,
                      backgroundColor: Colors.orange.shade800,
                      borderColor: Colors.grey.shade200,
                      shadowColor: Colors.black54,
                      borderRadius: 13,
                      onTap: () {
                        _showSnackbar(context, "Home pressed", Colors.orange);
                      },
                    ),
                    const SizedBox(width: 16),
                    CustomGameButton(
                      size: 80,
                      icon: Icons.pause,
                      backgroundColor: Colors.purple.shade700,
                      borderColor: Colors.grey.shade200,
                      shadowColor: Colors.black54,
                      borderRadius: 50,
                      onTap: () {
                        _showSnackbar(context, "Pause pressed", Colors.purple);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                CustomGameButton(
                  size: 80,
                  text: "PLAY",
                  icon: Icons.play_arrow,
                  backgroundColor: Colors.blueAccent.shade700,
                  borderColor: Colors.grey.shade300,
                  shadowColor: Colors.black54,
                  borderRadius: 13,
                  onTap: () {
                    _showSnackbar(context, "Play pressed", Colors.blue);
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  void _showSnackbar(
      BuildContext context, String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.black),
        ),
        duration: const Duration(milliseconds: 500),
        backgroundColor: backgroundColor,
      ),
    );
  }
}

class CustomGameButton extends StatefulWidget {
  final String? text;
  final IconData? icon;
  final Color backgroundColor;
  final Color borderColor;
  final Color shadowColor;
  final double borderRadius;
  final double size;
  final VoidCallback onTap;

  const CustomGameButton({
    super.key,
    this.text,
    this.icon,
    required this.backgroundColor,
    required this.borderColor,
    required this.shadowColor,
    this.borderRadius = 8,
    required this.size,
    required this.onTap,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomGameButtonState createState() => _CustomGameButtonState();
}

class _CustomGameButtonState extends State<CustomGameButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      child: Stack(
        children: [
          _buildOuterShadow(),
          _buildButtonContent(),
        ],
      ),
    );
  }

  Widget _buildOuterShadow() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
      height: widget.size,
      width: widget.text != null ? widget.size * 2.5 : widget.size,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade100,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        boxShadow: _isPressed
            ? []
            : [
                BoxShadow(
                  color: widget.shadowColor.withValues(alpha: 0.6),
                  offset: const Offset(2, 3),
                  blurRadius: 5,
                ),
              ],
      ),
    );
  }

  Widget _buildButtonContent() {
    return Positioned.fill(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        margin: const EdgeInsets.all(4.5),
        decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            boxShadow: _isPressed
                ? []
                : [
                    BoxShadow(
                      color: widget.shadowColor.withValues(alpha: 0.6),
                      offset: const Offset(1, 2),
                      blurRadius: 5,
                    ),
                  ],
            border: _isPressed
                ? null
                : Border.all(
                    color: Colors.black38,
                    width: 1.5,
                    style: BorderStyle.solid,
                  )),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.text != null)
                Text(
                  widget.text!,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: widget.size / 4,
                    shadows: _isPressed
                        ? []
                        : [
                            BoxShadow(
                              color: widget.shadowColor.withValues(alpha: 0.6),
                              offset: const Offset(2, 2),
                              blurRadius: 4,
                            ),
                          ],
                  ),
                ),
              if (widget.text != null && widget.icon != null)
                const SizedBox(width: 8),
              if (widget.icon != null)
                Icon(
                  widget.icon,
                  color: Colors.white,
                  size: widget.text != null ? widget.size / 3 : widget.size / 2,
                  shadows: _isPressed
                      ? []
                      : [
                          BoxShadow(
                            color: widget.shadowColor.withValues(alpha: 0.6),
                            offset: const Offset(2, 2),
                            blurRadius: 4,
                          ),
                        ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
