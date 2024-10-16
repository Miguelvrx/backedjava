import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/usuario_controller.dart';

class LoginView extends StatelessWidget {
  final UsuarioController usuarioController = Get.put(UsuarioController());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Contraseña"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Llamamos al controlador para hacer login
                usuarioController.login(
                  emailController.text,
                  passwordController.text,
                );
              },
              child: Text("Iniciar sesión"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de registro
                Get.toNamed('/register');
              },
              child: Text("¿No tienes cuenta? Regístrate"),
            ),
          ],
        ),
      ),
    );
  }
}
