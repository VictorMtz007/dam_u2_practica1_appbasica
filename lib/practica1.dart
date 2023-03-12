import 'package:flutter/material.dart';

class Practica1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Practica1();
  }
}

class _Practica1 extends State<Practica1> {
  final usuario = TextEditingController();
  final contra = TextEditingController();
  bool condicion = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Practica1 - Login"),
        centerTitle: true,
        actions: [IconButton(onPressed: (){
          setState(() {
            usuario.text="";
            contra.text="";
            condicion = false;
          });
        }, icon: Icon(Icons.cleaning_services_sharp))],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
          Image.asset('assets/Candadin.png',width: 160, height: 160,),
          Text(
            "Ingresa tus datos",
            style: TextStyle(fontSize: 30, color: Colors.deepPurple),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.all(30),
            child: TextField(
              controller: usuario,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.account_box),
                  labelText: " Usuario: ",
                border: UnderlineInputBorder()
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 30,
                top: 0,
                right: 30,
                bottom: 30),
            child: TextField(
              obscureText: true,
              controller: contra,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  labelText: " Contraseña: ",
                  border: UnderlineInputBorder(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                  value: condicion,
                  onChanged: (value){
                    setState(() {
                      condicion = value!;
                    });
                  }),Text("No soy un robot"),
            ],
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){

            if (condicion == false) {
              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: Text("Verificacion Incompleta"),
                      content: Text("Marca la casilla para confirmar que no seas un robot",),
                      actions: [
                        TextButton(onPressed: (){
                          Navigator.of(context).pop();
                        }, child: Text("Ok"))
                      ],
                    );
                  });
            } else {

              datos(usuario.text, contra.text);

            }

          }, child: Icon(Icons.login),),
        ],
      ),
    );
  }

  void datos(String usu, String cont) {

    if (usuario.text == "" || contra.text == "") {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error")));

      showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: Text("Datos Incompletos"),
              content: Text("Rellena todos los datos necesarios",),
              actions: [
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text("Ok"))
              ],
            );
          });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Sesion iniciada correctamente")));

      showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: Text("DATOS"),
              content: Text("Usuario: ${usu}\nContraseña: ${cont}",),
              actions: [
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text("Ok"))
              ],
            );
          });
    }

  }

}
