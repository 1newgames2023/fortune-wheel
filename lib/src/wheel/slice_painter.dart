part of 'wheel.dart';

class _CircleSlicePainter extends CustomPainter {
  final Gradient? fillGradient;
  final Color? fillColor;
  final Color? strokeColor;
  final double strokeWidth;
  final double angle;

  const _CircleSlicePainter({
    this.fillGradient,
    this.fillColor,
    this.strokeColor,
    this.strokeWidth = 1,
    this.angle = _math.pi / 2,
  }) : assert(angle > 0 && angle < 2 * _math.pi);

  @override
  void paint(Canvas canvas, Size size) {
    final radius = _math.min(size.width, size.height);
    final path = _CircleSlice.buildSlicePath(radius, angle);

    final paint = Paint()..style = PaintingStyle.fill;

    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: radius,
    );

    if (fillGradient != null) {
      final shader = fillGradient!.createShader(rect);

      paint.shader = shader;
    } else if (fillColor != null) {
      paint.color = fillColor!;
    }

    canvas.drawPath(path, paint);

    if (strokeWidth > 0 && strokeColor != null) {
      canvas.drawPath(
        path,
        Paint()
          ..color = strokeColor!
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke,
      );

      canvas.drawPath(
        Path()
          ..arcTo(
              Rect.fromCircle(
                center: Offset(0, 0),
                radius: radius,
              ),
              0,
              angle,
              false),
        Paint()
          ..color = strokeColor!
          ..strokeWidth = strokeWidth * 2
          ..style = PaintingStyle.stroke,
      );
    }
  }

  @override
  bool shouldRepaint(_CircleSlicePainter oldDelegate) {
    return angle != oldDelegate.angle ||
        fillColor != oldDelegate.fillColor ||
        fillGradient != oldDelegate.fillGradient ||
        strokeColor != oldDelegate.strokeColor ||
        strokeWidth != oldDelegate.strokeWidth;
  }
}
