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
          child: Builder(
            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // دکمه خانه
                      CustomGameButton(
                        size: 80,
                        icon: Icons.home,
                        backgroundColor: Colors.orange.shade800,
                        borderColor: Colors.grey.shade200,
                        shadowColor: Colors.black54,
                        borderRadius: 13,
                        onTap: () {
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
                      // دکمه توقف
                      CustomGameButton(
                        size: 80,
                        icon: Icons.pause,
                        backgroundColor: Colors.purple.shade700,
                        borderColor: Colors.grey.shade200,
                        shadowColor: Colors.black54,
                        borderRadius: 50,
                        onTap: () {
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
                  // دکمه پخش
                  CustomGameButton(
                    size: 80,
                    text: "PLAY",
                    icon: Icons.play_arrow,
                    backgroundColor: Colors.blueAccent.shade700,
                    borderColor: Colors.grey.shade300,
                    shadowColor: Colors.black54,
                    borderRadius: 13,
                    onTap: () {
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
            },
          ),
        ),
      ),
    );
  }
}

// ویجت قابل سفارشی‌سازی برای دکمه بازی
class CustomGameButton extends StatefulWidget {
  final String? text; // متن دکمه (در صورت وجود)
  final IconData? icon; // آیکون دکمه
  final Color backgroundColor; // رنگ پس‌زمینه
  final Color borderColor; // رنگ مرز
  final Color shadowColor; // رنگ سایه
  final double borderRadius; // شعاع گوشه‌ها
  final double size; // اندازه دکمه
  final VoidCallback onTap; // تابع فراخوانی هنگام لمس

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
  bool _isPressed = false; // وضعیت فشرده بودن دکمه

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100), // مدت زمان انیمیشن
        curve: Curves.easeInOut, // منحنی انیمیشن
        height: widget.size, // ارتفاع دکمه
        width:
            widget.text != null ? widget.size * 2.5 : widget.size, // عرض دکمه
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          // افکت گرادیانت برای ایجاد حالت سه‌بعدی
          gradient: LinearGradient(
            colors: _isPressed
                ? [
                    widget.backgroundColor,
                    widget.backgroundColor,
                  ]
                : [
                    Colors.white.withValues(alpha: 0.3), // نوار روشن در بالا
                    widget.backgroundColor,
                  ],
            stops: [0.0, 0.35], // نسبت تقسیم گرادیانت
            begin: Alignment.topCenter, // شروع از بالا
            end: Alignment.center, // پایان در وسط
          ),
          border: Border.all(color: widget.borderColor, width: 6), // مرز دکمه
          borderRadius:
              BorderRadius.circular(widget.borderRadius), // گردی گوشه‌ها
          boxShadow: _isPressed
              ? []
              : [
                  // سایه برای حالت غیر فشرده
                  BoxShadow(
                    color: widget.shadowColor.withValues(alpha: 0.6),
                    offset: const Offset(0, 6),
                    blurRadius: 12,
                  ),
                ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // نمایش متن دکمه در صورت وجود
              if (widget.text != null)
                Text(
                  widget.text!,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: widget.size / 4, // اندازه متن
                    shadows: _isPressed
                        ? []
                        : [
                            // سایه متن برای حالت سه‌بعدی
                            BoxShadow(
                              color: widget.shadowColor.withValues(alpha: 0.6),
                              offset: const Offset(2, 2),
                              blurRadius: 4,
                            ),
                          ],
                  ),
                ),
              if (widget.text != null && widget.icon != null)
                const SizedBox(width: 8), // فاصله بین متن و آیکون
              if (widget.icon != null)
                Icon(
                  widget.icon,
                  color: Colors.white,
                  size: widget.text != null ? widget.size / 3 : widget.size / 2,
                  shadows: _isPressed
                      ? []
                      : [
                          // سایه آیکون برای حالت سه‌بعدی
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
