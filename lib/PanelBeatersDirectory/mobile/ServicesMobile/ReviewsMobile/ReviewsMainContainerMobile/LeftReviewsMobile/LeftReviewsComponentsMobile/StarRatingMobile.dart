import 'package:flutter/material.dart';

class StarRatingMobile extends StatefulWidget {
  final String stars;
  const StarRatingMobile({Key? key, required this.stars}) : super(key: key);

  @override
  State<StarRatingMobile> createState() => _StarRatingMobileState();
}

class _StarRatingMobileState extends State<StarRatingMobile> {
  late int _rating;

  @override
  void initState() {
    super.initState();
    _rating = int.parse(widget.stars);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          constraints: BoxConstraints(),
          padding: EdgeInsets.all(0),
          onPressed: () {
            setState(() {
              _rating = index + 1;
            });
          },
          icon: Icon(
            index < _rating ? Icons.star_sharp : Icons.star_sharp,
            color: index < _rating ? Colors.orange : Colors.grey,
          ),
          iconSize: 21,
        );
      }),
    );
  }
}
