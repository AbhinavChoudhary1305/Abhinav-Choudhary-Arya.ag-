import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:video_compress/video_compress.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SafeArea(
          child: Scaffold(
        body: UploadVideo(),
      )),
    );
  }
}

class UploadVideo extends StatefulWidget {
  const UploadVideo({super.key});

  @override
  State<UploadVideo> createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  XFile? _video;
  XFile? _videoc;
  final picker = ImagePicker();
  VideoPlayerController? _videoPlayerController;
  VideoPlayerController? _videoPlayerControllerc;
  String? sizec, size;

  _pickVideo() async {
    XFile? pickedFile = (await picker.pickVideo(
      source: ImageSource.gallery,
    ));
    _video = XFile(pickedFile!.path);
    print(_video!.path);
    _videoPlayerController = VideoPlayerController.file(File(_video!.path))
      ..initialize().then((_) async {
        setState(() {});
        _videoPlayerController!.play();
        var file = File(_video!.path);
        int bytes = await file.length();
        size = (bytes / (1024 * 1024)).toString();
      });
  }

  _videoComprsseor() async {
    MediaInfo? mediaInfo = await VideoCompress.compressVideo(
      (_video!.path).toString(),
      quality: VideoQuality.MediumQuality,
    );
    _videoc = XFile((mediaInfo!.path).toString());
    _videoPlayerControllerc = VideoPlayerController.file(File(_videoc!.path))
      ..initialize().then((_) async {
        setState(() {});
        _videoPlayerControllerc!.play();
        var filec = File(_videoc!.path);
        int bytesc = await filec.length();
        sizec = (bytesc / (1024 * 1024)).toString();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          if (_video != null) ...{
            _videoPlayerController!.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _videoPlayerController!.value.aspectRatio,
                    child: VideoPlayer(_videoPlayerController!),
                  )
                : Container()
          } else ...{
            Text(
              "Click on Pick Video to select video",
              style: TextStyle(fontSize: 18.0),
            ),
          },
          ElevatedButton(
            onPressed: () {
              _pickVideo();
            },
            child: Text("Pick Video From Gallery"),
          ),
          Text(size != null ? size! : " "),
          if (_videoc != null) ...{
            _videoPlayerControllerc!.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _videoPlayerControllerc!.value.aspectRatio,
                    child: VideoPlayer(_videoPlayerControllerc!),
                  )
                : Container()
          } else ...{
            Text(
              "Compress the vido",
              style: TextStyle(fontSize: 18.0),
            ),
          },
          ElevatedButton(
              onPressed: () {
                _videoComprsseor();
              },
              child: Text("Compress Video")),
          Text(sizec != null ? sizec! : " "),
        ],
      ),
    );
  }
}
