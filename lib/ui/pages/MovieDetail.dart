import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/ui/components/CastRowList.dart';

class MovieDetail extends StatelessWidget {
  final int id;

  MovieDetail({this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.play_arrow,
          color: Colors.black,
        ),
        backgroundColor: Colors.yellow,
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 280,
                    child: Image.network(
                      "https://image.tmdb.org/t/p/original/auZIuHEUec5tBTns3tCRXfayxZq.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 15,
                    child: Text(
                      "Wonder Woman 1978",
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Wonder Woman 1978",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(color: Colors.yellow, fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      "2020 | ",
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(color: Colors.white60),
                      ),
                    ),
                    Text(
                      "120 min | ",
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(color: Colors.white60),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.yellow,
                        ),
                        Text(
                          " | ",
                          style: TextStyle(color: Colors.white60),
                        )
                      ],
                    ),
                    Text(
                      "9.3 rating",
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(color: Colors.white60),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "You can load an Image ahead of being request in the ui with the precacheImage method. Any future requests for a matching image - the same url in the case of a network image - will pull from the cache. To load a network image, you can pass it an instance of the NetworkImage class.",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(color: Colors.white60, height: 1.6),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.video_library,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        Text(
                          "Trailer",
                          style: GoogleFonts.lato(
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.share,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        Text(
                          "Share",
                          style: GoogleFonts.lato(
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        Text(
                          "My List",
                          style: GoogleFonts.lato(
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.thumb_up,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        Text(
                          "Rate",
                          style: GoogleFonts.lato(
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.download_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        Text(
                          "Download",
                          style: GoogleFonts.lato(
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Casts",
                      style: GoogleFonts.lato(
                        textStyle:
                            TextStyle(color: Colors.yellow, fontSize: 18),
                      ),
                    ),
                    Container(
                      height: 6,
                      width: 40,
                      color: Colors.yellow,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CastRowList()
            ],
          ),
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ]),
    );
  }
}
