
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tubes_2_uas_kelompok5/features/favorite/controller/favorite_controller.dart';


class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});
  
  get controller => null;
  final FavoriteController controller = Get.put(FavoriteController());
  return Scaffold(
    body: SafeArea(
      child: Container(
        color: Colors.blue,
        child: Column(
          children:[
            _buildHeader(),
          SearchViewWidget(
            hintText: 'Search Favorite',
            onSearch: (value){
              controller.searchFavorite;
            },
          ),
          Expanded(
            child: Obx((){
              if (controller.isloading.value){
                return _buildLoading();
              } else if (controller.searchResult.isEmpty){
                return _buildEmptyFavorites(controller);
              } else {
                return _buildFavoritesList(controller);
              }
            }),
          ), // Expanded
          ],
        ),// Column
      ), // Container
      floatingActionButton: FloatingActionButton(
        onPressed: (){
         await controller.fecthFavorite();
        },
        child: Icon(Icons.refresh),
        ),
    );
  );
  Widget _buildHeader(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kucing Favorite',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Your Favorite cat',
            style: TextStyle(
              fontSize: 16,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoading(){
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildEmptyFavorites(FavoritesController controller){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.favorite_border,
            size: 100,
            color: Colors.blue,
          ),
          const SizedBox(height: 16),
          Text(
            'No Favorite cat found',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: (){
              // controller.fecthFavorite():
            },
            child: const Text('Refresh'),
          ),
        ],
      ),
    ),
  }
  Widget _buildFavoritesList(FavoriteController controller){
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        itemCount: controller.searchResult[index];
        return FavoriteCard(
          favorite: favorite,
          onDeleted:(){
           controller.deleteFavorite(favorite.id);
          },
        ),
      ),
    ),
  }
}
