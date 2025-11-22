import 'package:flutter/material.dart';

// Punto de entrada de la app
void main() {
  runApp(const CalculatorApp());
}

// Widget raíz de la app
class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //bandera de debug
      title: 'Calculadora',
      theme: ThemeData(
        brightness: Brightness.dark, // Tema oscuro
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

// Pantalla principal de la calculadora
class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A), // Fondo oscuro general
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding externo
          child: Column(
            children: [
              // === Display completo (Commit 7) ===
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24), // Padding interno
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A2A), // Fondo del display
                  borderRadius: BorderRadius.circular(16), // Bordes redondeados
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5), // Sombra marcada
                      blurRadius: 12,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end, // Alineación derecha
                  children: const [
                    // === Texto de la operación anterior ===
                    Text(
                      "12 +", // Temporal
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFD4AF37), // Dorado
                      ),
                    ),

                    SizedBox(height: 8), // Separación entre textos

                    // === Texto principal del número ===
                    Text(
                      "0", // Temporal
                      style: TextStyle(
                        fontSize: 48, // Tamaño grande
                        fontWeight: FontWeight.bold, // Negrita
                        color: Colors.white, // Blanco
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
