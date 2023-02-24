import 'dart:io';
import 'package:video_player/video_player.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Post Your Requirement",
      home: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //page titel
                TextDiscrption(
                    colour: Colors.black,
                    mainh: 16,
                    maintext: "Post Your Requirement",
                    subh: 14,
                    subtext: "What do you want to post?"),
                SizedBox(
                  height: 12,
                ),
                PostYourRequirement(),
              ],
            ),
          ]),
        ),
      )),
    );
  }
}

class SupplyCommodity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "You will post a commodity Supply for other Buyers.",
          style: TextStyle(fontSize: 12),
        ),
        SizedBox(
          height: 12,
        ),
        CheckerboxQuestion(),
        SizedBox(
          height: 12,
        ),
        QuestionAnswer(
            hint: "E.g. Wheat", qsize: 14, question: "Select Commodity"),
        SizedBox(
          height: 12,
        ),
        QuestionAnswer(hint: "E.g. Mix", qsize: 14, question: "Variety"),
        SizedBox(
          height: 12,
        ),
        UploadSection(),
        SizedBox(
          height: 12,
        ),
        LongQuestionAnswer(
            hint: "Enter Product Description here...",
            qsize: 14,
            question: "PRODUCT DISCRIPTION"),
        SizedBox(
          height: 12,
        ),
        CommodityLocation(),
        SizedBox(
          height: 12,
        ),
        QuestionAnswer(
            hint: "E.g. 555", qsize: 14, question: 'Quantity (in MT)'),
        SizedBox(
          height: 12,
        ),
        QuestionAnswer(
            hint: "E.g. 45,000",
            qsize: 14,
            question: "Expected Price (in ₹/MT)"),
        SizedBox(
          height: 12,
        ),
        DropDownQuestionAnswer(
          qsize: 14,
          question: 'Payment Terms',
          options: [
            "Ex Warehouse",
            "Payment in advance",
            "End of month",
            "Cash on delivery",
            "Cash in advance"
          ],
        ),
        SizedBox(
          height: 12,
        ),
        DropDownQuestionAnswer(
          qsize: 14,
          question: "Prefferred Buyer Location",
          options: [
            "PAN INDIA",
            "North Indai",
            "South India",
            "West India",
            "East India"
          ],
        )
      ],
    );
  }
}

class DemandCommodity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "You will post a commodity Demand for other Sellers.",
          style: TextStyle(fontSize: 12),
        ),
        SizedBox(
          height: 12,
        ),
        QuestionAnswer(
            hint: "E.g. Wheat", qsize: 14, question: "Select Commodity"),
        SizedBox(
          height: 12,
        ),
        QuestionAnswer(hint: "E.g. Mix", qsize: 14, question: 'Variety'),
        SizedBox(
          height: 12,
        ),
        //location
        YourLocation(),
        SizedBox(
          height: 12,
        ),
        QuestionAnswer(
            hint: "E.g. 555", qsize: 14, question: "Quantity (In MT)"),
        SizedBox(
          height: 12,
        ),
        QuestionAnswer(
            hint: "E.g. 45,000",
            qsize: 14,
            question: "Expected Price(In ₹/MT)"),
        SizedBox(
          height: 12,
        ),
        DropDownQuestionAnswer(
          qsize: 14,
          question: "Payment Term",
          options: [
            "Ex Warehouse",
            "Payment in advance",
            "End of month",
            "Cash on delivery",
            "Cash in advance"
          ],
        ),
        SizedBox(
          height: 12,
        ),
        QuestionAnswer(
            hint: "E.g. Pankaj", qsize: 12, question: "Contact Name"),
        SizedBox(
          height: 12,
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text(
            "Submit",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              minimumSize: const Size.fromHeight(50)),
        )
      ],
    );
  }
}

class YourLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 162, 162, 162))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "YOUR LOCATION",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              QuestionAnswer(
                  hint: "E.g. 580001", qsize: 12, question: "Pincode"),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: QuestionAnswer(
                        hint: "E.g. Assam", qsize: 12, question: "State"),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: QuestionAnswer(
                        hint: "E.g. Dispur", qsize: 12, question: "City"),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class CommodityLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 162, 162, 162))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "COMMODITY LOCATION",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              DropDownQuestionAnswer(
                qsize: 12,
                question: 'Select WareHouse',
                options: [
                  "Warehouse 1",
                  "Warehouse 2",
                  "Warehouse 3",
                  "Warehouse 4",
                  "Warehouse 5"
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: QuestionAnswer(
                        hint: "E.g. Assam", qsize: 12, question: "State"),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: QuestionAnswer(
                        hint: "E.g. Dispur", qsize: 12, question: "City"),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class TextDiscrption extends StatelessWidget {
  final String maintext;
  final String subtext;
  final double mainh;
  final double subh;
  final Color colour;

  const TextDiscrption(
      {required this.colour,
      required this.mainh,
      required this.maintext,
      required this.subh,
      required this.subtext});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          maintext,
          style: TextStyle(
              fontSize: mainh, fontWeight: FontWeight.bold, color: colour),
        ),
        Text(
          subtext,
          style: TextStyle(fontSize: subh, color: colour),
        ),
      ],
    );
  }
}

