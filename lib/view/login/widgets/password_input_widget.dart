import 'package:flutter/material.dart';
/// A widget representing the password input field.
class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key, required this.focusNode}) : super(key: key);

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode, // Setting focus node
      decoration: const InputDecoration(
        icon: Icon(Icons.lock), // Icon for password input field
        hintText: "Password", // Helper text for password input field
        helperMaxLines: 2, // Maximum lines for helper text
        border: OutlineInputBorder(),
        errorMaxLines: 2, // Maximum lines for error text
      ),
      obscureText: true, // Making the text input obscure (i.e., showing dots instead of actual characters)
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter password';
        }
        if (value.length < 6) {
          return 'please enter password greater than 6 char';
        }
        return null;
      },
      onChanged: (value) {
      },
      textInputAction: TextInputAction.done,
    );
  }
}