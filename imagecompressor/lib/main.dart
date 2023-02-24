import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(child: Home()),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ImagePicker picker = ImagePicker();
  XFile? image;
  File? _imagefile;
  File? _imagefilec;
  File? _compressedfile;
  String? lengtho, lengthc, lengthcc;

  static String getFileSizeString({required int bytes, int decimals = 0}) {
    if (bytes <= 0) return "0 Bytes";
    const suffixes = [" Bytes", "KB", "MB", "GB", "TB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                image = await picker.pickImage(
                  source: ImageSource.gallery,
                );
                final bytes = File(image!.path).readAsBytesSync().lengthInBytes;
                setState(() {
                  _imagefile = File(image!.path);
                  print(bytes);
                  lengtho = bytes.toString();
                });
              },
              child: Text("Pick Image")),
          image == null ? Container() : Image.file(File(image!.path)),
          image == null ? Text(" ") : Text(lengtho!),
          ElevatedButton(
              onPressed: () async {
                var result = await FlutterImageCompress.compressAndGetFile(
                  _imagefile!.absolute.path,
                  _imagefile!.path + "compressed.jpg",
                  quality: 90,
                );
                final bytesc =
                    File(result!.path).readAsBytesSync().lengthInBytes;
                lengthc = bytesc.toString();
                print(bytesc);
                setState(() {
                  _compressedfile = result;
                });
              },
              child: Text("Compress Image")),
          _compressedfile == null
              ? Container()
              : Image.file(File(_compressedfile!.path)),
          _compressedfile == null ? Text("  ") : Text(lengthc!),
          ElevatedButton(
              onPressed: () async {
                var resultc = await FlutterImageCompress.compressAndGetFile(
                  _compressedfile!.absolute.path,
                  _compressedfile!.path + "compressed.jpg",
                  quality: 1,
                );
                final bytescc =
                    File(resultc!.path).readAsBytesSync().lengthInBytes;
                lengthcc = bytescc.toString();
                print(bytescc);
                setState(() {
                  _imagefilec = resultc;
                });
              },
              child: Text("Compress Image")),
          _imagefilec == null
              ? Container()
              : Image.file(File(_imagefilec!.path)),
          _imagefilec == null ? Text("  ") : Text(lengthcc!),
        ],
      )
    ]));
  }
}
