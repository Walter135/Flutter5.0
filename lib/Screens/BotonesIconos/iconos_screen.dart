import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Block/block_screen.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Welcome2/welcome2_screen.dart';

class IconosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("APP"),
        ),
        body: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 4 / 3,
          children: <Widget>[
            Opcion(
              text: 'Inicio',
              child: FloatingActionButton(
                heroTag: "opcion1",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return WelcomeScreen(
                          post: fetchPost(),
                        );
                      },
                    ),
                  );
                },
                child: Icon(Icons.credit_card, size: 30),
              ),
            ),
            Opcion(
              text: 'Crédito',
              child: FloatingActionButton(
                  heroTag: "opcion2",
                  onPressed: () {},
                  child: Icon(Icons.money, size: 30)),
            ),
            Opcion(
              text: 'Hablemos',
              child: FloatingActionButton(
                  heroTag: "opcion3",
                  onPressed: () {},
                  child: Icon(Icons.chat_bubble, size: 30)),
            ),
            Opcion(
              text: 'Bloqueo',
              child: FloatingActionButton(
                  heroTag: "opcion4",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return BlockScreen();
                        },
                      ),
                    );
                  },
                  child: Icon(Icons.block_rounded, size: 30)),
            ),
            Opcion(
              text: 'Cerrar Sesión',
              child: FloatingActionButton(
                heroTag: "opcion5",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
                child: Icon(Icons.close_rounded, size: 30),
              ),
            ),
          ],
        ));
  }
}

class Opcion extends StatelessWidget {
  final Widget child;
  final String text;

  const Opcion({
    Key key,
    @required this.child,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              this.child,
              SizedBox(height: 20),
              Text(
                this.text,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
