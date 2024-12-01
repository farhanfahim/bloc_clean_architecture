
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
/// A widget representing the email input field.
class EmailInput extends StatelessWidget {
  const EmailInput({Key? key, required this.focusNode}) : super(key: key);

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode, // Setting focus node
      decoration: const InputDecoration(
        icon: Icon(Icons.email), // Icon for email input field
        hintText: "Email",
        border: OutlineInputBorder()
      ),
      keyboardType: TextInputType.emailAddress, // Setting keyboard type to email address
      onChanged: (value) {
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter email';
        }
        return null;
      },
      textInputAction: TextInputAction.next,
    );
  }
}