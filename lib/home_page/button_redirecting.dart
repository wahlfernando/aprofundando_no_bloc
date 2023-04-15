import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  final Function()? onTap;
  final String? text;

  const ButtonCard({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(20),
            ),
            width: MediaQuery.of(context).size.width * 0.4,
            height: 150,
            child: Center(
              child: Text(
                text!,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
