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
                    CustomButton(
                      text: null,
                      icon: Icons.home,
                      backgroundColor: Colors.orange,
                      borderColor: Colors.grey,
                      textColor: Colors.white,
                      borderRadius: 8.0,
                      onPressed: () =>
                          ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Home pressed",
                            style: TextStyle(color: Colors.black),
                          ),
                          duration: Duration(milliseconds: 500),
                          backgroundColor: Colors.orange,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    CustomButton(
                      text: null,
                      icon: Icons.pause,
                      backgroundColor: Colors.purple,
                      borderColor: Colors.grey,
                      textColor: Colors.white,
                      borderRadius: 50.0,
                      onPressed: () =>
                          ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Pause pressed",
                            style: TextStyle(color: Colors.black),
                          ),
                          duration: Duration(milliseconds: 500),
                          backgroundColor: Colors.purple,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                CustomButton(
                  text: "PLAY",
                  icon: Icons.play_arrow,
                  backgroundColor: Colors.blue,
                  borderColor: Colors.grey,
                  textColor: Colors.white,
                  borderRadius: 12.0,
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Play pressed",
                        style: TextStyle(color: Colors.black),
                      ),
                      duration: Duration(milliseconds: 500),
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String? text; // متن دکمه
  final IconData? icon; // آیکون دکمه
  final Color backgroundColor; // رنگ پس‌زمینه دکمه
  final Color borderColor; // رنگ حاشیه اطراف دکمه
  final Color textColor; //  رنگ متن داخل دکمه
  final double borderRadius; // شعاع گوشه‌ها
  final VoidCallback onPressed; // عملکرد دکمه

  const CustomButton({
    super.key,
    this.text,
    this.icon,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    this.borderRadius = 8.0,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(color: borderColor, width: 2),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (text != null)
            Text(
              text!,
              style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
            ),
          if (icon != null && text != null) const SizedBox(width: 5),
          if (icon != null) Icon(icon, color: textColor),
        ],
      ),
    );
  }
}
