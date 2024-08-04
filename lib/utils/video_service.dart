import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

///
// ignore: prefer-match-file-name
class _IVideoService {
  _IVideoService._();

  /// Singleton instance of [_IVideoService]
  static final _IVideoService instance = _IVideoService._();

  /// Generates a thumbnail image data in memory as UInt8List.
  ///
  /// The video source can be a local video file or a URL.
  ///
  /// Thumbnails are not supported on Web at this time.
  ///
  /// If no [video] path is supplied, or if a thumbnail cannot be generated,
  /// returns [generatePlaceholderThumbnail]. A stock placeholder image.
  ///
  /// For desktop, you can specify the position of the video to generate
  /// the thumbnail.
  ///
  /// For mobile, you can specify the maximum height or width for the thumbnail
  /// or 0 for same resolution as the original video. The lower quality value
  /// creates lower quality of the thumbnail image, but it gets ignored for
  /// PNG format.
  Future<Uint8List?> generateVideoThumbnail({
    required String video,
    Map<String, String>? headers,
    ImageFormat imageFormat = ImageFormat.PNG,
    int maxHeight = 0,
    int maxWidth = 0,
    int timeMs = 0,
    int quality = 10,
  }) async {
    return VideoThumbnail.thumbnailData(
      video: video,
      headers: headers,
      imageFormat: imageFormat,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
      timeMs: timeMs,
      quality: quality,
    );
  }
}

/// Get instance of [_IVideoService]
// ignore: non_constant_identifier_names
_IVideoService get videoService => _IVideoService.instance;
