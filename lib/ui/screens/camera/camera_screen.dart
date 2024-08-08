import 'dart:io';

// import 'package:better_open_file/better_open_file.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CameraScreen extends StatelessWidget {
  final CaptureMode initialCaptureMode;
  const CameraScreen({super.key, required this.initialCaptureMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CameraAwesomeBuilder.awesome(
        saveConfig: SaveConfig.photoAndVideo(
          photoPathBuilder: (sensors) async {
            final Directory extDir = await getTemporaryDirectory();
            final testDir = await Directory(
              '${extDir.path}/camerawesome',
            ).create(recursive: true);
            if (sensors.length == 1) {
              final String filePath =
                  '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
              return SingleCaptureRequest(filePath, sensors.first);
            }
            // Separate pictures taken with front and back camera
            return MultipleCaptureRequest(
              {
                for (final sensor in sensors)
                  sensor:
                      '${testDir.path}/${sensor.position == SensorPosition.front ? 'front_' : "back_"}${DateTime.now().millisecondsSinceEpoch}.jpg',
              },
            );
          },
          videoOptions: VideoOptions(
            enableAudio: true,
            ios: CupertinoVideoOptions(
              fps: 10,
            ),
            android: AndroidVideoOptions(
              bitrate: 6000000,
              fallbackStrategy: QualityFallbackStrategy.lower,
            ),
          ),
        ),
        sensorConfig: SensorConfig.single(
          sensor: Sensor.position(SensorPosition.back),
          flashMode: FlashMode.auto,
          aspectRatio: CameraAspectRatios.ratio_4_3,
          zoom: 0.0,
        ),
        enablePhysicalButton: true,
        // filter: AwesomeFilter.AddictiveRed,
        previewAlignment: Alignment.center,
        previewFit: CameraPreviewFit.contain,
        onMediaTap: (mediaCapture) {
          mediaCapture.captureRequest.when(
            single: (single) {
              debugPrint('single: ${single.file?.path}');
              Navigator.pop(context, [single.file]);
            },
            multiple: (multiple) {
              Navigator.pop(context, multiple.fileBySensor.values.toList());
              // multiple.fileBySensor.forEach((key, value) {
              //   debugPrint('multiple file taken: $key ${value?.path}');
              // });
            },
          );
        },
        availableFilters: awesomePresetFiltersList,
      ),
    );
  }
}
