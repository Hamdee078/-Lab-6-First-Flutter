import 'package:flutter/material.dart';
import 'register_screen.dart';  // Import the RegisterScreen widget
import 'controllers/auth_service.dart';  // Import the AuthService for authentication

class LoginScreen extends StatelessWidget {
  // Create a GlobalKey for the form
  final _formKey = GlobalKey<FormState>();

  // Create controllers to retrieve the text inputs
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Method to handle login logic
  void _login() async {
    if (_formKey.currentState!.validate()) {
      final username = usernameController.text;
      final password = passwordController.text;

      try {
        final user = await AuthService().login(username, password);
        // Handle successful login here
        print('Login successful: ');
      } catch (e) {
        // Handle login error here
        print('Login failed: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,  // Assign the _formKey to the Form widget
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: usernameController,  // Connect controller to TextField
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: passwordController,  // Connect controller to TextField
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _login,  // Call the _login method when pressed
                child: Text('Login'),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: _login,
                child: Text('ฮั่นแน่ไม่มีรหัสหรอลงทะเบียนตรงนี้เลยยยย'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
