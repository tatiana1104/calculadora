import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //bandera de debug
      title: 'Calculadora',
      theme: ThemeData(
        brightness: Brightness.dark, // Tema oscuro para toda la app
        useMaterial3: true,
      ),
      home: const CalculatorScreen(), // Pantalla principal
    );
  }
}

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A), // Fondo oscuro
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0), // Separación de bordes
          child: Column(
            children: [
              SizedBox(
                width: double.infinity, // Ocupar todo el ancho disponible
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0xFF2A2A2A), // Fondo gris oscuro del display
                    borderRadius: BorderRadius.all(
                      Radius.circular(16), // Bordes redondeados
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54, // Sombra negra suave
                        blurRadius: 12,        // Difuminado de la sombra
                        offset: Offset(0, 8),  // Posición de la sombra
                      ),
                    ],
                  ),

                  // Espacio interno del display
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: SizedBox(
                      height: 80, // Altura donde luego irá el texto
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}