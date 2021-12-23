import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:learning_thrive/model/user_model.dart';
import 'package:learning_thrive/screens/Lecture_material/upload_files.dart';
import 'package:learning_thrive/screens/LocateTutor.dart';
import 'package:learning_thrive/screens/ScheduleMeeting/calendar.dart';
import 'package:learning_thrive/screens/welcome_screen/components/rounded_button.dart';

import 'package:learning_thrive/screens/Assesments/upload_assesments.dart';
import 'tutor_login_screen.dart';

class THomeScreen extends StatefulWidget {
  const THomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<THomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tutor Home"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Color(0xFFF0F0F0),
                    Color(0xFFD4E7FE),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      child: RichText(
                        text: TextSpan(
                            text: "Thursday",
                            style: TextStyle(
                                color: Color(0XFF263064),
                                fontSize: 12,
                                fontWeight: FontWeight.w800),
                            children: [
                              TextSpan(
                                text: " 16 Dec",
                                style: TextStyle(
                                    color: Color(0XFF263064),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              )
                            ]),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(width: 1, color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey.withOpacity(0.2),
                                spreadRadius: 10,
                              )
                            ],
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(""),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Hi Dude",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                                color: Color(0XFF343E87),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                top: 185,
                child: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: MediaQuery.of(context).size.height - 245,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      RoundedButton(
                        text: "Schedule Meeting",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return schedule_meeting();
                              },
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      RoundedButton(
                        text: "Lecture Materials",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return uploadfile();
                              },
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      RoundedButton(
                        text: "Assesment",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return uploadAssesment();
                              },
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ActionChip(
                          label: const Text("Logout"),
                          onPressed: () {
                            logout(context);
                          }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => TLoginScreen()));
  }
}
