import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

/// Opens a full-screen, pinch-to-zoom viewer for the given image.
void openImageViewer(BuildContext context, ImageProvider image) {
  Navigator.of(context).push(
    MaterialPageRoute(
      fullscreenDialog: true,
      builder: (_) => ImageViewerScreen(image: image),
    ),
  );
}

class ImageViewerScreen extends StatelessWidget {
  final ImageProvider image;

  const ImageViewerScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const CloseButton(color: Colors.white),
      ),
      body: PhotoView(
        imageProvider: image,
        backgroundDecoration: const BoxDecoration(color: Colors.black),
        minScale: PhotoViewComputedScale.contained,
        maxScale: PhotoViewComputedScale.covered * 3,
        initialScale: PhotoViewComputedScale.contained,
        errorBuilder: (_, __, ___) =>
            const Center(child: Icon(Icons.broken_image, color: Colors.white54, size: 48)),
      ),
    );
  }
}
