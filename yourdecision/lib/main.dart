import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yourdecision/storyBrain.dart';

void main() {
  runApp(Story());
}

class Story extends StatelessWidget {
  const Story({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MainStory(),
      ),
    );
  }
}

class MainStory extends StatefulWidget {
  const MainStory({Key key}) : super(key: key);

  @override
  _MainStoryState createState() => _MainStoryState();
}

class _MainStoryState extends State<MainStory> {
  StoryBrain stBrain = StoryBrain();
  //int currentIndex = 0;
  int pictureNumber = Random().nextInt(11) + 1;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/photo$pictureNumber.jpg'),
        fit: BoxFit.cover,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: Colors.yellow.shade50.withOpacity(.7),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Text(
                stBrain.getStoryText(),
                style: TextStyle(
                  color: Colors.black.withOpacity(1),
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Row(
            //crossAxisAlignment: CrossAxisAlignment.s,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.blue.shade200.withOpacity(.6),
                width: 200,
                height: 90,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      stBrain.nextStory(1);
                      pictureNumber= Random().nextInt(11)+1;
                    });
                  },
                  child: Text(
                    stBrain.getChoice1(),
                    style: TextStyle(color: Colors.black.withOpacity(1)),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Visibility(
                visible: stBrain.visibilyCheck(),
                child: Container(
                  color: Colors.blue.shade200.withOpacity(.6),
                  width: 200,
                  height: 90,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        stBrain.nextStory(2);
                        pictureNumber= Random().nextInt(11)+1;
                      });
                    },
                    child: Text(
                      stBrain.getChoice2(),
                      style: TextStyle(color: Colors.black.withOpacity(1)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
