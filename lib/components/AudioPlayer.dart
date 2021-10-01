import 'package:audio_learn/components/CustomHeader.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
// ignore: import_of_legacy_library_into_null_safe

class AudioPlayer extends StatefulWidget {
  const AudioPlayer({Key? key}) : super(key: key);

  @override
  _AudioPlayerState createState() => _AudioPlayerState();
}

var url =
    "https://static.theceomagazine.net/wp-content/uploads/2018/10/15093202/elon-musk.jpg";

List playlist = [
  {
    "id": 1,
    "name": 'The Script - Hall Of Fame',
    "url":
        'https://drive.google.com/uc?export=download&id=1MtFPL8igyWB1pYb2AncDi5MDXclOf3BT',
  },
  {
    "id": 2,
    "name": 'One Direction - Perfect',
    "url":
        'https://drive.google.com/uc?export=download&id=18T-ynSTdEIepV80QWHk6bMhfJR_l69nn',
  },
  {
    "id": 3,
    "name": 'Imagine Dragons - Demons',
    "url":
        'https://drive.google.com/uc?export=download&id=11OYrPXQMmpk5QgWnL7qHnMr7gK08lrGd',
  },
  {
    "id": 4,
    "name": 'Lindsey Sterling - Carol of the Bells',
    "url":
        'https://drive.google.com/uc?export=download&id=1eTOEgG60o0mcLPl0pfHzIotcq5ZDZNfI',
  },
  {
    "id": 5,
    "name": 'Masked Wolf - Astronaut In the Ocean',
    "url":
        'https://drive.google.com/uc?export=download&id=1Vm2wum6rotJ0cPN2utuw6LHnQbl3KsHp',
  },
  {
    "id": 6,
    "name": 'Witt Lowry - Into Your Arms',
    "url":
        'https://drive.google.com/uc?export=download&id=1MuJeWufQgN5WBr87E4NZCVVbRc2U_08-',
  },
  {
    "id": 7,
    "name": 'Duncan Laurence - Arcade',
    "url":
        'https://drive.google.com/uc?export=download&id=1OYOBSew979JAILASK3jGfImpZ9gXggRS',
  },
];

var selectedIndex = null;
late AudioPlayer audioPlayer;

class _AudioPlayerState extends State<AudioPlayer> {
  bool playing = false;
  togglePlayPause() async {
    if (playing) {
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: CustomAppBar(
            username: "MUSK", url: url, appName: false, category: "SUB1"),
        body: Stack(
          children: [
            Positioned(
                top: height * 0.07,
                left: 20,
                child: Text(
                  "SUB1",
                  textWidthBasis: TextWidthBasis.parent,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color.fromRGBO(1, 138, 22, 1),
                  ),
                )),
            Positioned(
                top: height * 0.055,
                left: width * 0.2,
                child: Container(
                  height: height * 0.05,
                  width: width * 0.8,
                  child: ListView.builder(
                      itemCount: playlist.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            setState(() {
                              selectedIndex = index;
                              playing = true;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            width: width * 0.35,
                            decoration: BoxDecoration(
                                color: index == selectedIndex
                                    ? Color.fromRGBO(1, 138, 22, 1)
                                    : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: Text(
                                playlist[index]["name"].toString(),
                                textAlign: TextAlign.center,
                                textScaleFactor: 0.85,
                                style: TextStyle(
                                  color: index == selectedIndex
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: index == selectedIndex
                                      ? FontWeight.bold
                                      : FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                )),
            Positioned(
                top: height * 0.15,
                left: width * 0.12,
                right: width * 0.12,
                child: Column(
                  children: [
                    Container(
                      width: width * 0.7,
                      height: height * 0.35,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Image(
                          image: AssetImage("assets/images/hand.png"),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: height * 0.02),
                        child:
                            Image(image: AssetImage("assets/images/wv.png"))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.fast_rewind_sharp,
                          color: Color.fromRGBO(1, 138, 22, 1),
                          size: 50,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              playing = !playing;
                            });
                          },
                          child: Icon(
                            playing
                                ? Icons.pause_circle_outline
                                : Icons.play_circle_outline,
                            color: Color.fromRGBO(1, 138, 22, 1),
                            size: 60,
                          ),
                        ),
                        Icon(
                          Icons.fast_forward_sharp,
                          color: Color.fromRGBO(1, 138, 22, 1),
                          size: 50,
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: height * 0.03),
                      child: Slider(
                          value: 10,
                          onChanged: (val) {},
                          max: 100,
                          activeColor: Color.fromRGBO(1, 138, 22, 1),
                          inactiveColor: Colors.grey.shade300),
                    )
                  ],
                ))
          ],
        ));
  }
}
