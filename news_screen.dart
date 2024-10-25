import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Paquete para realizar solicitudes HTTP
import 'dart:convert'; // Para trabajar con JSON
import 'package:url_launcher/url_launcher.dart'; // Para abrir enlaces en el navegador

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List _newsArticles = []; // Lista para almacenar artículos de noticias

  void _fetchNews() async {
    final response = await http.get(Uri.parse('https://www.udoym.edu.do/wp-json/wp/v2/posts')); 

    if (response.statusCode == 200) {
      final data = json.decode(response.body); // Decodifica la respuesta JSON
      setState(() {
        // Obtener solo las últimas 3 noticias
        _newsArticles = data.take(3).toList(); // Almacena las 3 primeras noticias
      });
    } else {
      // Manejo de errores
      throw Exception('Error al cargar noticias'); // Lanza una excepción si hay un error en la solicitud
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Noticias De La OYM')), // Título de la barra de aplicaciones
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Espaciado alrededor del contenido
        child: Column(
          children: [
            // Logo de la página
            Image.network(
              'assets/oym.jpg', // URL del logo
              width: 180, // Ancho de la imagen
              height: 180, // Altura de la imagen
            ),
            SizedBox(height: 16), // Espacio entre el logo y el botón
            ElevatedButton(
              onPressed: _fetchNews, // Llama a la función para cargar noticias al presionar el botón
              child: Text('Noticias'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _newsArticles.length, // Número de artículos en la lista
                itemBuilder: (context, index) {
                  final article = _newsArticles[index]; // Obtiene el artículo actual
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0), // Margen vertical para las tarjetas
                    child: ListTile(
                      title: Text(article['title']['rendered']), // Título del artículo
                      subtitle: Text(
                        article['excerpt']['rendered'].replaceAll(RegExp(r'<[^>]*>'), ''), // Resumen sin HTML
                        maxLines: 2, // Número máximo de líneas
                        overflow: TextOverflow.ellipsis, // Agrega puntos suspensivos si el texto es muy largo
                      ),
                      trailing: TextButton(
                        onPressed: () {
                          launch(article['link']); // Abre la URL de la noticia al presionar el botón
                        },
                        child: Text('Leer Más'), // Texto del botón
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
