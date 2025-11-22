import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp()); // inicia la app
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  // Método para crear botones reutilizables
  Widget _buildButton(String text, Color backgroundColor, Color textColor) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor, // fondo del botón
        borderRadius: BorderRadius.circular(12), // bordes redondeados
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5), // sombra negra con opacidad
            blurRadius: 8, // suavizado sombra
            offset: const Offset(0, 4), // desplazamiento vertical
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: textColor, // color del texto
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A), // fondo general
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // === Display ===
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A2A), // fondo display
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
                      "12 +", // operación anterior
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFD4AF37),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "0", // valor principal
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32), // spacing vertical

              // === Grid de botones con BoxShadow agregado ===
              Expanded(
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: [
                    // Fila 1: C, ←, ÷, ×
                    _buildButton("C", const Color(0xFFE74C3C), Colors.white),
                    _buildButton("←", const Color(0xFF3498DB), Colors.white),
                    _buildButton("÷", const Color(0xFFD4AF37), Colors.black),
                    _buildButton("×", const Color(0xFFD4AF37), Colors.black),

                    // Fila 2: 7, 8, 9, -
                    _buildButton("7", const Color(0xFF2A2A2A), Colors.white),
                    _buildButton("8", const Color(0xFF2A2A2A), Colors.white),
                    _buildButton("9", const Color(0xFF2A2A2A), Colors.white),
                    _buildButton("-", const Color(0xFFD4AF37), Colors.black),

                    // Fila 3: 4, 5, 6, +
                    _buildButton("4", const Color(0xFF2A2A2A), Colors.white),
                    _buildButton("5", const Color(0xFF2A2A2A), Colors.white),
                    _buildButton("6", const Color(0xFF2A2A2A), Colors.white),
                    _buildButton("+", const Color(0xFFD4AF37), Colors.black),

                    // Fila 4: 1, 2, 3, =
                    _buildButton("1", const Color(0xFF2A2A2A), Colors.white),
                    _buildButton("2", const Color(0xFF2A2A2A), Colors.white),
                    _buildButton("3", const Color(0xFF2A2A2A), Colors.white),
                    _buildButton("=", const Color(0xFF27AE60), Colors.white),

                    // Fila 5: 0, ., (relleno)
                    _buildButton("0", const Color(0xFF2A2A2A), Colors.white),
                    _buildButton(".", const Color(0xFF2A2A2A), Colors.white),
                    _buildButton("", const Color(0xFF2A2A2A), Colors.white),
                    _buildButton("", const Color(0xFF2A2A2A), Colors.white),
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
