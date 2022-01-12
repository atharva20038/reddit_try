// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_field, prefer_final_fields, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:video_player/video_player.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  late VideoPlayerController _controller;
  int vote = 0;
  int voteCount = 160;
  int commentCount = 5;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    //circle avatar
                    CircleAvatar(
                      backgroundColor: Colors.black38,
                    ),
                    //heading & subheading
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //category + posts by
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                            child: Text(
                              "r/funny",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                            child: Text(
                              "Sub-Heading" + " · " + "17h",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //heading
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: Container(
                        child: Text(
                      "Newborns are so cute!",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    )),
                  ),

                  //subheading
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
                    child: Container(
                        child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.grey),
                    )),
                  ),

                  //video
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: VideoPlayer(_controller)),
                            width: MediaQuery.of(context).size.width,
                            height: 350,
                          ),
                          Container(
                            height: 10,
                            width: MediaQuery.of(context).size.width,
                            child: VideoProgressIndicator(_controller,
                                allowScrubbing: true),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //bottom bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          //upvote button
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: IconButton(
                                padding: EdgeInsets.all(0),
                                constraints: BoxConstraints(),
                                icon: Icon(
                                  Icons.arrow_upward_rounded,
                                  color: vote == 1 ? Colors.red : Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (vote == 1) {
                                      vote = 0;
                                      voteCount--;
                                    } else if (vote == 0) {
                                      vote = 1;
                                      voteCount++;
                                    } else {
                                      vote = 1;
                                      voteCount += 2;
                                    }
                                  });
                                }),
                          ),
                          //vote text
                          Text(
                            "$voteCount",
                            style: TextStyle(
                                color: vote == 1
                                    ? Colors.red
                                    : vote == -1
                                        ? Colors.blueAccent
                                        : Colors.grey),
                          ),
                          //down vote icon
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: IconButton(
                                padding: EdgeInsets.all(0),
                                constraints: BoxConstraints(),
                                icon: Icon(
                                  Icons.arrow_downward_rounded,
                                  color: vote == -1
                                      ? Colors.blueAccent
                                      : Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (vote == -1) {
                                      vote = 0;
                                      voteCount++;
                                    } else if (vote == 0) {
                                      vote = -1;
                                      voteCount--;
                                    } else {
                                      vote = -1;
                                      voteCount -= 2;
                                    }
                                  });
                                }),
                          ),
                        ],
                      ),

                      //comments
                      InkWell(
                        onTap: () {
                          print("Comment Section!");
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.comment_outlined,
                              size: 23,
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "$commentCount",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //share button
                      InkWell(
                        onTap: () {
                          print("Share this post!");
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.share,
                              size: 23,
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Share",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //awards
                      InkWell(
                        onTap: () {
                          print("Awards!");
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.shopping_bag_outlined,
                              size: 23,
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Awards",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
