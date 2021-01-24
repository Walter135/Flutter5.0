import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/BotonesIconos/iconos_screen.dart';
import 'package:flutter_auth/Screens/Recargas/recargas.dart';
import 'package:flutter_auth/Screens/Transferir/transferir.dart';
import 'package:http/http.dart' as http;

/*Map<String, String> get headers => {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization":
          "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJTSU1QIiwiY3JlYXRlZCI6MTYxMTUxMTgzNzkyOSwibmFtZSI6InBydWViYTEiLCJleHAiOjE2MTE1MzM0MzcsImlhdCI6MTYxMTUxMTgzN30.h0xJG-h6CrUvWVU6Tv3pjjZARS9gQQbWB6P_x6q_QOy_BvFm6eG2f7hK7KkLDYsXtPp2HzCOW6aI0LskFHUT-g",
    };*/

Future<Post> fetchPost() async {
  Future<PostLogin> login = fetchPostLogin();

  var header = "";
  await login.then((res) {
    header = res.token;
  });
  var headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": header,
  };

  final response = await http.post(
      'http://desarrollo.odybank.com.pe:8080/SIMPHubGBC/txn-finan/consulta-movimientos',
      headers: headers,
      body: json.encode({"COD_SEG": "0062027920149335"}));

  if (response.statusCode == 200) {
    // Si la llamada al servidor fue exitosa, analiza el JSON
    return Post.fromJson(json.decode(response.body));
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

Future<PostLogin> fetchPostLogin() async {
  final response = await http.post(
      'http://desarrollo.odybank.com.pe:8080/SIMPHubGBC/auth/login',
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: '{"idCanal": "SIMP", "password": "SIMP", "idUsuario": "prueba1"}');

  if (response.statusCode == 200) {
    // Si la llamada al servidor fue exitosa, analiza el JSON
    return PostLogin.fromJson(json.decode(response.body));
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;
  final List<dynamic> movimientos;

  Post({this.userId, this.id, this.title, this.body, this.movimientos});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body'],
        movimientos: json['MOVIMIENTOS']);
  }
}

class PostLogin {
  final int userId;
  final int id;
  final String title;
  final String body;
  final String token;
  PostLogin({this.userId, this.id, this.title, this.body, this.token});

  factory PostLogin.fromJson(Map<String, dynamic> json) {
    return PostLogin(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body'],
        token: json['TOKEN']);
  }
}

List<Transacciones> parseTransacciones(String responseBody) {
  final data = json.decode(responseBody);
  // print(data);
  final parsed = data.cast<Map<String, dynamic>>();

  return parsed
      .map<Transacciones>((json) => Transacciones.fromJson(json))
      .toList();
}

class Transacciones {
  final String secuencia;
  final String tipo;
  final String monto;
  final String costo;
  final String hora;
  final String fecha;
  final String comercio;
  final String categoria;

  Transacciones(
      {this.secuencia,
      this.tipo,
      this.monto,
      this.costo,
      this.hora,
      this.fecha,
      this.comercio,
      this.categoria});

  factory Transacciones.fromJson(Map<String, dynamic> json) {
    return Transacciones(
      secuencia: json['SECUENCIA'] as String,
      tipo: json['TIPO'] as String,
      monto: json['MONTO'] as String,
      costo: json['COSTO'] as String,
      hora: json['HORA'] as String,
      fecha: json['FECHA'] as String,
      comercio: json['COMERCIO'] as String,
      categoria: json['CATEGORIA_COMERCIO'] as String,
    );
  }
}

class TransaccionesList extends StatelessWidget {
  final List<Transacciones> transacciones;
  ScrollController _scrollController =
      new ScrollController(); //permite controlar un scroll

  TransaccionesList({Key key, this.transacciones}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: transacciones.length - 2,
      shrinkWrap: true, // Use  children total size
      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
      itemBuilder: (BuildContext context, int index) {
        return Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.card_giftcard, color: Colors.blue),
                  title: Text("Tipo :" + transacciones[index].tipo),
                  subtitle: Text(
                      'Monto: ${transacciones[index].monto} ***\nFecha: ${transacciones[index].fecha}'),
                )
              ],
            ));
        //Text(transacciones[index].comercio);
      },
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  final Future<Post> post;

  WelcomeScreen({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2.0,
          centerTitle: true,
          title: Text('APP BANCARIO '),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                print("Hola");
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return IconosScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            titleSection,
            tarjeta(),
            SizedBox(height: 30.0),
            botones(context),
            SizedBox(height: 30.0),
            // _cardTipo1(),
            // SizedBox(height: 30.0),
            // _cardTipo2(),
            // SizedBox(height: 30.0),
            // _cardTipo3(),

            Center(
                child: SingleChildScrollView(
              child: FutureBuilder<Post>(
                  future: post,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return TransaccionesList(
                          transacciones: parseTransacciones(
                              json.encode(snapshot.data.movimientos)));
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    // Por defecto, muestra un loading spinner
                    return CircularProgressIndicator();
                  }),
            ))
          ],
        )
        // body: ,
        //
        );
  }

  Widget botones(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Text(
            'Historial',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blueAccent,
          onPressed: () {
            print("Historial");
          },
        ),
        FlatButton(
          child: Text('Transferir'),
          onPressed: () {
            print("Historial");
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

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.card_giftcard, color: Colors.blue),
            title: Text('Recarga'),
            subtitle: Text('Visa ***\n12-05-20'),
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.card_giftcard, color: Colors.blue),
            title: Text('Plaza Vea'),
            subtitle: Text('Shooping ***\n10 Enero - 10:37'),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: <Widget>[
          //     FlatButton(
          //       child: Text('Cancelar'),
          //       onPressed: () {},
          //     ),
          //     FlatButton(
          //       child: Text('Ok'),
          //       onPressed: () {},
          //     )
          //   ],
          // )
        ],
      ),
    );
  }

  Widget _cardTipo3() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.card_giftcard, color: Colors.blue),
            title: Text('Recarga'),
            subtitle: Text('Visa ***\n1 Enero - 12:07'),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: <Widget>[
          //     FlatButton(
          //       child: Text('Cancelar'),
          //       onPressed: () {},
          //     ),
          //     FlatButton(
          //       child: Text('Ok'),
          //       onPressed: () {},
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
