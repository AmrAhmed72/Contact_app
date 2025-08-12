import 'dart:io';
import 'package:flutter/material.dart';
import '../models/contact.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;
  final VoidCallback onDelete;

  const ContactCard({super.key, required this.contact, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xffFFF1D4),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(  height: 177,
                    child: Image.file(
                      File(contact.imagePath),
                      
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 7,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Color(0xffFFF1D4),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        contact.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xff29384D),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 10,
                    ),
                    child: Icon(Icons.mail, color: Color(0xFF29384D)),
                  ),
                  Text(
                    contact.email,
                    style:  TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF29384D), // Dark Blue
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(Icons.phone, color: Color(0xFF29384D)),
                  ),
                  Text(
                    contact.phone,
                    style:  TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF29384D), // Dark Blue
                    ),
                  ),
                ],
              ),
              Padding(
                padding:  EdgeInsets.all(5.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Color(0xFFEE403D),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),

                  ),
                  onPressed: onDelete,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.delete_rounded),
                      Text(
                        "Delete",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

