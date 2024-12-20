import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tubes2_uas_kelompok/data/vote/responsesmodel/vote_responses_model.dart';

class VoteCardView extends StatelessWidget {
  final VoteResponsesModel vote;
  final VoidCallback onDelete;

  const VoteCardView({super.key, required this.vote, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.brown,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Id Vote : ${vote.id}",
              style: const TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Id User : ${vote.imageId}",
              style: const TextStyle(
                color: Colors.red,
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
