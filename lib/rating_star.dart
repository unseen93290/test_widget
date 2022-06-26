import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingStar extends StatefulWidget {

  double size;
  RatingStar({Key? key,required this.size,}) : super(key: key);

  @override
  State<RatingStar> createState() => _RatingStarState();
}

class _RatingStarState extends State<RatingStar> {
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // RatingBar is a widget for create a star in order to record games
        RatingBar.builder(
          allowHalfRating: true,
          maxRating: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 2),
          minRating: 1,
          itemBuilder: (context, _) =>  const Icon(
            Icons.star,
            color: Colors.amber,
            size:25,
          ),
          // Don't forget value , this is a new value has each clik
          onRatingUpdate: (value) {

            setState(() {
              rating = value;
              print(rating);
            });
          },
          itemSize: widget.size,
        ),
        const SizedBox(height: 10,),
        Text("Note du jeu $rating",style: const TextStyle(fontWeight: FontWeight.bold),),
      ],

    );
  }
}
