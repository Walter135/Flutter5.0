import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Welcome2/welcome2_screen.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';

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
              "Hola, Usuario!",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              "Hola, Usuario!",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            RoundedButton(
              text: "Volver a mis Tarjetas",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WelcomeScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            new Image.asset(
              "assets/images/lock.png",
              height: 250,
            ),
            SizedBox(height: size.height * 0.03),
            Text(
                "Si perdiste o te robaron el celular, suspende tu cuenta ingresando tus\n datos a través de otro celular desde nuestra app o página web."),
            SizedBox(height: size.height * 0.03),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 85, top: 10, bottom: 10),
                  width: size.width * 0.3,
                  child: Text(
                    "Correo Electrónico",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )),
            RoundedInputField(
              hintText: "Ingrese su correo electrónico",
              onChanged: (value) {},
            ),
            SizedBox(height: size.height * 0.03),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 85, top: 10, bottom: 10),
                  width: size.width * 0.3,
                  child: Text(
                    "Nombre y Apellido",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )),
            RoundedInputField(
              hintText: "Ingrese su Nombre y Apellido",
              onChanged: (value) {},
            ),
            SizedBox(height: size.height * 0.03),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 85, top: 10, bottom: 10),
                  width: size.width * 0.3,
                  child: Text(
                    "Nombre y Apellido",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "Bloquear",
              press: () {},
            )
          ],
        ),
      ),
    );
  }
}
