import 'package:crochet_counter/components/sized_button.dart';
import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback addEvent;
  final VoidCallback removeEvent;

  const Display({
    super.key,
    required this.label,
    required this.value,
    required this.addEvent,
    required this.removeEvent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.only(
              bottom: 8,
            ),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedButton(
              width: 110,
              height: 100,
              onPress: removeEvent,
              child: const Text(
                "-",
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedButton(
              width: 110,
              height: 100,
              onPress: addEvent,
              child: const Text(
                "+",
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
