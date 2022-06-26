import 'package:flutter/material.dart';
import 'package:test_widget/rating_star.dart';


class CardGame extends StatefulWidget {
  //TODO When a list it's create don't forget ratingstar note for the game
  String imageGame;
  String nameGame;
  CardGame({
    required this.imageGame,
    required this.nameGame,
  });
  @override
  State<CardGame> createState() => CardGameState();
}

class CardGameState extends State<CardGame> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            child: Image(
              fit: BoxFit.cover,
              height: 70,
              width: 80,
              image: AssetImage(
                widget.imageGame,
              ),
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          Text(
            widget.nameGame,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          RatingStar(
            size: 30,
          )
        ],
      ),
    );
  }
}
