import 'package:flutter/material.dart';
import 'package:flutter_assignment_2/shared/styled_button.dart';
import 'package:flutter_assignment_2/shared/styled_text.dart';
import 'package:flutter_assignment_2/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  late TextEditingController _controller;

  final _formGlobalKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _message = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Screen'),
      ),
      body: Center(
          child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Form(
              key: _formGlobalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormField(
                    autofocus: true,
                    maxLength: 20,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      icon: Icon(Icons.person),
                      hintText: 'Enter your name',
                      hintStyle: StyledFormPlaceholder.style,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onSaved: (value) {
                      _name = value!;
                    },
                    style: StyledFormInput.style,
                  ),
                  TextFormField(
                    maxLength: 20,
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: 'Email',
                      hintText: 'Enter your email address',
                      hintStyle: StyledFormPlaceholder.style,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 5) {
                        return 'Please enter your email address';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onSaved: (value) {
                      _email = value!;
                    },
                    style: StyledFormInput.style,
                  ),
                  TextFormField(
                    maxLength: 200,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.message),
                      labelText: 'Message',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 5) {
                        return 'Please enter your message';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.next,
                    onSaved: (value) {
                      _message = value!;
                    },
                    style: StyledFormInput.style,
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: StyledButton(
                        onPressed: () {
                          if (_formGlobalKey.currentState!.validate()) {
                            _formGlobalKey.currentState!.save();
                            _formGlobalKey.currentState!.reset();
                          }
                        },
                        child: StyledHeading("Send")),
                  )
                ],
              ))
        ],
      )),
    );
  }
}
