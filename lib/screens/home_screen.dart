import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/contact.dart';
import '../widgets/contact_card.dart';
import '../widgets/add_contact_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Contact> contacts = [];

  void _addContact(Contact contact) {
    setState(() {
      contacts.add(contact);
    });
  }

  void _deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF29384D),
      appBar: AppBar(
        backgroundColor: Color(0xFF29384D),
        leading: Container(
            margin: EdgeInsets.only(left: 10), child: Image(image: AssetImage
          ("assets/app_bar.png"),)),
        leadingWidth: 100,

      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: contacts.isEmpty
              ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  width: 200,
                  height: 200,

                  child: Image.asset("assets/home.png"),
                ),
                SizedBox(height: 20),
                Text(
                  "There is No Contacts Added Here",
                  style: GoogleFonts.inter(
                    color: Color(0xFFFFF1D4),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
              : GridView.builder(
            padding: EdgeInsets.only(top: 16.0),
            itemCount: contacts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 16,
              childAspectRatio: 0.53,


            ),
            itemBuilder: (context, index) {
              return ContactCard(
                contact: contacts[index],
                onDelete: () => _deleteContact(index),
              );
            },
          )
      ),
      floatingActionButton: contacts.length >= 6
          ? null
          : FloatingActionButton(
        backgroundColor: Color(0xFFFFF1D4),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) {
              return AddContactSheet(onAdd: _addContact);
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Color(0xFF29384D),
          size: 30,
        ),
      ),
    );
  }
}
