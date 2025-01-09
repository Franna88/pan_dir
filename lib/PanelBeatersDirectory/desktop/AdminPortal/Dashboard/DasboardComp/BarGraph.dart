import 'package:flutter/material.dart';

class CustomBarGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            'Views',
            style: TextStyle(
              color: Colors.black,
              fontSize: 13.6,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 1,
            ),
          ),
        ),
        Container(
          height: 110,
          width: 175,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomBar(height: 140),
              CustomBar(height: 120),
              CustomBar(height: 100),
              CustomBar(height: 80),
              CustomBar(height: 80),
              CustomBar(height: 90),
              CustomBar(height: 95),
              CustomBar(height: 60),
              CustomBar(height: 40),
              CustomBar(height: 90),
              CustomBar(height: 120),
              CustomBar(height: 100),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Months',
          style: TextStyle(
            color: Colors.black,
            fontSize: 13.6,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 1,
          ),
        )
      ],
    );
  }
}

class CustomBar extends StatelessWidget {
  final double height;

  const CustomBar({required this.height});

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..translate(0.0, 0.0)
        ..rotateZ(0.0),
      child: Container(
        width: 8,
        height: height,
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Color(0xFFFF8728), Color(0xFFFFAC6B), Color(0xFFF2B07C)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
