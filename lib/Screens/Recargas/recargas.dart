import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Transferir/transferir.dart';
import 'package:flutter_auth/Screens/Welcome2/welcome2_screen.dart';

class Recargas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2.0,
          centerTitle: true,
          title: Text('APP BANCARIO '),
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          titleSection,
          tarjeta(),
          SizedBox(height: 30.0),
          botones(context),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              recargarConTarjetas(context),
              recargarConEfectivo(context)
            ],
          )
        ])));
  }

  Widget tarjeta() {
    return Container(
        height: 150,
        width: 350,
        child: Card(
          elevation: 10.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text("XXX-XXX-XXX")],
          ),
        ));
  }

  Widget botones(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Text('Historial'),
          onPressed: () {
            print("Historial");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return WelcomeScreen(post: fetchPost());
                },
              ),
            );
          },
        ),
        FlatButton(
          child: Text('Transferir'),
          onPressed: () {
            print("Transferir");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Transferir();
                },
              ),
            );
          },
        ),
        FlatButton(
          child: Text(
            'Recargas',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blueAccent,
          onPressed: () {},
        ),
        FlatButton(
          child: Text('Ajustes'),
          onPressed: () {},
        )
      ],
    );
  }

  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Mostrar Saldo',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'S/15000',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );

  Widget recargarConTarjetas(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MaterialButton(
          color: Colors.blue,
          child: Text('Recarga con tus tarjetas',
              style: TextStyle(color: Colors.white)),
          onPressed: () {
            print("Recarga con tarjeta");
          },
        ),
      ],
    );
  }

  Widget recargarConEfectivo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MaterialButton(
          // color: Colors.blue,
          child: Text('Recarga con efectivo'),
          onPressed: () {
            print("Recarga con efectivo");
          },
        ),
      ],
    );
  }
}
