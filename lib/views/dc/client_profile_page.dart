import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:u20x_native/api/api.dart';
import 'package:u20x_native/api/api_response.dart';
import 'package:u20x_native/model/client_profile.dart';
import 'package:u20x_native/util/constants.dart';
import 'package:u20x_native/api/api.dart' as api;

//import 'package:u20x_native/views/dc/visiting_screen.dart';
//import 'package:u20x_native/views/workspace_page.dart';
import 'package:url_launcher/url_launcher.dart';

import 'visiting_screen.dart';

class ClientProfilePage extends StatefulWidget {
  const ClientProfilePage({super.key});

  @override
  State<ClientProfilePage> createState() => _ClientProfilePageState();
}

class _ClientProfilePageState extends State<ClientProfilePage> {
  bool _isExpandedMedications = false;
  bool _isExpandedDocuments = false;
  bool _isExpandedVisitTypes = false;
  bool _isExpandedFriendOrFamilyAccess = false;
  bool _isExpandedKeyContacts = false;
  bool _isExpandedPersonalDetails = false;
  bool _isExpandedAllergies = false;
  bool _isExpandedInterestsAndHobbies = false;
  bool _isExpandedHistoryAndBackground = false;

  late ClientProfile clientProfile;
  late final Future<ClientProfile> _clientProfile;

