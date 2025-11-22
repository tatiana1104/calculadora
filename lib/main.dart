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

// Pantalla principal
class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  // === Método reutilizable para crear botones (Commit 8) ===
  Widget _buildButton(String label, {Color? backgroundColor, Color? textColor}) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color(0xFF2A2A2A), // Fondo por defecto
        borderRadius: BorderRadius.circular(12), // Botones redondeados
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 24, // Tamaño del texto
            fontWeight: FontWeight.bold, // Negrita
            color: textColor ?? Colors.white, // Texto blanco por defecto
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A), // Fondo general
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // === Display principal ===
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A2A),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 12,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      "12 +",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFD4AF37),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "0",
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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
