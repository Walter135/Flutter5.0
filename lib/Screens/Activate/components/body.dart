import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_card_field.dart';
import 'package:flutter_auth/components/card_field_container.dart';
import 'package:flutter_auth/constants.dart';

class Body extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const Body({Key key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Activar Tarjeta Física",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              "Ingrese los datos de tu Tarjeta Física",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            new Image.asset(
              "assets/images/activate.jpg",
              height: 350,
            ),
            SizedBox(height: size.height * 0.03),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 85, top: 10, bottom: 10),
                  width: size.width * 0.3,
                  child: Text(
                    "Numero de la Tarjeta",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )),
            RoundedCardField(
              onChanged: (value) {},
            ),
            Row(children: [
              Container(
                margin: EdgeInsets.only(left: 80, top: 10, bottom: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.3,
                child: Text(
                  "CVV",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 150, top: 10, bottom: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.3,
                child: Text(
                  "Fecha Expirado",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ]),
            Row(
              children: [
                CardFieldContainer(
                  leftT: 80.0,
                  child: TextField(
                    obscureText: true,
                    onChanged: onChanged,
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                      hintText: "XXX",
                      /*suffixIcon: Icon(
                        Icons.credit_card,
                        color: kPrimaryColor,
                      ),*/
                      border: InputBorder.none,
                    ),
                  ),
                ),
                CardFieldContainer(
                  leftT: 150.0,
                  child: TextField(
                    obscureText: true,
                    onChanged: onChanged,
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                      hintText: "MM/YY",
                      /*suffixIcon: Icon(
                        Icons.credit_card,
                        color: kPrimaryColor,
                      ),*/
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "Activar",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
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
