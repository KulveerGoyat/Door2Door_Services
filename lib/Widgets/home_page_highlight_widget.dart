import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../Constants/colors.dart';
import '../Constants/image_strings.dart';
import '../Constants/text_strings.dart';

class HightlightWidget extends StatelessWidget {
  const HightlightWidget({
    super.key,
    required this.isDarkMode,
    required Future<void> initializeVideoPlayerFuture,
    required VideoPlayerController videoController,
  }) : _initializeVideoPlayerFuture = initializeVideoPlayerFuture, _videoController = videoController;

  final bool isDarkMode;
  final Future<void> _initializeVideoPlayerFuture;
  final VideoPlayerController _videoController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: isDarkMode ? secondaryColor : containerBg,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(highLightTitle, style: Theme.of(context).textTheme.headlineSmall),
                    Expanded(child: SizedBox()),
                    Align(
                      alignment: Alignment.topRight,
                      child: Image(image: AssetImage(highlightImg), width: 50.0, height: 50.0),
                    )
                  ],
                ),
                Text(highlightSubTitle, style: Theme.of(context).textTheme.bodyMedium)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    _videoController.play();
                    return FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _videoController.value.size.width,
                        height: _videoController.value.size.height,
                        child: VideoPlayer(_videoController),
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator(color: Colors.blueAccent));
                  }
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      onboardCounter1,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 26.0,
                        color: isDarkMode
                            ? primaryColor.withValues(alpha: 0.8)
                            : Colors.black.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Icon(
                      Icons.arrow_circle_right_rounded,
                      color: isDarkMode
                          ? primaryColor.withValues(alpha: 0.8)
                          : Colors.black.withValues(alpha: 0.8),
                      size: 35.0,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
