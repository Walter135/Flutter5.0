import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Recargas/recargas.dart';
import 'package:flutter_auth/Screens/Welcome2/welcome2_screen.dart';

class Transferir extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2.0,
          centerTitle: true,
          title: Text('APP BANCARIO '),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            titleSection,
            tarjeta(),
            SizedBox(height: 30.0),
            botones(context),
            SizedBox(height: 30.0),
            Divider(),
            _crearContacto(),
            Divider(),
            _crearMontoTransferir(),
            Divider(),
            _crearMensaje(),
            Divider(),
            enviar(context)
          ],
        )));
  }

  Widget enviar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MaterialButton(
          color: Colors.blue,
          child: Text('Transferir', style: TextStyle(color: Colors.white)),
          onPressed: () {
            print("Enviar Data");
          },
        ),
      ],
    );
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
          child: Text(
            'Transferir',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blueAccent,
          onPressed: () {
            print("Transferir");
          },
        ),
        FlatButton(
          child: Text('Recargas'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Recargas();
                },
              ),
            );
          },
        ),
        FlatButton(
          child: Text('Ajustes'),
          onPressed: () {},
        )
      ],
    );
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

  Widget _crearContacto() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Nombre del contacto',
        labelText: 'Contacto',
        // helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.search),
        // icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor) {},
    );
  }

  Widget _crearMontoTransferir() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Monto',
        labelText: 'Monto',
        // helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        // icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor) {},
    );
  }

  Widget _crearMensaje() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Mensaje a enviar',
        labelText: 'Mensaje',
        // helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        // icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor) {},
    );
  }
}
