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
      backgroundColor: Colors.grey[200], // Fondo más claro
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icono del logo de la app
                Icon(
                  Icons.person_add,
                  size: 80,
                  color: Colors.cyan, // Cambié el color a azul turquesa
                ),
                SizedBox(height: 20),
                
                // Título de la pantalla
                Text(
                  'Registro',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan, // Cambié el color a azul turquesa
                  ),
                ),
                SizedBox(height: 20),
                
                // Campo de nombre
                TextField(
                  controller: nombreController,
                  decoration: InputDecoration(
                    labelText: "Nombre",
                    prefixIcon: Icon(Icons.person),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                
                // Campo de email
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                
                // Campo de contraseña
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Contraseña",
                    prefixIcon: Icon(Icons.lock),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                
                // Campo de confirmar contraseña
                TextField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: "Confirmar Contraseña",
                    prefixIcon: Icon(Icons.lock_outline),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 30),
                
                // Botón de registro
                ElevatedButton(
                  onPressed: () async {
                    if (passwordController.text != confirmPasswordController.text) {
                      Get.snackbar(
                        "Error",
                        "Las contraseñas no coinciden",
                        snackPosition: SnackPosition.BOTTOM,
                      );
                      return;
                    }

                    String? errorMessage = await usuarioController.registrarUsuario(
                      nombreController.text,
                      emailController.text,
                      passwordController.text,
                    );

                    if (errorMessage == null) {
                      Get.snackbar('Éxito', 'Usuario registrado con éxito');
                      // Redirige a la pantalla de inicio de sesión
                      Get.offAllNamed('/login'); // Cambié el método a `Get.offAllNamed` para regresar al login
                    } else {
                      Get.snackbar('Error', errorMessage); // Muestra el mensaje de error
                    }

                    // Limpia los campos
                    nombreController.clear();
                    emailController.clear();
                    passwordController.clear();
                    confirmPasswordController.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                    backgroundColor: Colors.cyan, // Cambié el color a azul turquesa
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Registrar",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white, // Texto en color blanco
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
