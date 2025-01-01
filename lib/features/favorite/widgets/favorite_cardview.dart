import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tubes_2_uas_kelompok5/data/favorite/responsesmodel/favorite_responses_model_get.dart';

class FavoriteCardview extends StatelessWidget{
  final FavoritesResponsesModelGet favorite;
  final VoidCallback onDeleted;
  const FavoriteCardview({super.key, required this.favorite, required this.onDeleted});

  @override
  Widget build(BuildContext context) {
    var RoundedRectangleBorder;
    return Card(
      color: Colors.brown,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Favorite Id: ${favorite.id}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Tanggal Favorite : ${favorite.createdAt}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}