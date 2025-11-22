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
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  // === _buildButton ahora permite colores personalizados (Commit 11) ===
  Widget _buildButton(
    String label, {
    Color? backgroundColor,
    Color? textColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color(0xFF2A2A2A), // Fondo por defecto
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: textColor ?? Colors.white, // Texto por defecto blanco
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // ================= Display =================
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

              const SizedBox(height: 32),

              // ================= GridView =================
              GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                shrinkWrap: true,
                children: [
                  // === COMMIT 11: Primera fila de botones ===

                  // C - rojo
                  _buildButton(
                    "C",
                    backgroundColor: const Color(0xFFE74C3C),
                    textColor: Colors.white,
                  ),

                  // ← - azul
                  _buildButton(
                    "←",
                    backgroundColor: const Color(0xFF3498DB),
                    textColor: Colors.white,
                  ),

                  // ÷ - dorado
                  _buildButton(
                    "÷",
                    backgroundColor: const Color(0xFFD4AF37),
                    textColor: Colors.black,
                  ),

                  // × - dorado
                  _buildButton(
                    "×",
                    backgroundColor: const Color(0xFFD4AF37),
                    textColor: Colors.black,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
