import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../data/breeds/responsesmodel/breeds_responses_model.dart';

class HomeCard extends StatelessWidget {
  final BreedsResponsesModel image;
  final VoidCallback onFavoritePressed;
  final VoidCallback onLikePressed;
  final double borderRadius;

  const HomeCard({
    super.key,
    required this.image,
    required this.onFavoritePressed,
    required this.onLikePressed,
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorUtils.colorBrownWhite, // Card background color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // _buildImageSection(),
            // const SizedBox(height: 10),
            _buildTextSection(),
            const SizedBox(height: 8),
            _buildActionsSection(),
          ],
        ),
      ),
    );
  }

//   Widget _buildImageSection() {
//   final imageUrl = '${ApiConstants.baseUrlImageCats}${image.referenceImageId}.jpg';
//   PrintLog.printLog('Image URL: $imageUrl'); // This will print the URL in your debug console
//   return Image.network(
//     imageUrl,
//     height: 150,
//     width: double.infinity,
//     fit: BoxFit.cover,
//     errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 150),
//   );
// }


  // Builds the text section with name, description, and origin
  Widget _buildTextSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nama Kucing : ${image.name}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Deskripsi : ${image.description}',
          style: const TextStyle(
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Asal : ${image.origin}',
          style: const TextStyle(
            fontWeight: FontWeight.w100,
          ),
        ),
      ],
    );
  }

  // Builds the actions section with Favorite and Like buttons
  Widget _buildActionsSection() {
    return Row(
      children: [
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.favorite, color: ColorUtils.colorBlue), // Icon color
          onPressed: onFavoritePressed,
        ),
        IconButton(
          icon: const Icon(Icons.thumb_up, color: ColorUtils.colorYellow), // Icon color
          onPressed: onLikePressed,
        ),
      ],
    );
  }
}
