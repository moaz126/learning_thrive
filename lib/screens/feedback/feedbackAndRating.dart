import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:rating_dialog/rating_dialog.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: feedbackPage(),
    );
  }
}

class feedbackPage extends StatefulWidget {
  @override
  _feedbackPageState createState() => _feedbackPageState();
}

class _feedbackPageState extends State<feedbackPage> {
  double rating = 2.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("App Rating stars")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Library First :  'Smooth Star Rating' ",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              SmoothStarRating(
                rating: rating,
                size: 35,
                filledIconData: Icons.star,
                halfFilledIconData: Icons.star_half,
                defaultIconData: Icons.star_border,
                starCount: 5,
                allowHalfRating: true,
                spacing: 2.0,
                onRated: (value) {
                  setState(() {
                    rating = value;
                    print(rating);
                  });
                },
              ),
              Text(
                "You have Selected : $rating Star",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Library Second:  'Rating_Dialog ' ",
                style: TextStyle(fontSize: 20, color: Colors.deepOrange),
              ),
              RaisedButton(
                onPressed: () {
                  show1();
                },
                child: Text("Open Flutter Rating Dialog Box"),
              )
            ],
          ),
        ));
  }

  void show1() {
    showDialog(
        context: context,
        barrierDismissible: true, // set to false if you want to force a rating
        builder: (context) {
          return RatingDialog(
            icon: const Icon(
              Icons.star,
              size: 100,
              color: Colors.blue,
            ), // set your own image/icon widget
            title: "Flutter Rating Dialog",
            description: "Tap a star to give your rating.",
            submitButton: "SUBMIT",
            alternativeButton: "Contact us instead?", // optional
            positiveComment: "We are so happy to hear 😍", // optional
            negativeComment: "We're sad to hear 😭", // optional
            accentColor: Colors.blue, // optional
            onSubmitPressed: (int rating) {
              print("onSubmitPressed: rating = $rating");
              // TODO: open the app's page on Google Play / Apple App Store
            },
            onAlternativePressed: () {
              print("onAlternativePressed: do something");
              // TODO: maybe you want the user to contact you instead of rating a bad review
            },
          );
        });
  }
}
