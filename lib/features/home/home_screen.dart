
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubes_2_uas_kelompok5/features/home/controller/home_controller.dart';
import 'package:tubes_2_uas_kelompok5/features/home/widgets/home_cardview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderSection(),
              Expanded(
                child: Obx(() => controller.images.isNotEmpty ?
                _buildImageList(controller) : _buildLoading()),
              ),
            ],
          ),
        )),
    );
  }

  Widget _buildHeaderSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          Text(
            "Halo, Kucing Lovers!",
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10,),
          Text(
            "Temukan Kucing lucu untuk dijadikan wallpaper!",
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      )
    );
  }

  Widget _buildImageList(HomeController controller) {
    return ListView.builder(
      itemCount: controller.images.length,
      itemBuilder: (context, index) {
        final image = controller.images[index];
        return Homecard(
          image: image, 
          onFavoritePressed: () => controller.onFavoritePressed(image.id), 
          onLikePressed: () => controller.onLikePressed(image.id)
        );
      }
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}