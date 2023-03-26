import 'package:flutter/material.dart';

class SizedButton extends StatelessWidget {
  final VoidCallback onPress;
  final Widget child;
  final double width;
  final double height;
  final Color? color;

  const SizedButton({
    super.key,
    required this.child,
    required this.width,
    required this.height,
    required this.onPress,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: color != null
              ? MaterialStatePropertyAll<Color>(color!)
              : MaterialStatePropertyAll<Color>(Theme.of(context).primaryColor),
        ),
        onPressed: onPress,
        child: child,
      ),
    );
  }
}
