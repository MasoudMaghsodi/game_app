// code by Masoud Maghsodi
// email: magsodi333@gmail.com
// github: MasoudMaghsodi
// comment: This code is a simple example of a custom button in Flutter.
// this code comment created by ChatGPT
// if you remove extra comments and spaces, the code will be shorter and more readable.

import 'package:flutter/material.dart';

// Entry point of the Flutter application
void main() {
  runApp(const MyApp());
}

// Main application widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp is the root of the application
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the debug banner
      home: Scaffold(
        backgroundColor:
            Colors.purple.shade700, // Sets the background color of the Scaffold
        body: Center(
          // Center widget to center its child vertically and horizontally
          child: Builder(builder: (context) {
            // Builder widget to get the context
            return Column(
              mainAxisSize: MainAxisSize.min, // Minimizes the column's height
              children: [
                // Row of buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Centers the buttons horizontally
                  children: [
                    // Custom button with home icon
                    CustomGameButton(
                      size: 80, // Size of the button
                      icon: Icons.home, // Icon to display
                      backgroundColor: Colors
                          .orange.shade800, // Background color of the button
                      borderColor:
                          Colors.grey.shade200, // Border color of the button
                      shadowColor: Colors.black54, // Shadow color of the button
                      borderRadius: 13, // Border radius of the button
                      onTap: () {
                        _showSnackbar(context, "Home pressed",
                            Colors.orange); // Action on tap
                      },
                    ),
                    const SizedBox(width: 16), // Spacing between buttons
                    // Custom button with pause icon
                    CustomGameButton(
                      size: 80, // Size of the button
                      icon: Icons.pause, // Icon to display
                      backgroundColor: Colors
                          .purple.shade700, // Background color of the button
                      borderColor:
                          Colors.grey.shade200, // Border color of the button
                      shadowColor: Colors.black54, // Shadow color of the button
                      borderRadius: 50, // Border radius of the button
                      onTap: () {
                        _showSnackbar(context, "Pause pressed",
                            Colors.purple); // Action on tap
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16), // Spacing between rows
                // Custom button with play icon and text
                CustomGameButton(
                  size: 80, // Size of the button
                  text: "PLAY", // Text to display
                  icon: Icons.play_arrow, // Icon to display
                  backgroundColor: Colors
                      .blueAccent.shade700, // Background color of the button
                  borderColor:
                      Colors.grey.shade300, // Border color of the button
                  shadowColor: Colors.black54, // Shadow color of the button
                  borderRadius: 13, // Border radius of the button
                  onTap: () {
                    _showSnackbar(
                        context, "Play pressed", Colors.blue); // Action on tap
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  // Function to show a snackbar with a message
  void _showSnackbar(
      BuildContext context, String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.black), // Text color
        ),
        duration: const Duration(
            milliseconds: 500), // Duration for which the snackbar is displayed
        backgroundColor: backgroundColor, // Background color of the snackbar
      ),
    );
  }
}

// Custom button widget
class CustomGameButton extends StatefulWidget {
  final String? text; // Optional text to display on the button
  final IconData? icon; // Optional icon to display on the button
  final Color backgroundColor; // Background color of the button
  final Color borderColor; // Border color of the button
  final Color shadowColor; // Shadow color of the button
  final double borderRadius; // Border radius of the button
  final double size; // Size of the button
  final VoidCallback onTap; // Callback function to handle tap events

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
  bool _isPressed = false; // State to track if the button is pressed

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap, // Handles tap on the button
      onTapDown: (_) =>
          setState(() => _isPressed = true), // Sets the button state as pressed
      onTapUp: (_) => setState(
          () => _isPressed = false), // Resets the button state on tap up
      onTapCancel: () => setState(
          () => _isPressed = false), // Resets the button state on tap cancel
      child: Stack(
        children: [
          // Outer shadow of the button
          _buildOuterShadow(),
          // Content of the button
          _buildButtonContent(),
        ],
      ),
    );
  }

  // Builds the outer shadow of the button
  Widget _buildOuterShadow() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100), // Animation duration
      curve: Curves.easeInOut, // Animation curve
      height: widget.size, // Height of the container
      width: widget.text != null
          ? widget.size * 2.5
          : widget.size, // Width of the container
      decoration: BoxDecoration(
        color: widget.borderColor, // Color of the container
        borderRadius: BorderRadius.circular(
            widget.borderRadius), // Border radius of the container
        boxShadow: _isPressed
            ? [] // No shadow when pressed
            : [
                BoxShadow(
                  color: widget.shadowColor
                      .withValues(alpha: 0.6), // Shadow color with opacity
                  offset: const Offset(2, 3), // Shadow offset
                  blurRadius: 5, // Shadow blur radius
                ),
              ],
      ),
    );
  }

  // Builds the content of the button
  Widget _buildButtonContent() {
    return Positioned.fill(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100), // Animation duration
        margin: const EdgeInsets.all(4.5), // Margin inside the container
        decoration: BoxDecoration(
          color: widget.backgroundColor, // Background color of the button
          borderRadius: BorderRadius.circular(
              widget.borderRadius), // Border radius of the button
          boxShadow: _isPressed
              ? [] // No shadow when pressed
              : [
                  BoxShadow(
                    color: widget.shadowColor
                        .withValues(alpha: 0.6), // Shadow color with opacity
                    offset: const Offset(1, 2), // Shadow offset
                    blurRadius: 5, // Shadow blur radius
                  ),
                ],
          border: _isPressed
              ? null // No border when pressed
              : Border.all(
                  color: Colors.black38, // Border color
                  width: 1.5, // Border width
                  style: BorderStyle.solid, // Border style
                ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centers the row horizontally
            mainAxisSize: MainAxisSize.min, // Minimizes the row's size
            children: [
              // Displays text if provided
              if (widget.text != null)
                Text(
                  widget.text!,
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontWeight: FontWeight.bold, // Text weight
                    fontSize: widget.size / 4, // Text size
                    shadows: _isPressed
                        ? [] // No shadow when pressed
                        : [
                            BoxShadow(
                              color: widget.shadowColor.withValues(
                                  alpha: 0.6), // Shadow color with opacity
                              offset: const Offset(2, 2), // Shadow offset
                              blurRadius: 4, // Shadow blur radius
                            ),
                          ],
                  ),
                ),
              // Spacing between text and icon
              if (widget.text != null && widget.icon != null)
                const SizedBox(width: 8),
              // Displays icon if provided
              if (widget.icon != null)
                Icon(
                  widget.icon,
                  color: Colors.white, // Icon color
                  size: widget.text != null
                      ? widget.size / 3
                      : widget.size / 2, // Icon size
                  shadows: _isPressed
                      ? [] // No shadow when pressed
                      : [
                          BoxShadow(
                            color: widget.shadowColor.withValues(
                                alpha: 0.6), // Shadow color with opacity
                            offset: const Offset(2, 2), // Shadow offset
                            blurRadius: 4, // Shadow blur radius
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
