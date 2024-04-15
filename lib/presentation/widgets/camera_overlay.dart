import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CameraOverlay extends StatelessWidget {
  const CameraOverlay({super.key});

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (context, constraints) {
      final cameraAspectRatio = constraints.maxWidth / constraints.maxHeight;
      return Stack(
        children: [
          Positioned.fill(
            child: AspectRatio(
              aspectRatio: cameraAspectRatio,
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(12, (index) {
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.white.withOpacity(0.5), width: 0.5)),
                );
              }),
            ),
          ),
        ],
      );
    });
  }
}
