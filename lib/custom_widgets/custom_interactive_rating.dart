import 'package:flutter/material.dart';

class RatingBar extends StatefulWidget {
  final int maxRating;
  final double currentRating;
  final void Function(double rating) onRatingSelected;

  const RatingBar({
    required this.maxRating,
    required this.currentRating,
    required this.onRatingSelected,
    super.key,
  });

  @override
  State<RatingBar> createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  late double _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.currentRating;
  }

  void _handleTap(int index) {
    setState(() => _rating = index.toDouble());
    widget.onRatingSelected(_rating);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(widget.maxRating, (index) {
        return IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            index < _rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
          ),
          onPressed: () => _handleTap(index + 1),
        );
      }),
    );
  }
}
