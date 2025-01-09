import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String? imageUrl;
  final double radius;

  const CustomCircleAvatar({
    Key? key,
    this.imageUrl,
    this.radius = 30.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey[300],
      backgroundImage: imageUrl != null && imageUrl!.isNotEmpty
          ? NetworkImage(imageUrl!)
          : null,
      child: imageUrl == null || imageUrl!.isEmpty
          ? Icon(
              Icons.person,
              size: radius,
              color: Colors.grey[700],
            )
          : null,
    );
  }
}
