import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/colors.dart'; // Assuming you have defined ColorUtils here
import 'controller/home_controller.dart';
import 'widgets/home_cardview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: ColorUtils.colorBlue.withOpacity(0.1), // Background color with slight opacity
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section
              _buildHeaderSection(),
              // Body section with the image list or a progress indicator
              Expanded(
                child: Obx(() => controller.images.isNotEmpty
                    ? _buildImageList(controller)
                    : _buildLoadingIndicator()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Builds the header section (can be customized further)
  Widget _buildHeaderSection() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Halo, Kucing Lovers!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: ColorUtils.colorBlue, // Use blue color for the header text
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Temukan kucing lucu untuk dijadikan wallpaper handphone kamu!',
            style: TextStyle(
              fontSize: 16,
              color: ColorUtils.colorOrange, // Use orange for the subtitle
            ),
          ),
        ],
      ),
    );
  }

  // Builds the list of images
  Widget _buildImageList(HomeController controller) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        itemCount: controller.images.length,
        itemBuilder: (context, index) {
          final image = controller.images[index];
          return HomeCard(
            image: image,
            onFavoritePressed: () => controller.handleFavoritePressed(image.id),
            onLikePressed: () => controller.handleLikePressed(image.id),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16); // Adds space between each card
        },
      ),
    );
  }

  // Builds the loading indicator when images are being fetched
  Widget _buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
