import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../models/contact.dart';

class AddContactSheet extends StatefulWidget {
  final Function(Contact) onAdd;

  AddContactSheet({super.key, required this.onAdd});

  @override
  State<AddContactSheet> createState() => _AddContactSheetState();
}

class _AddContactSheetState extends State<AddContactSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _imagePicker = ImagePicker();
  String _selectedImagePath = '';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 75,
      );
      if (image != null) {
        setState(() {
          _selectedImagePath = image.path;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to pick image')));
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final contact = Contact(
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        imagePath:
            _selectedImagePath.isNotEmpty
                ? _selectedImagePath
                : 'assets/app_bar.png',
      );
      widget.onAdd(contact);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF29384D),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Color(0xFFE2F4F6),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    border: Border.all(color: Color(0xFFFFF1D4), width: 1),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17),
                    child: _selectedImagePath.isNotEmpty
                        ? Image.file(
                      File(_selectedImagePath),
                      fit: BoxFit.fill
                      ,            
                    )
                        : Image.asset(
                      "assets/image_picker.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

                SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _nameController.text.isEmpty
                              ? "User Name"
                              : _nameController.text,
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        ),
                        Divider(color: Colors.white38, thickness: 1),
                        Text(
                          _emailController.text.isEmpty
                              ? "example@email.com"
                              : _emailController.text,
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        ),
                        Divider(color: Colors.white38, thickness: 1),
                        Text(
                          _phoneController.text.isEmpty
                              ? "+01126007004"
                              : _phoneController.text,
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                labelText: 'Enter User Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: 2),
                ),
                labelStyle: TextStyle(color: Color(0xFFFFF1D4)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Color(0xFFFFF1D4), width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Color(0xFFFFF1D4), width: 1),
                ),
              ),
              style: TextStyle(color: Color(0xFFE2F4F6)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                labelText: 'Enter User Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Color(0xFFFFF1D4), width: 1),
                ),
                labelStyle: TextStyle(color: Color(0xFFFFF1D4)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Color(0xFFFFF1D4), width: 1),
                ),
              ),
              style: TextStyle(color: Color(0xFFE2F4F6)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an email';
                }
                if (!RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                ).hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _phoneController,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                labelText: 'Enter User Phone',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Color(0xFFFFF1D4), width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Color(0xFFFFF1D4), width: 1),
                ),
                labelStyle: TextStyle(color: Color(0xFFFFF1D4)),
              ),
              style: TextStyle(color: Color(0xFFE2F4F6)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a phone number';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFF1D4),
                  foregroundColor: Color(0xFF29384D),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'Enter user',
                  style: TextStyle(
                    color: Color(0xFF29384D),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