class QuestionAnswer extends StatelessWidget {
  final String question;
  final String hint;
  final double qsize;

  const QuestionAnswer(
      {required this.hint, required this.qsize, required this.question});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              question,
              style: TextStyle(fontSize: qsize, fontWeight: FontWeight.bold),
            ),
            Text(
              "*",
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
        SizedBox(
          height: 8,
        ),
        TextField(
          decoration:
              InputDecoration(border: OutlineInputBorder(), hintText: hint),
        )
      ],
    );
  }
}

class DropDownQuestionAnswer extends StatelessWidget {
  final String question;
  final double qsize;
  final List<String> options;

  DropDownQuestionAnswer(
      {required this.qsize, required this.question, required this.options});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              question,
              style: TextStyle(fontSize: qsize, fontWeight: FontWeight.bold),
            ),
            Text(
              "*",
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
        SizedBox(
          height: 8,
        ),
        QuestionDropDown(
          options: options,
        ),
      ],
    );
  }
}

class LongQuestionAnswer extends StatelessWidget {
  final String question;
  final String hint;
  final double qsize;

  const LongQuestionAnswer(
      {required this.hint, required this.qsize, required this.question});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TextStyle(fontSize: qsize, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 8,
        ),
        TextField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration:
              InputDecoration(border: OutlineInputBorder(), hintText: hint),
        )
      ],
    );
  }
}

class PostYourRequirement extends StatefulWidget {
  const PostYourRequirement({super.key});

  @override
  State<PostYourRequirement> createState() => _PostYourRequirementState();
}

class _PostYourRequirementState extends State<PostYourRequirement> {
  final Color activecolordemand = Color.fromARGB(255, 0, 97, 3);
  final Color activecolorsupply = Color.fromARGB(255, 159, 95, 0);
  final Color activecolortext = Colors.white;
  final Color inactivecolortext = Colors.black;
  final Color inactivecolor = Colors.white;

