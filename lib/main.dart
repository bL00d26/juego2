import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> singulares = ['vestido', 'aceite', 'ciudad', 'tijera'];
  List<String> plurales = ['dedos', 'rábanos', 'relojes', 'amigos'];
  Map<String, bool> estados;
  List<String> singularTerminado = [];
  List<String> pluralTerminado = [];
  @override
  void initState() {
    super.initState();
    estados = {
      "vestido": false,
      "aceite": false,
      "ciudad": false,
      "tijera": false,
      "rábanos": false,
      "relojes": false,
      "amigos": false,
      "dedos": false,
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juego 2',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.amber,
          body: Stack(
            children: <Widget>[
              _fondo(),
              Column(
                children: <Widget>[
                  _header(),
                  _botonesDrag(),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 300,
                        child: Center(child: Text("Singular")),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 300,
                        child: Center(child: Text("Plural")),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _dragZoneSingular(),
                      SizedBox(
                        width: 20,
                      ),
                      _dragZonePlural()
                    ],
                  ),
                  Expanded(child: Container()),
                  Padding(
                    padding: EdgeInsets.only(bottom: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              child: Text("Reiniciar"),
                              
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              reiniciar();
                            });
                          },
                          color: Colors.limeAccent,
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }

  Widget _fondo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image(
            image: AssetImage("assets/logo.png"),
          ),
          SizedBox(
            width: 100,
          ),
          Text(
            "Lee las palabras y unelas con los dibujos segun corresponda",
            style: TextStyle(fontSize: 20.0),
          )
        ],
      ),
    );
  }

  Widget _botonesDrag() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _boton("vestido"),
        SizedBox(
          width: 10,
        ),
        _boton("aceite"),
        SizedBox(
          width: 10,
        ),
        _boton("dedos"),
        SizedBox(
          width: 10,
        ),
        _boton("rábanos"),
        SizedBox(
          width: 10,
        ),
        _boton("ciudad"),
        SizedBox(
          width: 10,
        ),
        _boton("relojes"),
        SizedBox(
          width: 10,
        ),
        _boton("tijera"),
        SizedBox(
          width: 10,
        ),
        _boton("amigos"),
      ],
    );
  }

  Widget _boton(String palabra) {
    return Draggable<String>(
      data: palabra,
      feedback: Container(
          padding: EdgeInsets.all(10.0),
          child: Text(
            palabra,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
                color: Colors.black),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.lightBlueAccent)),
      child: estados[palabra] == false
          ? Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                palabra,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                    color: Colors.black),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.lightBlueAccent))
          : Container(),
      childWhenDragging: Container(),
      onDragCompleted: () => Container(),
    );
  }

  Widget _dragZoneSingular() {
    return DragTarget<String>(
      builder: (context, candidateData, rejectedData) {
        return Container(
          child: (singularTerminado.length <= 0)
              ? Container()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _listaDeBotonesSingular()),
          width: 300,
          height: 250,
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.black, width: 5.0)),
        );
      },
      onWillAccept: (data) => singulares.contains(data),
      onAccept: (data) {
        setState(() {
          estados[data] = true;
          singularTerminado.add(data);
        });
      },
    );
  }

  Widget _dragZonePlural() {
   return DragTarget<String>(
      builder: (context, candidateData, rejectedData) {
        return Container(
          child: (pluralTerminado.length <= 0)
              ? Container()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _listaDeBotonesPlural()),
          width: 300,
          height: 250,
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.black, width: 5.0)),
        );
      },
      onWillAccept: (data) =>plurales.contains(data),
      onAccept: (data) {
        setState(() {
          estados[data] = true;
          pluralTerminado.add(data);
        });
      },
    );
  }

  void reiniciar() {
    singularTerminado = [];
    pluralTerminado = [];
    estados = {
      "vestido": false,
      "aceite": false,
      "ciudad": false,
      "tijera": false,
      "rábanos": false,
      "relojes": false,
      "amigos": false,
      "dedos": false,
    };
  }

  List<Widget> _listaDeBotonesSingular() {
    List<Widget> listaItems = [];

    singularTerminado.forEach((element) {
      listaItems.add(
        Column(
          children: <Widget>[
            SizedBox(height: 5.0,),
            Container(
          padding: EdgeInsets.all(10.0),
          child: Text(
            element,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
                color: Colors.black),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.lightBlueAccent)),
            SizedBox(height: 5.0,)
          ],
        )
        );
    });
    return listaItems;
  }
  List<Widget> _listaDeBotonesPlural() {
    List<Widget> listaItems = [];

    pluralTerminado.forEach((element) {
      listaItems.add(
        Column(
          children: <Widget>[
            SizedBox(height: 5.0,),
            Container(
          padding: EdgeInsets.all(10.0),
          child: Text(
            element,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
                color: Colors.black),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.lightBlueAccent)),
            SizedBox(height: 5.0,)
          ],
        )
        );
    });
    return listaItems;
  }
}
