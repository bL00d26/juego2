import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> singulares = ['vestido','aceite','ciudad','tijera'];
  List<String> plurales = ['dedos','rábanos','relojes','amigos'];
  Map<String,bool> estadosSingulares;
  @override
  void initState() { 
    super.initState();
    estadosSingulares ={
    "vestido":false,
    "aceite":false,
    "ciudad":false,
    "tijera":false,    
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
                SizedBox(height: 30,),
                Row(                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _dragZoneSingular(),
                    SizedBox(width: 20,),
                    _gragZonePlural()
                  ],
                ),
              ],
            )
            
          ],
        )
      ),
    );
  }

  Widget _fondo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white          
        ),
        
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,        
        children: <Widget>[
          Image(
            image: AssetImage("assets/logo.png"),
          ),  
          SizedBox(width: 100,),       
          Text("Lee las palabras y unelas con los dibujos segun corresponda",style: TextStyle(fontSize: 20.0),)
          
        ],
      ),
    );
  }

  Widget _botonesDrag() {
    return Row( 
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _boton("vestido"),
        SizedBox(width: 10,),
        _boton("aceite"),
        SizedBox(width: 10,),
        _boton("dedos"),
        SizedBox(width: 10,),
        _boton("rábanos"),
        SizedBox(width: 10,),
        _boton("ciudad"),
        SizedBox(width: 10,),
        _boton("relojes"),
        SizedBox(width: 10,),
        _boton("tijera"),
        SizedBox(width: 10,),
        _boton("amigos"),        
      ],
    );
  }

 Widget _boton(String palabra) {
   return Draggable<String>(
     data: palabra,
     feedback: Container(
       padding: EdgeInsets.all(10.0),
       child: Text(palabra,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,fontStyle: FontStyle.normal, color: Colors.black),),
       decoration:BoxDecoration(
         borderRadius: BorderRadius.circular(10.0),
         color: Colors.lightBlueAccent
       )
     ),
     child: Container(
       padding: EdgeInsets.all(10.0),
       child: Text(palabra,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,fontStyle: FontStyle.normal, color: Colors.black),),
       decoration:BoxDecoration(
         borderRadius: BorderRadius.circular(10.0),
         color: Colors.lightBlueAccent
       )
     ),
     childWhenDragging:Container(),
     onDragCompleted: () => Container(),

   );
 }

  Widget _dragZoneSingular() {
    return DragTarget<String>(
      builder: (context, candidateData, rejectedData) {
        return Container(
          child: Align(child: Text("Singular"),alignment: AlignmentDirectional.topCenter,),
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            color:Colors.transparent,
            border: Border.all(
              color: Colors.black,
              width: 5.0
            )
          ),
        );
      },
      onWillAccept: (data) => singulares.contains(data),
      onAccept: (data){
        setState(() {
          print("aceptado");
          
        });
      },
     
    );
  }

  Widget _gragZonePlural() {
    return DragTarget<String>(
      builder: (context, candidateData, rejectedData) {
        return Container(
          child: Align(child: Text("Plural"),alignment: AlignmentDirectional.topCenter,),
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            color:Colors.transparent,
            border: Border.all(
              color: Colors.black,
              width: 5.0
            )
          ),
        );
      },
      onWillAccept: (data) => plurales.contains(data),
      onAccept: (data){
        setState(() {
          print("aceptado");
        });
      },
     
    );
  }
}
