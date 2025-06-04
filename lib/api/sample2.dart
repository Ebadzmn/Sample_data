import 'package:flutter/material.dart';

class Sample2 extends StatefulWidget {
  const Sample2({super.key});

  @override
  State<Sample2> createState() => _Sample2State();
}

class _Sample2State extends State<Sample2> {
  final TextEditingController _titleTEController = TextEditingController();
  final GlobalKey <FormState> _formKey = GlobalKey();
  String _title = '';
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Text('Title'),
            TextFormField(
              controller: _titleTEController,
              validator: (String? value) {
                if ( value?.trim().isEmpty ?? true) {
                  return 'Enter title';
                }
                return null;
              },
            ),
            ElevatedButton(onPressed: () {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  _title = _titleTEController.text.trim();
                });
              }
            }, child: Text('Submit')),
          const SizedBox(height: 20),
            if (_title.isNotEmpty)
              Text('$_title')
          ],
        ),
      ),
    );
  }
}
