import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Paquete para hacer solicitudes HTTP
import 'dart:convert'; // Para trabajar con JSON

class AgePredictionScreen extends StatefulWidget {
  @override
  _AgePredictionScreenState createState() => _AgePredictionScreenState();
}

class _AgePredictionScreenState extends State<AgePredictionScreen> {
  final TextEditingController _nameController = TextEditingController(); // Controlador para el campo de texto
  int? _age; // Variable para almacenar la edad predicha
  String _ageStatus = ''; // Estado de la edad (joven, adulto, anciano)
  String? _imageUrl; // URL de la imagen según la edad

  void _predictAge() async {
    // Función para predecir la edad
    final response = await http.get(Uri.parse('https://api.agify.io/?name=${_nameController.text}')); // Llamada a la API
    if (response.statusCode == 200) {
      final data = json.decode(response.body); // Decodifica la respuesta JSON
      setState(() {
        _age = data['age']; // Almacena la edad recibida
        if (_age != null) {
          // Determina el estado y la imagen según la edad
          if (_age! < 30) {
            _ageStatus = 'Joven';
            _imageUrl = 'assets/joven.png'; 
          } else if (_age! < 60) {
            _ageStatus = 'Adulto';
            _imageUrl = 'assets/adulto.png'; 
          } else {
            _ageStatus = 'Anciano';
            _imageUrl = 'assets/anciano.png'; 
          }
        }
      });
    } else {
      setState(() {
        _age = null; 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Predicción de Edad'), // Título de la pantalla
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController, // Controlador para el campo de texto
              decoration: InputDecoration(labelText: 'Ingresa tu nombre'), 
            ),
            SizedBox(height: 20), 
            ElevatedButton(
              onPressed: _predictAge, // Acción al presionar el botón
              child: Text('Predecir Edad'),
            ),
            SizedBox(height: 30), 
            if (_age != null) // Muestra el resultado solo si la edad no es nula
              Column(
                children: [
                  Text(
                    'Edad: $_age '
                    '- Estado: $_ageStatus',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 20), 
                  if (_imageUrl != null)
                    Image.network(
                      _imageUrl!,
                      height: 300, // Ajustar el tamaño de la imagen según sea necesario
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
