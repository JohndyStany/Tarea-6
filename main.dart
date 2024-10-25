import 'package:flutter/material.dart'; // Paquete para crear la interfaz de usuario
import 'screens/gender_prediction_screen.dart'; // Pantalla para predicción de género
import 'screens/age_prediction_screen.dart'; // Pantalla para predicción de edad
import 'screens/universities_screen.dart'; // Pantalla para mostrar universidades
import 'screens/weather_screen.dart'; // Pantalla del clima
import 'screens/news_screen.dart'; // Pantalla de noticias
import 'screens/about_screen.dart'; // Pantalla "Acerca de"

void main() {
  runApp(MyApp()); // Inicia la aplicación
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Herramienta de Predicción', // Título de la aplicación
      theme: ThemeData(
        primarySwatch: Colors.red, // Color primario de la aplicación
      ),
      home: HomeScreen(), // Pantalla principal al iniciar la aplicación
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Índice para la pantalla seleccionada

  // Lista de widgets que representan cada pantalla
  static final List<Widget> _widgetOptions = <Widget>[
    HomeView(),                 // Pantalla principal con la caja de herramientas
    GenderPredictionScreen(),   // Pantalla de predicción de género
    AgePredictionScreen(),      // Pantalla de predicción de edad
    UniversitiesScreen(),       // Pantalla de universidades
    WeatherScreen(),            // Pantalla del clima
    NewsScreen(),               // Pantalla de noticias
    AboutScreen(),              // Pantalla "Acerca de"
  ];

  // Cambia el índice seleccionado cuando un ítem es tocado
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Actualiza el índice seleccionado
    });
    Navigator.pop(context); // Cierra el Drawer cuando se selecciona una opción
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 197, 197, 247), // Fondo rosado claro
      appBar: AppBar(
        title: Text('Herramienta de Predicción'), // Título en la barra de aplicaciones
        backgroundColor: const Color.fromARGB(255, 46, 152, 171), // Color de fondo de la barra de aplicaciones
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu), // Icono de menú en la esquina superior izquierda
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Abre el Drawer al presionar el botón
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 46, 152, 171), // Color de fondo del encabezado del Drawer
              ),
              child: Text(
                'Menú de Opciones',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
  leading: Icon(Icons.build), // Cambiado a un icono de construcción
  title: Text('Inicio'),
  onTap: () => _onItemTapped(0),
),
ListTile(
  leading: Icon(Icons.person_outline), // Cambiado a un icono de persona
  title: Text('Género'),
  onTap: () => _onItemTapped(1),
),
ListTile(
  leading: Icon(Icons.cake_outlined), // Cambiado a una variación del icono de pastel
  title: Text('Edad'),
  onTap: () => _onItemTapped(2),
),
ListTile(
  leading: Icon(Icons.account_balance), // Cambiado a un icono de institución
  title: Text('Universidades'),
  onTap: () => _onItemTapped(3),
),
ListTile(
  leading: Icon(Icons.thermostat), // Cambiado a un icono de temperatura
  title: Text('Clima'),
  onTap: () => _onItemTapped(4),
),
ListTile(
  leading: Icon(Icons.article_outlined), // Cambiado a una variación del icono de artículos
  title: Text('Noticias'),
  onTap: () => _onItemTapped(5),
),
ListTile(
  leading: Icon(Icons.info_outline), // Cambiado a una variación del icono de información
  title: Text('Acerca de'),
  onTap: () => _onItemTapped(6),
),

          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex), // Muestra la pantalla seleccionada
      ),
    );
  }
}

// Crear una pantalla de inicio que muestre la caja de herramientas
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Centra el contenido verticalmente
      children: [
        // Carga la imagen desde una URL
        Image.network(
          'assets/Caja.png', // URL de la imagen
          width: 200, // Ancho de la imagen
          height: 200, // Altura de la imagen
        ),
        SizedBox(height: 20), // Espacio entre la imagen y el texto
        Text(
          'Caja de Herramientas', // Mensaje de bienvenida
          style: TextStyle(fontSize: 24, color: const Color.fromARGB(255, 12, 120, 139)), // Estilo del texto
          textAlign: TextAlign.center, // Alineación del texto
        ),
        SizedBox(height: 20), // Espacio entre los textos
        Text(
          'Elige una opción en el menú para comenzar.', // Instrucción para el usuario
          style: TextStyle(fontSize: 16, color: Colors.grey[800]), // Estilo del texto
          textAlign: TextAlign.center, // Alineación del texto
        ),
      ],
    );
  }
}
