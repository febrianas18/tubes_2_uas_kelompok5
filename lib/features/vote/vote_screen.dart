import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubes_2_uas_kelompok5/core/global_component/searchview.dart';
import 'package:tubes_2_uas_kelompok5/features/favorite/widgets/favorite_cardview.dart';
import 'package:tubes_2_uas_kelompok5/features/vote/controller/vote_controller.dart';

class VoteScreen extends StatelessWidget {
  const VoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final VoteController controller = Get.put(VoteController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.blue,
          child: Column(
            children: [
              _buildHeader(),
              SearchViewWidget(
                hintText: 'Search vote',
                onSearch: (value) {
                  controller.searchVote; // Error: The getter 'searchvote'
                },
              ),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return _buildLoading();
                  } else if (controller.searchResult.isEmpty) {
                    return _buildEmptyFavorites(controller);
                  } else {
                    return _buildFavoriteList(controller);
                  }
                }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await controller.fetchVote(); // Error: The method 'fetchFavorite' is undefined.
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kucing Vote',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Your vote list cat',
            style: TextStyle(
              fontSize: 16,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteList(VoteController controller) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        itemCount: controller.searchResult.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final vote = controller.searchResult[index];
          return VoteCardView(
            vote: vote,
            onDelete: () {
              controller.deleteVote(vote.id);
            },
          );
        },
      ),
    );
  }
}