  bool isDemandSelect = true;
  bool isSupplySelect = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 162, 162, 162)),
              borderRadius: BorderRadius.all(Radius.circular(6.0))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Ink(
                    child: InkWell(
                      child: Container(
                          decoration: BoxDecoration(
                              color: isDemandSelect == false
                                  ? inactivecolor
                                  : activecolordemand,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6))),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextDiscrption(
                                colour: isDemandSelect == false
                                    ? inactivecolortext
                                    : activecolortext,
                                mainh: 14,
                                maintext: "DEMAND",
                                subh: 12,
                                subtext: "I want to buy"),
                          )),
                      onTap: () {
                        setState(() {
                          isDemandSelect = true;
                          isSupplySelect = false;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Ink(
                    child: InkWell(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              color: isSupplySelect == false
                                  ? inactivecolor
                                  : activecolorsupply),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextDiscrption(
                                colour: isSupplySelect == false
                                    ? inactivecolortext
                                    : activecolortext,
                                mainh: 14,
                                maintext: "SUPPLY",
                                subh: 12,
                                subtext: "I want to sell"),
                          )),
                      onTap: () {
                        setState(() {
                          isSupplySelect = true;
                          isDemandSelect = false;
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        if (isDemandSelect == true) ...[
          DemandCommodity(),
        ] else ...[
          SupplyCommodity(),
        ]
      ],
    );
  }
}

class CheckerboxQuestion extends StatefulWidget {
  const CheckerboxQuestion({super.key});

  @override
  State<CheckerboxQuestion> createState() => _CheckerboxQuestionState();
}

class _CheckerboxQuestionState extends State<CheckerboxQuestion> {
  bool ischecked1 = true;
  bool ischecked2 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Commodity Located at",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              "*",
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
        Container(
          child: Column(
            children: [
              Row(
                children: [
                  Ink(
                    child: InkWell(
                      child: Container(
                        child: Stack(alignment: Alignment.center, children: [
                          Icon(
                            Icons.circle,
                            color: ischecked1 == true
                                ? Color.fromARGB(255, 0, 130, 173)
                                : Colors.transparent,
                          ),
                          Icon(
                            Icons.circle_outlined,
                            color: ischecked1 == true
                                ? Color.fromARGB(255, 0, 130, 173)
                                : Colors.grey,
                          ),
                          Icon(
                            Icons.circle_outlined,
                            color: ischecked1 == true
                                ? Colors.white
                                : Colors.transparent,
                            size: 18,
                          )
                        ]),
                      ),
                      onTap: () {
                        setState(() {
                          ischecked1 = !ischecked1;
                          ischecked2 = !ischecked2;
                        });
                      },
                    ),
                  ),
                  Text(
                    "Arya's Warehouse",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              Row(
                children: [
                  Ink(
                    child: InkWell(
                      child: Container(
                        child: Stack(alignment: Alignment.center, children: [
                          Icon(
                            Icons.circle,
                            color: ischecked2 == true
                                ? Color.fromARGB(255, 0, 130, 173)
                                : Colors.transparent,
                          ),
                          Icon(
                            Icons.circle_outlined,
                            color: ischecked2 == true
                                ? Color.fromARGB(255, 0, 130, 173)
                                : Colors.grey,
                          ),
                          Icon(
                            Icons.circle_outlined,
                            color: ischecked2 == true
                                ? Colors.white
                                : Colors.transparent,
                            size: 18,
                          )
                        ]),
                      ),
                      onTap: () {
                        setState(() {
                          ischecked1 = !ischecked1;
                          ischecked2 = !ischecked2;
                        });
                      },
                    ),
                  ),
                  Text(
                    "Outside Arya's Warehouse",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class UploadSection extends StatefulWidget {
  const UploadSection({super.key});

  @override
  State<UploadSection> createState() => _UploadSectionState();
}

class _UploadSectionState extends State<UploadSection> {
  static XFile? image1;
  static XFile? image2;
  static XFile? image3;
  final _picker = ImagePicker();
  bool showSpinner = false;
  static XFile? _pickedFile1;
  static XFile? _pickedFile2;
  static XFile? _pickedFile3;
  static XFile? video;
  final _pickerv = ImagePicker();
  static XFile? _pickerfile;
  VideoPlayerController? _controller;
  int count = 1;

  Future getVideocamera() async {
    final _pickedfile = await _pickerv.pickVideo(source: ImageSource.camera);
    if (_pickedfile != null) {
      video = XFile(_pickedfile.path);
      setState(() {
        video = XFile(_pickedfile.path);
      });
    }
  }

  Future getVideogallery() async {
    final _pickerfile = await _pickerv.pickVideo(source: ImageSource.gallery);
    if (_pickerfile != null) {
      video = XFile(_pickerfile.path);
      print(video!.path);
      _controller = VideoPlayerController.file(File(video!.path));
      await _controller!.initialize();
    }
  }

  Future getImagegallery1() async {
    print("Getting Image from Gallery.");
    _pickedFile1 = await _picker.pickImage(source: ImageSource.gallery);
    if (_pickedFile1 != null) {
      print(_pickedFile1!.path);
      setState(() {
        image1 = XFile(_pickedFile1!.path);
      });
      Navigator.pop(context);
    }
  }

  Future getImagegallery2() async {
    print("Getting Image from Gallery.");
    _pickedFile2 = await _picker.pickImage(source: ImageSource.gallery);
    if (_pickedFile2 != null) {
      print(_pickedFile2!.path);
      setState(() {
        image2 = XFile(_pickedFile2!.path);
      });
      Navigator.pop(context);
    }
  }

  Future getImagegallery3() async {
    print("Getting Image from Gallery.");
    _pickedFile3 = await _picker.pickImage(source: ImageSource.gallery);
    if (_pickedFile3 != null) {
      print(_pickedFile3!.path);
      setState(() {
        image3 = XFile(_pickedFile3!.path);
      });
      Navigator.pop(context);
    }
  }

  Future getImagecamera() async {
    print("Getting Image from Gallery.");
    _pickedFile1 =
        (await _picker.pickImage(source: ImageSource.camera)) as XFile?;
    if (_pickedFile1 != null) {
      print(_pickedFile1!.path);
      setState(() {
        image1 = XFile(_pickedFile1!.path);
      });
      Navigator.pop(context!);
    }
  }

  Widget uploadImage() {
    return Expanded(
      child: Ink(
        child: InkWell(
          child: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 212, 255, 166),
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Spacer(),
                    Icon(Icons.image_outlined),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Upload Photo",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                  ],
                ),
              )),
          onTap: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text("Upload Photo"),
              content: const Text('Choose how you want to upload the photo'),
              actions: <Widget>[
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                              child: Row(
                                children: [
                                  Spacer(),
                                  Icon(Icons.photo_album_outlined),
                                  Text("Gallery"),
                                  Spacer(),
                                ],
                              ),
                              onPressed: () {
                                if (count == 1) {
                                  getImagegallery1();
                                } else if (count == 2) {
                                  getImagegallery2();
                                } else if (count == 3) {
                                  getImagegallery3();
                                }
                                count++;
                              }),
                        ),
                        Expanded(
                          child: TextButton(
                              child: Row(
                                children: [
                                  Spacer(),
                                  Icon(Icons.camera_alt_outlined),
                                  Text("Camera"),
                                  Spacer(),
                                ],
                              ),
                              onPressed: () {
                                getImagecamera();
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget uploadVideo() {
    return Expanded(
        child: InkWell(
            child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 212, 255, 166),
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Spacer(),
                      Icon(Icons.video_camera_back_outlined),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Upload Video",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                    ],
                  ),
                )),
            onTap: () async {
              await showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Upload Video"),
                      content:
                          const Text('Choose how you want to upload the video'),
                      actions: <Widget>[
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                  child: Row(
                                    children: [
                                      Spacer(),
                                      Icon(Icons.video_file_outlined),
                                      Text("Gallery"),
                                      Spacer(),
                                    ],
                                  ),
                                  onPressed: () async {
                                    await getVideogallery();
                                    Navigator.pop(context);
                                  }),
                            ),
                            Expanded(
                              child: TextButton(
                                  child: Row(
                                    children: [
                                      Spacer(),
                                      Icon(Icons.video_camera_back_outlined),
                                      Text("Camera"),
                                      Spacer(),
                                    ],
                                  ),
                                  onPressed: () async {
                                    await getVideocamera();
                                    Navigator.pop(context);
                                  }),
                            ),
                          ],
                        ),
                      ],
                    );
                  });

              // Future.delayed(Duration(seconds: 1), () {
              setState(() {});
              // });
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("To sell your commodity faster make sure to upload"),
        SizedBox(
          height: 12,
        ),
        Row(
          children: [
            uploadImage(),
            SizedBox(
              width: 8,
            ),
            uploadVideo(),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Container(
                          child: _pickedFile1 == null
                              ? SizedBox()
                              : Image.file(
                                  File(image1!.path),
                                )),
                      onDoubleTap: () {
                        setState(() {
                          image1 = image2;
                          _pickedFile1 = _pickedFile2;
                          count = count - 1;
                          image3 = null;
                          _pickedFile3 = null;
                          image2 = null;
                          _pickedFile2 = null;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Container(
                          child: _pickedFile2 == null
                              ? SizedBox()
                              : Image.file(
                                  File(image2!.path),
                                  fit: BoxFit.scaleDown,
                                )),
                      onDoubleTap: () {
                        setState(() {
                          image2 = image3;
                          _pickedFile2 = _pickedFile3;
                          count = count - 1;
                          image3 = null;
                          _pickedFile3 = null;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Container(
                          child: _pickedFile3 == null
                              ? SizedBox()
                              : Image.file(
                                  File(image3!.path),
                                  fit: BoxFit.scaleDown,
                                )),
                      onDoubleTap: () {
                        setState(() {
                          image3 = null;
                          _pickedFile3 = null;
                          count = count - 1;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: InkWell(
              child: _controller != null && _controller!.value.isInitialized
                  ? Container(
                      child: AspectRatio(
                        aspectRatio: _controller!.value.aspectRatio,
                        child: VideoPlayer(_controller!),
                      ),
                    )
                  : SizedBox(),
              onDoubleTap: () {
                setState(() {
                  _controller = null;
                });
              },
            )),
          ],
        )
      ],
    );
  }
}

class QuestionDropDown extends StatefulWidget {
  List<String> options;
  QuestionDropDown({required this.options});

  @override
  State<QuestionDropDown> createState() =>
      _QuestionDropDownState(options: options);
}

class _QuestionDropDownState extends State<QuestionDropDown> {
  List<String> options;

  _QuestionDropDownState({required this.options});

  @override
  Widget build(BuildContext context) {
    String dropdownValue = options.first;
    return DropdownButtonFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.grey)),
        filled: true,
        fillColor: Colors.white,
      ),
      dropdownColor: Colors.white,
      value: dropdownValue,
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style:
                TextStyle(fontSize: 12, color: Color.fromARGB(255, 84, 84, 84)),
          ),
        );
      }).toList(),
    );
  }
}
