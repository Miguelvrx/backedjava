import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/usuario_controller.dart';

class RegisterView extends StatelessWidget {
  final UsuarioController usuarioController = Get.put(UsuarioController());

  final nombreController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: InputDecoration(labelText: "Nombre"),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Contraseña"),
              obscureText: true,
            ),
            TextField(
              controller: confirmPasswordController,
              decoration: InputDecoration(labelText: "Confirmar Contraseña"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Validación básica de las contraseñas
                if (passwordController.text != confirmPasswordController.text) {
                  Get.snackbar(
                    "Error",
                    "Las contraseñas no coinciden",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                  return;
                }

                // Llamamos al controlador para registrar el usuario
                usuarioController.registrarUsuario(
                  nombreController.text,
                  emailController.text,
                  passwordController.text,
                );

                // Limpiamos los campos después del registro
                nombreController.clear();
                emailController.clear();
                passwordController.clear();
                confirmPasswordController.clear();
              },
              child: Text("Registrar"),
            ),
          ],
        ),
      ),
    );
  }
}
