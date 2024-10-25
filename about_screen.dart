import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contáctame'), // Título de la pantalla
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Carga tu foto desde una URL en un círculo
           Image.network(
              'assets/yo.jpeg', 
              width: 300,
              height: 300,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error, size: 50); // Muestra un ícono de error si no se puede cargar la imagen
              },
            ),
            SizedBox(height: 20), // Espacio entre la imagen y el texto
            Text(
              'Johndy Stany Ceballos Jimenez', // Tu nombre
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold), // Letras más grandes
            ),
            SizedBox(height: 10), // Espacio entre el nombre y el correo
            Text(
              'jondystany@gmail.com', // Tu correo
              style: TextStyle(fontSize: 20), // Letras más grandes
            ),
            SizedBox(height: 10), // Espacio entre el correo y el teléfono
            Text(
              'Número Telefónico: +1809-857-0875', // Tu número de teléfono
              style: TextStyle(fontSize: 20), // Letras más grandes
            ),
          ],
        ),
      ),
    );
  }
}
