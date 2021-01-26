import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_project/consts/colors.dart';
import 'package:test_project/consts/padding.dart';
import 'package:test_project/consts/text_styles.dart';
import 'package:test_project/models/contacts_model.dart';
import 'package:test_project/ui/widgets/custom_appbar.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailedContactScreen extends StatefulWidget {
  final Contacts contact;

  DetailedContactScreen({Key key, this.contact}) : super(key: key);

  @override
  _DetailedContactScreenState createState() => _DetailedContactScreenState();
}

class _DetailedContactScreenState extends State<DetailedContactScreen> {
  final double barHeight = 56;

  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController =
        TextEditingController(text: widget.contact.email);
    final TextEditingController _phoneController =
        TextEditingController(text: widget.contact.phone);
    final TextEditingController _websiteController =
        TextEditingController(text: widget.contact.website);
    final TextEditingController _companyController =
        TextEditingController(text: widget.contact.companyName);
    final TextEditingController _addressController = TextEditingController(
        text: widget.contact.street + ' ' + widget.contact.suite);
    return Scaffold(
      backgroundColor: ConstColor.customBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, barHeight),
        child: CustomAppBar(
          screenTitle: widget.contact.username,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 50,
                child: Center(
                  child: Icon(Icons.person, size: 50, color: Colors.white70),
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.contact.name,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(
                widget.contact.email,
                style: TextStyle(color: Color(0xff6C63FF), fontSize: 12),
              ),
              SizedBox(height: 20),
              Padding(
                padding: ConstPadding.contactInfoPadding,
                child: Column(
                  children: [
                    TextFormField(
                      style: ConstTextStyles.contactInfoTextStyle,
                      controller: _emailController,
                      readOnly: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        labelText: 'E-mail',
                        labelStyle: ConstTextStyles.labelContactScreenTextStyle,
                        enabled: false,
                        border: InputBorder.none,
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Color(0xff7F78A7).withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      style: ConstTextStyles.contactInfoTextStyle,
                      controller: _phoneController,
                      readOnly: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        labelText: 'Phone',
                        labelStyle: ConstTextStyles.labelContactScreenTextStyle,
                        enabled: false,
                        border: InputBorder.none,
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Color(0xff7F78A7).withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      style: ConstTextStyles.contactInfoTextStyle,
                      controller: _websiteController,
                      readOnly: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        labelText: 'Website',
                        labelStyle: ConstTextStyles.labelContactScreenTextStyle,
                        enabled: false,
                        border: InputBorder.none,
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Color(0xff7F78A7).withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      style: ConstTextStyles.contactInfoTextStyle,
                      controller: _companyController,
                      readOnly: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        labelText: 'Company',
                        labelStyle: ConstTextStyles.labelContactScreenTextStyle,
                        enabled: false,
                        border: InputBorder.none,
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Color(0xff7F78A7).withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      style: ConstTextStyles.contactInfoTextStyle,
                      controller: _addressController,
                      readOnly: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        labelText: 'Address',
                        labelStyle: ConstTextStyles.labelContactScreenTextStyle,
                        enabled: false,
                        border: InputBorder.none,
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Color(0xff7F78A7).withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: 320,
                      height: 215,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: GoogleMap(
                          markers: {
                            Marker(
                                position: LatLng(
                                    double.parse(widget.contact.lat),
                                    double.parse(widget.contact.lng)),
                                markerId: MarkerId(''))
                          },
                          initialCameraPosition: CameraPosition(
                            zoom: 20,
                            target: LatLng(
                              double.parse(widget.contact.lat),
                              double.parse(widget.contact.lng),
                            ),
                          ),
                          mapType: MapType.normal,
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
