import 'package:ai_detector/extension/exten.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../API/detect_api.dart';
import '../constant/const.dart';
import '../model/ai_res.dart';
import 'button.dart';
import 'faq_page.dart';
import 'feature_page.dart';
import 'aboutUs_page.dart';

class WebHome extends StatefulWidget {
  const WebHome({Key? key}) : super(key: key);

  @override
  State createState() => _WebHomeState();
}

class _WebHomeState extends State<WebHome> with TickerProviderStateMixin {
  final _urlController = TextEditingController();
  final _articleController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late AnimationController _resultController;
  bool isLoading = false;
  AIDetector? result;
  @override
  void initState() {
    super.initState();
    _resultController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _resultController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.mainColor,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Constant.mainColor,
        elevation: 0,
        title: const Text('CENSORAI',
            style: TextStyle(fontSize: 30, letterSpacing: 5, color:Colors.white)),
        actions: [
          TextButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FAQPage()),
                );
              }, child: const Text('FAQ')),
          20.sw,
          TextButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeaturePage()),
                );
              }, child: const Text('Features')),
              20.sw,
          TextButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsPage()),
                );
              }, child: const Text('About Us')),
          120.sw,
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (context.width > 980)
                    Padding(
                      padding: EdgeInsets.only(
                          top: context.sw(0.1), left: context.sh(0.05)),
                      child: SizedBox(
                        width: context.sw(0.25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('AI Content Detector',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 5,
                                    color: Colors.white)),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                                'Think about this. You have stumbled upon some shocking information in an article and shared it on social media. You later found out that the information was false. And think about it, what? You\'ve seen the worst thing- it\'s AI content.',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                                    Text(
                                'Well, you\'re not alone. As per a Forbes survey, 76% of respondents are concerned about misleading information from AI content spreading across the internet. So, how can you face it? ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                                    Text(
                                'Try our free AI Detector to identify and sort AI-generated text from content. Read on to know how it works and how it is helpful for you.',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                          ],
                        ),
                      ),
                    ),
                  if (context.width < 980)
                    Padding(
                      padding: EdgeInsets.only(
                        top: context.sw(0.1),
                      ),
                      child: SizedBox(
                        width: context.width - 50,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text('AI Content Detector',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 5,
                                      color: Colors.white)),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: context.sw(0.8),
                                  child: const Text(
                                      ' If your content reads like it was entirely produced by AI, it may affect how search engines rank it.\nUse our free detector to check up to 1,500 characters, and decide if you want to make adjustments before you publish.\n\nAI content detection is only available in the Writer app as an API, and is limited to checks of 1,500 characters at a time. Find out more in our help center article.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                      textAlign: TextAlign.center),
                                ),
                              ),
                              15.sh,
                              detect(true),
                            ],
                          ),
                        ),
                      ),
                    ),
                  const Spacer(),
                  if (context.width > 980) detect()
                ],
              ),
            ),
            context.sh(0.08).sh,
            Container(
              width: double.infinity,
              height: context.sh(0.22),
              decoration: const BoxDecoration(color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                            width: 100,
                            height: 100,
                            alignment: Alignment.center,
                            // padding: const EdgeInsets.only(right: 8, bottom: 0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                // borderRadius: BorderRadius.circular(22)
                                shape: BoxShape.circle),
                            child: 'C'.txt(fontSize: 80, color: Colors.white)),
                        const Spacer(),
                        Row(
                          children: <Widget>[
                            'C'.txt(fontSize: 20, color: Colors.white),
                            10.sw,
                            'All Rights preserved'.txt(),
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        'Product'
                            .txt(fontWeight: FontWeight.bold, fontSize: 25),
                        const Spacer(),
                        'Blog'.txt(fontSize: 18),
                        const Spacer(),
                        'Guides'.txt(fontSize: 18),
                        const Spacer(),
                        'Generative AI'.txt(fontSize: 18),
                        const Spacer(),
                        'Inclusive language'.txt(fontSize: 18),
                        const Spacer(),
                        'Style guide template'.txt(fontSize: 18),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        'Social Media'.txt(fontWeight: FontWeight.bold),
                        const Spacer(),
                        Row(
                          children: <Widget>[
                            Container(
                              decoration: const BoxDecoration(
                                  color: Colors.blue,

                                  // borderRadius: BorderRadius.circular(22)
                                  shape: BoxShape.circle),
                              child: const FaIcon(
                                FontAwesomeIcons.facebook,
                                size: 30,
                              ),
                            ).onTap(() {
                              print('object');
                            }),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                  color: Colors.blue,

                                  // borderRadius: BorderRadius.circular(22)
                                  shape: BoxShape.circle),
                              child: const FaIcon(
                                FontAwesomeIcons.twitter,
                                size: 30,
                              ),
                            ).onTap(() {
                              print('object');
                            }),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                  color: Colors.blue,

                                  // borderRadius: BorderRadius.circular(22)
                                  shape: BoxShape.circle),
                              child: const FaIcon(
                                FontAwesomeIcons.g,
                                size: 30,
                              ),
                            ).onTap(() {
                              print('object');
                            }),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget detect([bool isTablet = false]) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: context.sh(0.80),
        width: isTablet ? context.sw(0.9) : context.sw(0.65),
        padding: const EdgeInsets.only(top: 40, left: 30, bottom: 20),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12)),
        child: Form(
          key: formKey,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (!kIsWeb) 'Add a URL'.txt(),
                  if (!kIsWeb) 12.sh,
                  if (!kIsWeb)
                    SizedBox(
                      width: context.sw(0.35),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            if (!value.isUrlValid) {
                              return "Enter a valid url";
                            }
                          }
                          return null;
                        },
                        // minLines: 1,
                        controller: _urlController,
                        onFieldSubmitted: (value) async {
                          if (value.isUrlValid) {
                            setState(() {
                              isLoading = true;
                            });
                            final tags = await DetectAIAPI.fetchAndParseTags(
                                _urlController.text.trim());
                            for (var tag in tags) {
                              if (tag.text.split(' ').length > 4) {
                                if (_articleController.text.length <= 1500) {
                                  _articleController.text += '${tag.text}\n';
                                }
                              }
                            }
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(left: 15, right: 5),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide.none),
                            filled: true,
                            hintText: "https://........",
                            fillColor: Color(0xff849793)),
                      ),
                    ),
                  const Spacer(),
                  'Add some text'.txt(),
                  12.sh,
                  SizedBox(
                    width: context.sw(0.35),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter a valid value";
                        }
                        return null;
                      },
                      // minLines: 1,
                      controller: _articleController,
                      maxLength: 1500,
                      maxLines: (context.sh(0.01) * 2).round(),
                      decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 15, top: 50, right: 5),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide.none),
                          filled: true,
                          hintText: "Paste text or write here...",
                          fillColor: Color(0xff849793)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: context.sw(0.0)),
                    child: DefButton(
                      text: 'Detect',
                      width: context.sw(0.35),
                      hight: 45,
                      isLoading: isLoading,
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            await detector();
                          } on DioError catch (e) {
                            setState(() {
                              isLoading = false;
                            });

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: SelectableText(
                                  '${e.response!.data!} Try Again!!'),
                              backgroundColor: Colors.red,
                            ));
                          }
                        }
                      },
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const Spacer(),
              const VerticalDivider(
                color: Colors.white,
              ),
              const Spacer(),
              SizedBox(
                width: isTablet ? context.sw(0.3) : context.sw(0.22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    '${(score() * 100).floor()}%'
                        .txt(fontSize: 50, fontWeight: FontWeight.bold),
                    10.sh,
                    'DETECTION SCORE'.txt(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    20.sh,
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: LinearProgressIndicator(
                        minHeight: 20,
                        color: Colors.grey[800],
                        value: _resultController.value >= score()
                            ? score().toDouble()
                            : _resultController.value,
                      ),
                    ),
                    10.sh,
                    detectValue()
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  detector() async {
    try {
      setState(() {
        isLoading = true;
      });
      result = await DetectAIAPI.detectAI(_articleController.text.trim());
      if (result != null) {
        setState(() {
          isLoading = false;

          // DetectAd.showSaveAd();
        });
      }
      _resultController.reset();
      _resultController.forward();
    } on DioError catch (e) {
      if (e.response!.data['error'] ==
          'Model Hello-SimpleAI/chatgpt-detector-roberta is currently loading') {
        Fluttertoast.showToast(msg: 'Detecting please wait 15 sec');
        Future.delayed(
            const Duration(
              seconds: 15,
            ), () async {
          await detector();
        });
        return;
      }
    }
  }

  num score() {
    if (result != null) {
      if (result!.label == 'ChatGPT') {
        return (1 - result!.score!.toDouble());
      }
      return result!.score!.toDouble();
    }
    return 0;
  }

  Widget detectValue() {
    if (result != null) {
      if (result!.label! == 'Human') {
        if (result!.score! <= 90) {
          return 'Fantastic'.txt(color: Colors.greenAccent, fontSize: 28);
        }
        if (result!.score! <= 60) {
          return 'May be it\'s AI'.txt(color: Colors.greenAccent, fontSize: 28);
        }
        if (result!.score! <= 70) {
          return 'You should edit your text until there’s less detectable AI content.'
              .txt(color: Colors.greenAccent, fontSize: 28);
        }
      }
    } else if (result == null) {
      return ''.txt();
    }
    return 'AI Generated Content'.txt(color: Colors.red.shade900, fontSize: 28);
  }
}
