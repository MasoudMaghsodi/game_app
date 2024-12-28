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
        backgroundColor: Colors.purpleAccent.shade700,
        body: Center(
          child: Builder(builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      text: null,
                      icon: Icons.home,
                      backgroundColor: Colors.orange,
                      gradient: LinearGradient(
                        colors: [Colors.blue.shade300, Colors.blue.shade700],
                      ),
                      textColor: Colors.white,
                      borderRadius: 8.0,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Home pressed",
                              style: TextStyle(color: Colors.black),
                            ),
                            duration: Duration(milliseconds: 500),
                            backgroundColor: Colors.orange,
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 16),
                    CustomButton(
                      text: null,
                      icon: Icons.pause,
                      backgroundColor: Colors.purple,
                      gradient: LinearGradient(
                        colors: [Colors.blue.shade300, Colors.blue.shade700],
                      ),
                      textColor: Colors.white,
                      borderRadius: 50.0,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Pause pressed",
                              style: TextStyle(color: Colors.black),
                            ),
                            duration: Duration(milliseconds: 500),
                            backgroundColor: Colors.purple,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                CustomButton(
                  text: "PLAY",
                  icon: Icons.play_arrow,
                  backgroundColor: Colors.blue,
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade300, Colors.blue.shade700],
                  ),
                  textColor: Colors.white,
                  borderRadius: 12.0,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Play pressed",
                          style: TextStyle(color: Colors.black),
                        ),
                        duration: Duration(milliseconds: 500),
                        backgroundColor: Colors.blue,
                      ),
                    );
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class CustomButton extends StatefulWidget {
  final String? text; // متن دکمه
  final IconData? icon; // آیکون دکمه
  final Color backgroundColor; // رنگ پس‌زمینه دکمه
  final Gradient gradient; // گرادینت برای سایه اطراف دکمه
  final Color textColor; // رنگ متن داخل دکمه
  final double borderRadius; // شعاع گوشه‌ها
  final VoidCallback onPressed; // عملکرد دکمه

  const CustomButton({
    super.key,
    this.text,
    this.icon,
    required this.backgroundColor,
    required this.gradient,
    required this.textColor,
    this.borderRadius = 8.0,
    required this.onPressed,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          boxShadow: [
            if (!_isPressed)
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 5,
                spreadRadius: 2,
              ),
          ],
          gradient: _isPressed ? null : widget.gradient,
        ),
        child: Transform.translate(
          offset: _isPressed ? const Offset(0.1, 0.2) : const Offset(0, 0),
          child: Container(
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.text != null)
                  Text(
                    widget.text!,
                    style: TextStyle(
                      color: widget.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                if (widget.icon != null && widget.text != null)
                  const SizedBox(width: 5),
                if (widget.icon != null)
                  Icon(widget.icon, color: widget.textColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
