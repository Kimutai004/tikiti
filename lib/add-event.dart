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
import 'package:tikiti/profile.dart';

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
  String? _selection;

  String? _selectedEventType;
  final List<String> _eventTypes = ['Conference', 'Seminar', 'Workshop', 'Meetup'];

  final TextEditingController _startController = TextEditingController();
  final TextEditingController _endController = TextEditingController();
  final TextEditingController _eventtitlecontroller = TextEditingController();
  final TextEditingController _eventdesccontroller = TextEditingController();
  final TextEditingController _earlyticketscontroller = TextEditingController();
  final TextEditingController _earlypricecontroller = TextEditingController();
  final TextEditingController _regticketscontroller = TextEditingController();
  final TextEditingController _regpricecontroller = TextEditingController();
  final TextEditingController _vipticketscontroller = TextEditingController();
  final TextEditingController _vippricecontroller = TextEditingController();
  final TextEditingController _meetingLinkController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _physicallocationController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _submitData() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Processing Data')),
      );

      // Example data submission to Firestore
      await FirebaseFirestore.instance.collection('events').add({
        'user_id': userId,
                          'early_tickets': _earlyticketscontroller.text,
                          'early_price': _earlypricecontroller.text,
                          'reg_tickets': _regticketscontroller.text,
                          'reg_price': _regpricecontroller.text,
                          'vip_tickets': _vipticketscontroller.text,
                          'vip_price': _vippricecontroller.text,
                          'online_link': _meetingLinkController.text,
                          'location': _physicallocationController.text,
                          'dropdown_value': _selection,
                          'event_title': _eventtitlecontroller.text,
                          'event_desc': _eventdesccontroller.text,
                          'path': _imagePath,
                          'start': _startController.text,
                          'end': _endController.text,
                          'event_type': _selectedEventType,
                          'custom_ticket_types': _customTicketTypes,
                          'custom_ticket_prices': _customTicketPrices,
                          'custom_ticket_quantity': _customTicketQuantity,
      });
      
      // Show a confirmation message or handle the submission result
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data submitted to Firestore')),
      );
    }
  }


  Future<void> _pickDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (pickedDate == null) return;

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime == null) return;

    final DateTime finalDateTime = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    _startController.text = DateFormat('yyyy-MM-dd – HH:mm').format(finalDateTime);
  }

  Future<void> _pickendDateTime(BuildContext context) async {
    final DateTime? pickedendDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (pickedendDate == null) return;

    final TimeOfDay? pickedendTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedendTime == null) return;

    final DateTime finalDateTime = DateTime(
      pickedendDate.year,
      pickedendDate.month,
      pickedendDate.day,
      pickedendTime.hour,
      pickedendTime.minute,
    );

    _endController.text = DateFormat('yyyy-MM-dd – HH:mm').format(finalDateTime);
  }

  void _showSelectionOptions() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Location Type'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('Online'),
                onTap: () {
                  setState(() {
                    _selection = 'Online';
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('Physical'),
                onTap: () {
                  setState(() {
                    _selection = 'Physical';
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('Both'),
                onTap: () {
                  setState(() {
                    _selection = 'Both';
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imagePath = pickedImage.path;
      });
    }
  }

  List<Map<String, dynamic>> _customTicketTypes = [];
  List<Map<String, dynamic>> _customTicketPrices = [];
  List<Map<String, dynamic>> _customTicketQuantity = [];
  
  void _addCustomTicketType() {
    TextEditingController ticketTypeController = TextEditingController();
    TextEditingController ticketNumberController = TextEditingController();
    TextEditingController ticketPriceController = TextEditingController();
  
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Custom Ticket Type'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                controller: ticketTypeController,
                
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(labelText: 'Ticket Type'),
              ),
              TextFormField(
                controller: ticketNumberController,
                
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(labelText: 'No. of Tickets'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: ticketPriceController,
                
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(labelText: 'Price in KES'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Add'),
              onPressed: () {
                setState(() {
                  _customTicketTypes.add({
                    'type': ticketTypeController.text,
                    'number': ticketNumberController.text,
                    'price': ticketPriceController.text,
                  });
                  _customTicketPrices.add({
                    'type': ticketTypeController.text,
                    'price': ticketPriceController.text,
                  });
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Event'),
        backgroundColor: const Color(0xFF706E6E),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Parody"),
              accountEmail: null,
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/User.png"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.event),
              title: Text('Events'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.create),
              title: Text('Create Event'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddEvent()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Attendees'),
              
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('LogOut'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: double.infinity,
                  height: 250,
                  color: Color.fromARGB(255, 227, 227, 227),
                  child: _imagePath != null
                      ? Image.file(
                          File(_imagePath!),
                          fit: BoxFit.cover,
                        )
                      : Center(
                          child: Text(
                            'Tap to select an image',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                ),
              ),
                TextFormField(
                controller: _eventtitlecontroller,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Event title',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                  return 'Please enter your Event Title';
                  }
                  return null;
                },
                ),
                TextFormField(
                controller: _eventdesccontroller,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Event Description',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                  return 'Please enter the Event Description';
                  }
                  return null;
                },
                ),
              InkWell(
              onTap: _showSelectionOptions,
              child: IgnorePointer(
                child: TextFormField(
                controller: _locationController,
                
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Location Type',
                ),
                ),
              ),
              ),
              if (_selection == 'Online' || _selection == 'Both')
              TextFormField(
                controller: _meetingLinkController,
                
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                labelText: 'Meeting Link',
                ),
                validator: (value) {
                if (_selection == 'Online' || _selection == 'Both') {
                  if (value == null || value.isEmpty) {
                  return 'Please enter the meeting link';
                  }
                }
                return null;
                },
              ),
              if (_selection == 'Physical' || _selection == 'Both')
              TextFormField(
                controller: _physicallocationController,
                
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                labelText: 'Physical Location',
                ),
                validator: (value) {
                if (_selection == 'Physical' || _selection == 'Both') {
                  if (value == null || value.isEmpty) {
                  return 'Please enter the physical location';
                  }
                }
                return null;
                },
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Event Type',
                ),
                value: _selectedEventType,
                
                style: TextStyle(color: Colors.black),
                items: _eventTypes.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedEventType = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an event type';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _startController,
                
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Start',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _pickDateTime(context),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please pick a start date and time';
                  }
                  return null;
                },
                readOnly: true,
              ),
              TextFormField(
                controller: _endController,
                
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'End',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _pickendDateTime(context),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please pick a start date and time';
                  }
                  return null;
                },
                readOnly: true,
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      'Early Bird',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      controller: _earlyticketscontroller,
                      
                style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'No. of Tickets',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter tickets';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _earlypricecontroller,
                      
                style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'Price in KES',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter price';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      'Regular',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    child: TextFormField(
                      controller: _regticketscontroller,
                      
                style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'No. of Tickets',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter tickets';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _regpricecontroller,
                      
                style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'Price in KES',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter price';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      'VIP',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 50),
                  Expanded(
                    child: TextFormField(
                      controller: _vipticketscontroller,
                      
                style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'No. of Tickets',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter tickets';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _vippricecontroller,
                      
                style: TextStyle(color: Colors.black),
                      
                      decoration: InputDecoration(
                        labelText: 'Price in KES',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter price';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              ..._customTicketTypes.map((ticket) {
                return Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        ticket['type'],
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'No. of Tickets',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter tickets';
                          }
                          return null;
                        },
                        initialValue: ticket['number'],
                        onChanged: (value) {
                          ticket['number'] = value;
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Price in KES',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter price';
                          }
                          return null;
                        },
                        initialValue: ticket['price'],
                        onChanged: (value) {
                          ticket['price'] = value;
                        },

                      ),
                      
                    ),
      IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          setState(() {
            _customTicketTypes.remove(ticket);
          });
        },
      ),
                  ],
                );
              }).toList(),
              Container(
  decoration: BoxDecoration(
    color: const Color.fromARGB(255, 255, 77, 0), // Background color
    shape: BoxShape.rectangle, // Optional: makes the container circular
    borderRadius: BorderRadiusDirectional.circular(10)
  ),
  child: IconButton(
    icon: Icon(Icons.add),
    color: Colors.white, // Icon color
    onPressed: _addCustomTicketType,
  ),
),
                Center(
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: ElevatedButton(
      onPressed: _submitData,
      child: Text('Sign Up'),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 255, 64, 0), // Background color
      ),
    ),
  ),
),
          ],
            
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
