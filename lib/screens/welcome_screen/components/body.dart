import 'package:flutter/material.dart';
import 'package:learning_thrive/screens/login_screen.dart';
import 'package:learning_thrive/screens/registration_screen.dart';
import 'package:learning_thrive/screens/tutor_login/tutor_login_screen.dart';
import 'package:learning_thrive/screens/welcome_screen/components/background.dart';
import 'rounded_button.dart';
import 'constants.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME TO LEARNING THRIVE",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/images/chat.svg",
              height: size.height * 0.45,
            ),
            Text(
              "ARE YOU",
              style: TextStyle(fontWeight: FontWeight.bold,height: 3),
            ),
            SizedBox(height: size.height * 0.02),
            RoundedButton(
              text: "STUDENT",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "TUTOR",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TLoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}