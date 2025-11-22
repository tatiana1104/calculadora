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
      home: const CalculatorScreen(), // Pantalla principal
    );
  }
}

// Pantalla principal
class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  // Método reutilizable para crear botones
  Widget _buildButton({
    required String label, // Texto del botón
    required Color color, // Fondo del botón
    required Color textColor, // Color del texto
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color, // Color de fondo
        borderRadius: BorderRadius.circular(12), // Bordes redondeados
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4), // Sombra
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          label, // Texto del botón
          style: TextStyle(
            fontSize: 24, // Tamaño de texto
            fontWeight: FontWeight.bold, // Negrita
            color: textColor, // Color del texto
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
          padding: const EdgeInsets.all(16.0), // Padding general
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
                        color: Color(0xFFD4AF37), // Dorado
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

              const SizedBox(height: 20), // Espacio entre display y botones

              // === GRID DE BOTONES ===
              Expanded(
                child: GridView.count(
                  crossAxisCount: 4, // 4 columnas
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  shrinkWrap: true,

                  children: [
                    // --- FILA 1 ---
                    _buildButton(label: "C", color: const Color(0xFFE74C3C), textColor: Colors.white),
                    _buildButton(label: "←", color: const Color(0xFF3498DB), textColor: Colors.white),
                    _buildButton(label: "÷", color: const Color(0xFFD4AF37), textColor: Colors.black),
                    _buildButton(label: "×", color: const Color(0xFFD4AF37), textColor: Colors.black),

                    // --- FILA 2 ---
                    _buildButton(label: "7", color: const Color(0xFF2A2A2A), textColor: Colors.white),
                    _buildButton(label: "8", color: const Color(0xFF2A2A2A), textColor: Colors.white),
                    _buildButton(label: "9", color: const Color(0xFF2A2A2A), textColor: Colors.white),
                    _buildButton(label: "-", color: const Color(0xFFD4AF37), textColor: Colors.black),

                    // --- FILA 3 (COMMIT 13) ---
                    _buildButton(label: "4", color: const Color(0xFF2A2A2A), textColor: Colors.white),
                    _buildButton(label: "5", color: const Color(0xFF2A2A2A), textColor: Colors.white),
                    _buildButton(label: "6", color: const Color(0xFF2A2A2A), textColor: Colors.white),
                    _buildButton(label: "+", color: const Color(0xFFD4AF37), textColor: Colors.black),
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