  @override
  void initState() {
    super.initState();
    _clientProfile = fetchClientProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDCBackColor,
      appBar: AppBar(
        backgroundColor: kDC1Color,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Client Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // physics: PageScrollPhysics(),
        child: FutureBuilder<ClientProfile>(
            future: _clientProfile,
            builder: (BuildContext context,
                AsyncSnapshot<ClientProfile> mClientProfile) {
              switch (mClientProfile.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(
                      color: kDC2Color,
                    ),
                  );
                case ConnectionState.active:
                case ConnectionState.done:
                  if (mClientProfile.hasError) {
                    return Center(
                        child: Text('Error: ${mClientProfile.error}'));
                  } else {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: kDCWhiteColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFd8dbe0),
                                    offset: Offset(1, 1),
                                    blurRadius: 5,
                                    spreadRadius: 2,
                                  )
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                      mClientProfile.data!.clientName
                                          .toString(),
                                      style: TextStyle(fontSize: 24)),
                                  SizedBox(height: 25),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .8,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 14,
                                            // horizontal: 40,
                                          ),
                                          backgroundColor: kDC3Color,
                                        ),
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return VisitingScreen();
                                          }));
                                        },
                                        child: const Text(
                                          'Check In',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: kDCWhiteColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFd8dbe0),
                                  offset: Offset(1, 1),
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Contact details",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.home_work_rounded,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Text(mClientProfile
                                            .data!.contactDetails!.address
                                            .toString()),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.key,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Text(mClientProfile.data!
                                            .contactDetails!.propertyAccess
                                            .toString()),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.phone_enabled_rounded,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () async {
                                            Uri phoneno = Uri.parse(
                                                'tel:${mClientProfile.data!.contactDetails!.phone.toString()}');
                                            if (await launchUrl(phoneno)) {
                                              //dialer opened
                                            } else {
                                              //dailer is not opened
                                            }
                                          },
                                          child: Text(
                                            mClientProfile
                                                .data!.contactDetails!.phone
                                                .toString(),
                                            style: TextStyle(color: kDC3Color),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: kDCWhiteColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFd8dbe0),
                                  offset: Offset(1, 1),
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Recent visits",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20,
                                        color: kDC3Color,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        //*Medications
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: kDCWhiteColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFd8dbe0),
                                  offset: Offset(1, 1),
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _isExpandedMedications =
                                            !_isExpandedMedications;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Medications",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Icon(
                                          _isExpandedMedications
                                              ? Icons.keyboard_arrow_up
                                              : Icons.keyboard_arrow_down_sharp,
                                          size: 30,
                                          color: kDC3Color,
                                        )
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    visible: _isExpandedMedications,
                                    child: Column(
                                      children: [
                                        ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: mClientProfile
                                              .data!.medications!.length,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(children: [
                                                  Text(
                                                    mClientProfile
                                                        .data!
                                                        .medications![index]
                                                        .medName
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    ' ${mClientProfile.data!.medications![index].medDose}',
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                ]),
                                                SizedBox(height: 10),
                                                Text(
                                                  mClientProfile
                                                      .data!
                                                      .medications![index]
                                                      .medShedule
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                SizedBox(height: 10),
                                              ],
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        //**documents
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: kDCWhiteColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFd8dbe0),
                                  offset: Offset(1, 1),
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _isExpandedDocuments =
                                            !_isExpandedDocuments;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Documents",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Icon(
                                          _isExpandedDocuments
                                              ? Icons.keyboard_arrow_up
                                              : Icons.keyboard_arrow_down_sharp,
                                          size: 30,
                                          color: kDC3Color,
                                        )
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    visible: _isExpandedDocuments,
                                    child: Column(
                                      children: [
                                        ListTile(
                                          contentPadding: EdgeInsets.all(0),
                                          title: Row(
                                            children: [
                                              Icon(Icons.description_rounded),
                                              Text(
                                                ' test',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: kDC3Color,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //***visit types
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: kDCWhiteColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFd8dbe0),
                                  offset: Offset(1, 1),
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _isExpandedVisitTypes =
                                            !_isExpandedVisitTypes;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Visit types",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Icon(
                                          _isExpandedVisitTypes
                                              ? Icons.keyboard_arrow_up
                                              : Icons.keyboard_arrow_down_sharp,
                                          size: 30,
                                          color: kDC3Color,
                                        )
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    visible: _isExpandedVisitTypes,
                                    child: Column(
                                      children: [
                                        ListTile(
                                          contentPadding: EdgeInsets.all(0),
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                mClientProfile
                                                    .data!.visitType![0].name
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Card(
                                                // margin: EdgeInsets.all(10),
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Icon(
                                                      Icons.medical_services,
                                                      size: 20),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //88 Friend or family access
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: kDCWhiteColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFd8dbe0),
                                  offset: Offset(1, 1),
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _isExpandedFriendOrFamilyAccess =
                                            !_isExpandedFriendOrFamilyAccess;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Friend or family access",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Icon(
                                          _isExpandedFriendOrFamilyAccess
                                              ? Icons.keyboard_arrow_up
                                              : Icons.keyboard_arrow_down_sharp,
                                          size: 30,
                                          color: kDC3Color,
                                        )
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    visible: _isExpandedFriendOrFamilyAccess,
                                    child: Column(
                                      children: [
                                        ListTile(
                                          contentPadding: EdgeInsets.all(0),
                                          title: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.group),
                                                  Text(
                                                    ' ${mClientProfile.data!.frondFamilyAccess![0].ffName}',
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Icon(Icons.email),
                                                  Text(
                                                    ' ${mClientProfile.data!.frondFamilyAccess![0].ffEmail}',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: kDC3Color),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        //*Key Contacts
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: kDCWhiteColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFd8dbe0),
                                  offset: Offset(1, 1),
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _isExpandedKeyContacts =
                                            !_isExpandedKeyContacts;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Key contacts",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Icon(
                                          _isExpandedKeyContacts
                                              ? Icons.keyboard_arrow_up
                                              : Icons.keyboard_arrow_down_sharp,
                                          size: 30,
                                          color: kDC3Color,
                                        )
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    visible: _isExpandedKeyContacts,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.group),
                                            Text(
                                              ' ${mClientProfile.data!.keyContact![0].name}',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              ' ${mClientProfile.data!.keyContact![0].relation}',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.phone),
                                            Text(
                                              ' ${mClientProfile.data!.keyContact![0].contactDetails}',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: kDC3Color),
                                            ),
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          children: [
                                            Icon(Icons.group),
                                            Text(
                                              ' ${mClientProfile.data!.keyContact![1].name}',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              ' ${mClientProfile.data!.keyContact![1].relation}',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.phone),
                                            Text(
                                              ' ${mClientProfile.data!.keyContact![1].contactDetails}',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: kDC3Color),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //*Personal details
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: kDCWhiteColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFd8dbe0),
                                  offset: Offset(1, 1),
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _isExpandedPersonalDetails =
                                            !_isExpandedPersonalDetails;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Personal details",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Icon(
                                          _isExpandedPersonalDetails
                                              ? Icons.keyboard_arrow_up
                                              : Icons.keyboard_arrow_down_sharp,
                                          size: 30,
                                          color: kDC3Color,
                                        )
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    visible: _isExpandedPersonalDetails,
                                    child: Column(
                                      children: [
                                        ListTile(
                                          contentPadding: EdgeInsets.all(0),
                                          title: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.cake_rounded),
                                                  Text(
                                                    ' ${mClientProfile.data!.personalDetails!.dob}',
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Icon(Icons.language_rounded),
                                                  Text(
                                                    ' ${mClientProfile.data!.personalDetails!.languagesSpocken}',
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //*Allergies
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: kDCWhiteColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFd8dbe0),
                                  offset: Offset(1, 1),
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _isExpandedAllergies =
                                            !_isExpandedAllergies;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Allergies",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Icon(
                                          _isExpandedAllergies
                                              ? Icons.keyboard_arrow_up
                                              : Icons.keyboard_arrow_down_sharp,
                                          size: 30,
                                          color: kDC3Color,
                                        )
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    visible: _isExpandedAllergies,
                                    child: Column(
                                      children: [
                                        ListTile(
                                          contentPadding: EdgeInsets.all(0),
                                          title: Row(
                                            children: [
                                              Text(
                                                ' ${mClientProfile.data!.personalDetails!.allergies}',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        //*Interests and hobbies
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: kDCWhiteColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFd8dbe0),
                                  offset: Offset(1, 1),
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _isExpandedInterestsAndHobbies =
                                            !_isExpandedInterestsAndHobbies;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Interests and Hobbies",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Icon(
                                          _isExpandedInterestsAndHobbies
                                              ? Icons.keyboard_arrow_up
                                              : Icons.keyboard_arrow_down_sharp,
                                          size: 30,
                                          color: kDC3Color,
                                        )
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    visible: _isExpandedInterestsAndHobbies,
                                    child: Column(
                                      children: [
                                        ListTile(
                                          contentPadding: EdgeInsets.all(0),
                                          title: Row(
                                            children: [
                                              Text(
                                                ' ${mClientProfile.data!.personalDetails!.interestsHobbies}',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //*History and background
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: kDCWhiteColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFd8dbe0),
                                  offset: Offset(1, 1),
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _isExpandedHistoryAndBackground =
                                            !_isExpandedHistoryAndBackground;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "History and background",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Icon(
                                          _isExpandedHistoryAndBackground
                                              ? Icons.keyboard_arrow_up
                                              : Icons.keyboard_arrow_down_sharp,
                                          size: 30,
                                          color: kDC3Color,
                                        )
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    visible: _isExpandedHistoryAndBackground,
                                    child: Column(
                                      children: [
                                        ListTile(
                                          contentPadding: EdgeInsets.all(0),
                                          title: Row(
                                            children: [
                                              Text(
                                                ' ${mClientProfile.data!.personalDetails!.historyBackground}',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
              }
            }),
      ),
    );
  }

// void getClientProfile() {
//   api.clientProfile(onCompletion: (status, clientProfile_) {
//     if (status == ResponseStatus.success) {
//       // print('getClientProfile Success! ${clientProfile_.toString()}');
//       setState(() {
//         clientProfile = clientProfile_!;
//       });
//     } else if (status == ResponseStatus.invalidRequest) {
//       print('getClientProfile ERROR, invalidRequest');
//     } else if (status == ResponseStatus.networkFailure) {
//       print('getClientProfile ERROR, networkFailure');
//     } else if (status == ResponseStatus.unknownError) {
//       print('getClientProfile ERROR, unknownError');
//     }
//   });
// }
}
