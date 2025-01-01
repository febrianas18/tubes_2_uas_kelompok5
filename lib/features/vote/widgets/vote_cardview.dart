import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tubes_2_uas_kelompok5/data/vote/responsesmodel/vote_responses_model_get.dart';

class VoteCardview extends StatelessWidget {
  final VoteResponsesModelGet vote;
  final VoidCallback onDeleted;
  const VoteCardview({super.key, required this.vote, required this.onDeleted});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.brown,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Id Vote : ${vote.id}",
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "id User : ${vote.imageId}",
              style: TextStyle(
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
