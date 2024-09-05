import 'package:flutter/material.dart';

class ChatBubblePainter extends CustomPainter {
  final Color color;
  final bool isSentByUser;

  ChatBubblePainter({required this.color, required this.isSentByUser});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path();
    if (isSentByUser) {
      path.moveTo(size.width - 10, 0); // Start point at the top-right
      path.lineTo(10, 0); // Line across the top
      path.quadraticBezierTo(0, 0, 0, 10); // Top-left curve
      path.lineTo(0, size.height - 10); // Line down the left side
      path.quadraticBezierTo(
          0, size.height, 10, size.height); // Bottom-left curve
      path.lineTo(size.width - 20, size.height); // Line across the bottom
      path.quadraticBezierTo(size.width - 10, size.height, size.width - 10,
          size.height - 10); // Bottom-right curve
      path.lineTo(size.width, size.height); // Tail point
      path.lineTo(size.width - 10,
          size.height - 10); // Line back up to connect with the main bubble
      path.quadraticBezierTo(size.width, size.height - 20, size.width - 10,
          0); // Complete the tail with a curve
    } else {
      path.moveTo(10, 0); // Start point at the top-left
      path.lineTo(size.width - 10, 0); // Line across the top
      path.quadraticBezierTo(size.width, 0, size.width, 10); // Top-right curve
      path.lineTo(size.width, size.height - 10); // Line down the right side
      path.quadraticBezierTo(size.width, size.height, size.width - 10,
          size.height); // Bottom-right curve
      path.lineTo(20, size.height); // Line across the bottom
      path.quadraticBezierTo(
          10, size.height, 10, size.height - 10); // Bottom-left curve
      path.lineTo(0, size.height); // Tail point
      path.lineTo(
          10, size.height - 10); // Line back up to connect with the main bubble
      path.quadraticBezierTo(
          0, size.height - 20, 10, 0); // Complete the tail with a curve
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class TextMessageBubblePainter extends CustomPainter {
  final String message;
  final Color bubbleColor;

  TextMessageBubblePainter(this.message, this.bubbleColor);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = bubbleColor
      ..style = PaintingStyle.fill;

    // Define the bubble shape (you can customize this)
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..quadraticBezierTo(size.width, size.height, size.width - 10, size.height)
      ..lineTo(10, size.height)
      ..quadraticBezierTo(0, size.height, 0, 0);

    canvas.drawPath(path, paint);

    // Draw the text (adjust the position as needed)
    final textPainter = TextPainter(
      text: TextSpan(
        text: message,
        style: const TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: 0, maxWidth: size.width - 32);
    textPainter.paint(
        canvas, Offset(16, (size.height - textPainter.height) / 2));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
