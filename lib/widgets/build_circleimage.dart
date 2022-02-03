import 'package:flutter/material.dart';

class BuildCircleImage extends StatelessWidget {
  final String image;
  final double radius;
  final double border;
  const BuildCircleImage(
      {Key? key,
      required this.image,
      required this.radius,
      required this.border})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          radius: radius + border,
          child: CircleAvatar(
            radius: radius,
            backgroundImage: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
