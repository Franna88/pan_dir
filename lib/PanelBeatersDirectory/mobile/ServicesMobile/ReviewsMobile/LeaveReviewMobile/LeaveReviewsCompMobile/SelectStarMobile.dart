import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class SelectStarMobile extends StatefulWidget {
  final void Function(int rating) onRatingChanged;

  const SelectStarMobile({Key? key, required this.onRatingChanged})
      : super(key: key);

  @override
  _SelectStarMobileState createState() => _SelectStarMobileState();
}

class _SelectStarMobileState extends State<SelectStarMobile> {
  late int _rating;
  late int _hoverRating;

  @override
  void initState() {
    super.initState();
    _rating = 0;
    _hoverRating = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      _hoverRating = index + 1;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      _hoverRating = 0;
                    });
                  },
                  child: IconButton(
                    constraints: BoxConstraints(),
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      setState(() {
                        _rating = index + 1;
                        widget.onRatingChanged(_rating);
                      });
                    },
                    icon: Icon(
                      index < _rating || index < _hoverRating
                          ? Icons.star_sharp
                          : Icons.star_sharp,
                      color: index < _rating || index < _hoverRating
                          ? Colors.orange
                          : Colors.grey,
                    ),
                    iconSize: 25,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
