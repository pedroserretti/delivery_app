import 'package:delivery_app/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

class DeliveryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final double? width;
  final double? height;

  const DeliveryButton({super.key, required this.label, required this.onPressed, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 10,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onPressed: onPressed,
          child: Text(
            label,
            style: TextStyle(color: context.colors.white),
          )),
    );
  }
}
