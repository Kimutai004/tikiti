import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tikiti/Event-tickets.dart';
import 'package:tikiti/admin-index.dart';
import 'package:tikiti/login.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AddEvent extends StatefulWidget {
  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  String? _imagePath;
  DateTime? selectedstartDate;
  DateTime? selectedEndDate;
  final userId = FirebaseAuth.instance.currentUser!.uid;
  String downloadURL = '';
  File? image;
  


  void dropdownCallback(String SelectedValue) {
    if (SelectedValue is String) {
      setState(() {
        _dropdownValue = SelectedValue;
      });
    }
  }

  String _dropdownValue = 'Organiser'; // Initial dropdown value

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imagePath = pickedImage.path;
      });
    }
  }

  final TextEditingController _eventtitlecontroller = TextEditingController();
  final TextEditingController _eventdesccontroller = TextEditingController();
  final TextEditingController _earlyticketscontroller = TextEditingController();
  final TextEditingController _earlypricecontroller = TextEditingController();
  final TextEditingController _regticketscontroller = TextEditingController();
  final TextEditingController _regpricecontroller = TextEditingController();
  final TextEditingController _vipticketscontroller = TextEditingController();
  final TextEditingController _vippricecontroller = TextEditingController();
  final TextEditingController _ticketscontroller = TextEditingController();
  final TextEditingController _onlinecontroller = TextEditingController();
  final TextEditingController _locationcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Event'),
        backgroundColor: const Color(0xFF706E6E),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: 360,
              height: 800,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(color: Colors.white),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 236,
                      height: 800,
                      decoration: const BoxDecoration(color: Color(0xFF626262)),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 236,
                      height: 154,
                      decoration: const BoxDecoration(color: Color(0xFFF4F4F4)),
                    ),
                  ),
                  Positioned(
                    left: 74,
                    top: 185,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                      child: const SizedBox(
                        width: 49,
                        child: Text(
                          'Events',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 74,
                    top: 231,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddEvent()),
                        );
                      },
                      child: const SizedBox(
                        width: 98,
                        child: Text(
                          'Create Event',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 74,
                    top: 277,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Ticket()),
                        );
                      },
                      child: const SizedBox(
                        width: 98,
                        child: Text(
                          'Attendees',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 74,
                    top: 323,
                    child: SizedBox(
                      width: 98,
                      child: Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 74,
                    top: 415,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: const SizedBox(
                        width: 98,
                        child: Text(
                          'LogOut',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 23,
                    top: 178,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Events.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 23,
                    top: 224,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Events.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 23,
                    top: 270,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/People.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 23,
                    top: 316,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Profile.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 23,
                    top: 408,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Logout.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 84,
                    top: 23,
                    child: Container(
                      width: 88,
                      height: 87,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFD9D9D9),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 91,
                    top: 30,
                    child: Container(
                      width: 74,
                      height: 74,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/User.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 91,
                    top: 115,
                    child: Text(
                      'Parody',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            width: 600,
            height: 1463,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color: Color(0xFFFBFBFB)),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 500,
                    height: 150,
                    decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                    child: GestureDetector(
                    onTap: () async {
                      final ImagePicker picker = ImagePicker();
                      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
                      if (pickedImage != null) {
                        setState(() {
                          _imagePath = pickedImage.path;
                        });
                        
                      }
                    },
                    child: Container(
                      width: 500,
                      height: 150,
                      color: const Color.fromARGB(255, 227, 227, 227),
                      child: _imagePath != null
                          ? Image.file(
                              File(_imagePath!),
                              fit: BoxFit.cover,
                            )
                          : const Center(
                              child: Text(
                                'Tap to select an image',
                                style: TextStyle(
                                    color: Color.fromRGBO(4, 4, 4, 1)),
                              ),
                            ),
                    ),
                    ),
          
                  ),

                const Positioned(
                  left: 14,
                  top: 200,
                  child: Text(
                    'Event Title',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 107,
                  top: 190,
                  child: Container(
                    width: 250,
                    height: 37,
                    child: TextField(
                      controller: _eventtitlecontroller,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(width: 1),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onChanged: (value) {
                        // Use the entered data
                      },
                    ),
                  ),
                ),
                const Positioned(
                  left: 14,
                  top: 265,
                  child: Text(
                    'Event Description',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 32,
                  top: 293,
                  child: Container(
                    width: 284,
                    height: 37,
                    child: TextField(
                      controller: _eventdesccontroller,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(width: 1),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onChanged: (value) {
                        // Use the entered data
                      },
                    ),
                  ),
                ),
                const Positioned(
                  left: 25,
                  top: 446,
                  child: Text(
                    'Location',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 25,
                  top: 476,
                  child: ElevatedButton(
                    onPressed: () {
                      String online = 'online Event';
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(198, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Container(
                      width: 85,
                      height: 37,
                    ),
                  ),
                ),
                Positioned(
                  left: 176,
                  top: 476,
                  child: ElevatedButton(
                    onPressed: () {
                      String physical = 'Physical Event';
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(225, 255, 81, 0),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Container(
                      width: 85,
                      height: 37,
                    ),
                  ),
                ),
                const Positioned(
                  left: 25,
                  top: 541,
                  child: Text(
                    'Event Type',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 25,
                  top: 590,
                  child: Container(
                    width: 300,
                    height: 42,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255)
                          .withOpacity(0.7799999713897705),
                      borderRadius: BorderRadius.circular(10),
                      border: const Border(
                        bottom: BorderSide(width: 1, color: Color(0xFFFF3D00)),
                      ),
                    ),
                    child: DropdownButton<String>(
                      value: _dropdownValue,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      items: [
                        const DropdownMenuItem(
                          value: "Organiser",
                          child: Text("Organiser"),
                        ),
                        const DropdownMenuItem(
                          value: "Participant",
                          child: Text("Participant"),
                        ),
                      ],
                      onChanged: (String? value) {
                        setState(() {
                          _dropdownValue = value!;
                        });
                      },
                    ),
                  ),
                ),
                const Positioned(
                  left: 25,
                  top: 640,
                  child: Text(
                    'Tickets',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                const Positioned(
                  left: 31,
                  top: 341,
                  child: Text(
                    'Start',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 35,
                  top: 379,
                  child: GestureDetector(
                    onTap: () {
                      // Show date picker
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2025),
                      ).then((selectedDate) {
                        if (selectedDate != null) {
                          // Show time picker
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((selectedTime) {
                            if (selectedTime != null) {
                              // Combine date and time
                              DateTime selectedDateTime = DateTime(
                                selectedDate.year,
                                selectedDate.month,
                                selectedDate.day,
                                selectedTime.hour,
                                selectedTime.minute,
                              );
                              setState(() {
                                selectedstartDate = selectedDateTime;
                              });
                            }
                          });
                        }
                      });
                    },
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          selectedstartDate != null
                              ? "${selectedstartDate!.toLocal()}".split(' ')[0] +
                                  ' ' +
                                  "${selectedstartDate!.hour.toString().padLeft(2, '0')}:${selectedstartDate!.minute.toString().padLeft(2, '0')}"
                              : 'Select Date & Time',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 200,
                  top: 341,
                  child: Text(
                    'End',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 200,
                  top: 379,
                   child: GestureDetector(
                    onTap: () {
                      // Show date picker
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2025),
                      ).then((selectedDate) {
                        if (selectedDate != null) {
                          // Show time picker
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((selectedTime) {
                            if (selectedTime != null) {
                              // Combine date and time
                              DateTime selectedDateTime = DateTime(
                                selectedDate.year,
                                selectedDate.month,
                                selectedDate.day,
                                selectedTime.hour,
                                selectedTime.minute,
                              );
                              setState(() {
                                selectedEndDate = selectedDateTime;
                              });
                            }
                          });
                        }
                      });
                    },
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          selectedEndDate != null
                              ? "${selectedEndDate!.toLocal()}".split(' ')[0] +
                                  ' ' +
                                  "${selectedEndDate!.hour.toString().padLeft(2, '0')}:${selectedEndDate!.minute.toString().padLeft(2, '0')}"
                              : 'Select End Date & Time',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  )
                ),
                const Positioned(
                  left: 31,
                  top: 681,
                  child: Text(
                    'Early Bird',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Kavoon',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 14,
                  top: 670,
                  child: Container(
                    width: 93,
                    height: 37,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(width: 1),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 68,
                  top: 492,
                  child: Text(
                    'Online',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Kavoon',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                const Positioned(
                  left: 213,
                  top: 492,
                  child: Text(
                    'Physical',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Kavoon',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                const Positioned(
                  left: 156,
                  top: 679,
                  child: Text(
                    'Regular',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Kavoon',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 136,
                  top: 670,
                  child: Container(
                    width: 93,
                    height: 37,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 289,
                  top: 679,
                  child: Text(
                    'VIP',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Kavoon',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 254,
                  top: 670,
                  child: Container(
                    width: 93,
                    height: 37,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 35,
                  top: 1407,
                  child: GestureDetector(
                    onTap: () async {
                      try {
                        String? formattedStartDate;
                          if (selectedstartDate != null) {
                            formattedStartDate = DateFormat('yyyy-MM-dd').format(selectedstartDate!);
                          }

                          String? formattedEndDate;
                          if (selectedEndDate != null) {
                            formattedEndDate = DateFormat('yyyy-MM-dd').format(selectedEndDate!);
                          }

                          
                        // Get a reference to the "events" collection
                        CollectionReference eventsCollection =
                            FirebaseFirestore.instance.collection('events');
                        DocumentReference newEventRef =
                            await eventsCollection.add({
                              'user_id': userId,
                          'early_tickets': _earlyticketscontroller.text,
                          'early_price': _earlypricecontroller.text,
                          'reg_tickets': _regticketscontroller.text,
                          'reg_price': _regpricecontroller.text,
                          'vip_tickets': _vipticketscontroller.text,
                          'vip_price': _vippricecontroller.text,
                          'no_of_tickets': _ticketscontroller.text,
                          'online_link': _onlinecontroller.text,
                          'location': _locationcontroller.text,
                          'dropdown_value': _dropdownValue,
                          'event_title': _eventtitlecontroller.text,
                          'event_desc': _eventdesccontroller.text,
                          'path': _imagePath,
                          'online': 'online Event',
                          'physical': 'Physical Event',
                          'start': formattedStartDate,
                          'end': formattedEndDate,
                        });;
                        

                        print('Data sent successfully');
                      } catch (e) {
                        print('Error sending data: $e');
                      }
                    },
                    child: Container(
                      width: 274,
                      height: 33,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFD4C00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 35,
                  top: 1415,
                  child: SizedBox(
                    width: 273,
                    height: 33,
                    child: Text(
                      'Submit',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 268,
                  top: 585,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Expand Arrow.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 120,
                  top: 383,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Time.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 278,
                  top: 383,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Time.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 26,
                  top: 815,
                  child: Text(
                    'No Of  T ickets',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Kavoon',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 51,
                  top: 842,
                  child: Container(
                    width: 248,
                    height: 42,
                    child: TextField(
                      controller: _ticketscontroller,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xC6F6F6F6),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Color(0xFFFF3D00)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 32,
                  top: 922,
                  child: Text(
                    'Online Link',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Kavoon',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 51,
                  top: 949,
                  child: Container(
                    width: 248,
                    height: 42,
                    child: TextField(
                      controller: _onlinecontroller,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xC6F6F6F6),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Color(0xFFFF3D00)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 41,
                  top: 1015,
                  child: Text(
                    'Location',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Kavoon',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                const Positioned(
                  left: 34,
                  top: 1108,
                  child: Text(
                    'Ticket Prices and Seats',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Kavoon',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 51,
                  top: 1042,
                  child: Container(
                    width: 248,
                    height: 42,
                    child: TextField(
                      controller: _locationcontroller,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xC6F6F6F6),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Color(0xFFFF3D00)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 135,
                  top: 1150,
                  child: Container(
                  width: 79,
                  height: 42,
                  child: TextField(
                    controller: _earlyticketscontroller,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xC6F6F6F6),
                    border: OutlineInputBorder(
                      borderSide:
                        const BorderSide(width: 1, color: Color(0xFFFF3D00)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    ),
                  ),
                  ),
                ),
                Positioned(
                  left: 242,
                  top: 1150,
                  child: Container(
                  width: 79,
                  height: 42,
                  child: TextField(
                    controller: _earlypricecontroller,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xC6F6F6F6),
                    border: OutlineInputBorder(
                      borderSide:
                        const BorderSide(width: 1, color: Color(0xFFFF3D00)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    ),
                  ),
                  ),
                ),
                const Positioned(
                  left: 48,
                  top: 1163,
                  child: Text(
                    'Early Bird',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Kavoon',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                const Positioned(
                  left: 142,
                  top: 1130,
                  child: Text(
                    'No of Seats',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Kavoon',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                const Positioned(
                  left: 267,
                  top: 1130,
                  child: Text(
                    'Price',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Kavoon',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 135,
                  top: 1204,
                  child: Container(
                  width: 79,
                  height: 42,
                  child: TextField(
                    controller: _regticketscontroller,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xC6F6F6F6),
                    border: OutlineInputBorder(
                      borderSide:
                        const BorderSide(width: 1, color: Color(0xFFFF3D00)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    ),
                  ),
                  ),
                ),
                Positioned(
                  left: 242,
                  top: 1204,
                  child: Container(
                  width: 79,
                  height: 42,
                  child: TextField(
                    controller: _regpricecontroller,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xC6F6F6F6),
                    border: OutlineInputBorder(
                      borderSide:
                        const BorderSide(width: 1, color: Color(0xFFFF3D00)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    ),
                  ),
                  ),
                ),
                const Positioned(
                  left: 54,
                  top: 1217,
                  child: Text(
                    'Regular',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Kavoon',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 135,
                  top: 1258,
                  child: Container(
                  width: 79,
                  height: 42,
                  child: TextField(
                    controller: _vipticketscontroller,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xC6F6F6F6),
                    border: OutlineInputBorder(
                      borderSide:
                        const BorderSide(width: 1, color: Color(0xFFFF3D00)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    ),
                  ),
                  ),
                ),
                Positioned(
                  left: 242,
                  top: 1258,
                  child: Container(
                  width: 79,
                  height: 42,
                  child: TextField(
                    controller: _vippricecontroller,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xC6F6F6F6),
                    border: OutlineInputBorder(
                      borderSide:
                        const BorderSide(width: 1, color: Color(0xFFFF3D00)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    ),
                  ),
                  ),
                ),
                const Positioned(
                  left: 67,
                  top: 1271,
                  child: Text(
                    'VIP',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Kavoon',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                const Positioned(
                  left: 73,
                  top: 1357,
                  child: Text(
                    'i Agree With Terms And Conditions',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Kaisei Decol',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 27,
                  top: 1351,
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:
                            NetworkImage("https://via.placeholder.com/25x25"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
