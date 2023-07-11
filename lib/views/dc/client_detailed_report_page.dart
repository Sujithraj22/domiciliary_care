import 'package:flutter/material.dart';
import 'package:u20x_native/api/api.dart';

import '../../model/medication.dart';
import '../../util/constants.dart';

class ClientDetailedReportPage extends StatefulWidget {
  const ClientDetailedReportPage({super.key});

  @override
  State<ClientDetailedReportPage> createState() =>
      _ClientDetailedReportPageState();
}

class _ClientDetailedReportPageState extends State<ClientDetailedReportPage> {
  bool _isMorning = false;
  bool _isLunchtime = false;
  bool _isEvening = false;
  bool _isBedTime = false;
  bool _isAsNeeded = false;
  bool isNotTaken = false;
  bool isTaken = false;
  // bool isNotTakenExpanded = false;
  // bool isTakenExpanded = false;
  // late List<bool> isNotTakenExpandedList = [true, false];
  // late List<bool> isTakenExpandedList= [true, false];
  List<bool> isNotTakenExpandedList = List.generate(10, (index) => false);
  List<bool> isTakenExpandedList = List.generate(10, (index) => false);
  // List<bool>? isNotTakenExpandedList;
  // List<bool>? isTakenExpandedList;
  TextEditingController controllerNotTaken = TextEditingController();
  TextEditingController controllerTaken = TextEditingController();

  late Medication medication;
  late final Future<Medication> _medication;

  @override
  void initState() {
    super.initState();
    _medication = fetchMedication();
     }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<Medication>(
              future: _medication,
              builder:
                  (BuildContext context, AsyncSnapshot<Medication> mMedication) {
                switch (mMedication.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const Center(
                      child: CircularProgressIndicator(
                        color: kDC2Color,
                      ),
                    );
                  case ConnectionState.active:
                  case ConnectionState.done:
                    if (mMedication.hasError) {
                      return Center(child: Text('Error: ${mMedication.error}'));
                    } else {
                      return Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Medications',
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Text('Medication Required'),
                            ),

                            //**Morning
                            Column(
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
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _isMorning = !_isMorning;
                                            });
                                          },
                                          //**inside builder
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Icon(Icons.wb_twighlight),
                                                    Text(
                                                      "Morning",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "${mMedication.data!.morning!.length}"+" meds",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.grey),
                                                    ),
                                                    Icon(
                                                      _isMorning
                                                          ? Icons
                                                              .keyboard_arrow_up
                                                          : Icons
                                                              .keyboard_arrow_down_sharp,
                                                      size: 30,
                                                      color: kDC3Color,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Visibility(
                                                visible: _isMorning,
                                                child: Column(
                                                  children: [
                                                    ListView.builder(
                                                      shrinkWrap: true,
                                                        itemCount: mMedication.data!.morning!.length,
                                                        physics: NeverScrollableScrollPhysics(),
                                                        itemBuilder:
                                                      (context,
                                                          index) {
                                                        // isNotTakenExpandedList[index] = !isNotTakenExpandedList[index];
                                                        // isTakenExpandedList[index] = false;
                                                        // isNotTakenExpandedList = List.generate(10, (index) => false);
                                                        // isTakenExpandedList = List.generate(10, (index) => false);
                                                    return Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "${mMedication.data!.morning![index].medicationName}",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    20,
                                                                fontWeight:
                                                                    FontWeight.bold),
                                                          ),
                                                          Text(
                                                            "${mMedication.data!.morning![index].dosage}",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    16),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "${mMedication.data!.morning![index].note1}"+"${mMedication.data!.morning![index].note2}",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                              height:
                                                                  10),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Container(
                                                                width:
                                                                    150,
                                                                height:
                                                                    50,
                                                                child:
                                                                    ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    setState(() {

                                                                      isNotTakenExpandedList[index] = !isNotTakenExpandedList[index];
                                                                      //isNotTakenExpandedList[index] = true;
                                                                      isTakenExpandedList[index] = false;
                                                                    });
                                                                  },
                                                                  style:
                                                                      ElevatedButton.styleFrom(
                                                                    backgroundColor: isNotTakenExpandedList[index]
                                                                        ? Colors.red
                                                                        : Colors.white,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(20),
                                                                      side: BorderSide(color: Colors.red),
                                                                    ),
                                                                  ),
                                                                  child: Text(
                                                                      'Not taken',
                                                                      style: TextStyle(color: isNotTakenExpandedList[index] ? Colors.white : Colors.red)),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width:
                                                                      0),
                                                              Container(
                                                                width:
                                                                    150,
                                                                height:
                                                                    50,
                                                                child:
                                                                    ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    setState(() {
                                                                      isTakenExpandedList[index] = !isTakenExpandedList[index];
                                                                      isNotTakenExpandedList[index] = false;
                                                                    });
                                                                  },
                                                                  style:
                                                                      ElevatedButton.styleFrom(
                                                                    backgroundColor: isTakenExpandedList[index]
                                                                        ? Colors.green
                                                                        : Colors.white,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(20),
                                                                      side: BorderSide(color: isTakenExpandedList[index] ? Colors.green : Colors.red),
                                                                    ),
                                                                  ),
                                                                  child: Text(
                                                                      'Taken',
                                                                      style: TextStyle(color: isTakenExpandedList[index] ? Colors.white : Colors.red)),
                                                                ),

                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(height: 10,),
                                                          Container(
                                                            width: double.infinity,
                                                            color: Colors.black12,
                                                            child: Center(
                                                              child: Text(
                                                                "${mMedication.data!.morning![index].previousNote}",
                                                                style: TextStyle(
                                                                    fontSize: 14,
                                                                    color: Colors
                                                                        .black38),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              height:
                                                                  10),
                                                          Visibility(
                                                            visible:
                                                                isNotTakenExpandedList[index],
                                                            child:
                                                                Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                  height:
                                                                      20,
                                                                ),
                                                                Text(
                                                                  'Notes (mandatory)',
                                                                  style: TextStyle(
                                                                      fontWeight: FontWeight.normal,
                                                                      fontSize: 20),
                                                                ),
                                                                SizedBox(
                                                                    height:
                                                                        15),
                                                                TextField(
                                                                  maxLines:
                                                                      2,
                                                                  controller:
                                                                      controllerNotTaken,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    filled:
                                                                        true,
                                                                    fillColor:
                                                                        Colors.white,
                                                                    hintText:
                                                                        '',
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderSide: BorderSide(color: Colors.black),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide: BorderSide(width: 1, color: Colors.grey),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    height:
                                                                        50),
                                                              ],
                                                            ),
                                                          ),
                                                          Visibility(
                                                            visible:
                                                                isTakenExpandedList[index],
                                                            child:
                                                                Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                  height:
                                                                      20,
                                                                ),
                                                                Text(
                                                                  'Notes (optional)',
                                                                  style: TextStyle(
                                                                      fontWeight: FontWeight.normal,
                                                                      fontSize: 20),
                                                                ),
                                                                SizedBox(
                                                                    height:
                                                                        15),
                                                                TextField(
                                                                  maxLines:
                                                                      2,
                                                                  controller:
                                                                      controllerTaken,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    filled:
                                                                        true,
                                                                    fillColor:
                                                                        Colors.white,
                                                                    hintText:
                                                                        '',
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderSide: BorderSide(color: Colors.black),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide: BorderSide(width: 1, color: Colors.grey),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    height:
                                                                        50),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                        },
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
                                //**Lunchtime

                                //**Evening
                              ],
                            ),
                            Column(
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
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _isEvening = !_isEvening;
                                            });
                                          },
                                          //**inside builder
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Icon(Icons.wb_twighlight),
                                                    Text(
                                                      "Evening",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "${mMedication.data!.evening!.length}"+" meds",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.grey),
                                                    ),
                                                    Icon(
                                                      _isEvening
                                                          ? Icons
                                                              .keyboard_arrow_up
                                                          : Icons
                                                              .keyboard_arrow_down_sharp,
                                                      size: 30,
                                                      color: kDC3Color,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Visibility(
                                                visible: _isEvening,
                                                child: Column(
                                                  children: [
                                                    ListView.builder(
                                                      shrinkWrap: true,
                                                        itemCount: mMedication.data!.evening!.length,
                                                        physics: NeverScrollableScrollPhysics(),
                                                        itemBuilder:
                                                      (context,
                                                          index) {
                                                        // isNotTakenExpandedList[index] = !isNotTakenExpandedList[index];
                                                        // isTakenExpandedList[index] = false;
                                                    return Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "${mMedication.data!.evening![index].medicationName}",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    20,
                                                                fontWeight:
                                                                    FontWeight.bold),
                                                          ),
                                                          Text(
                                                            "${mMedication.data!.evening![index].dosage}",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    16),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "${mMedication.data!.evening![index].note1}"+"${mMedication.data!.evening![index].note2}",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                              height:
                                                                  10),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Container(
                                                                width:
                                                                    150,
                                                                height:
                                                                    50,
                                                                child:
                                                                    ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    setState(() {
                                                                      isNotTakenExpandedList[index] = !isNotTakenExpandedList[index];
                                                                      isTakenExpandedList[index] = false;
                                                                    });
                                                                  },
                                                                  style:
                                                                      ElevatedButton.styleFrom(
                                                                    backgroundColor: isNotTakenExpandedList[index]
                                                                        ? Colors.red
                                                                        : Colors.white,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(20),
                                                                      side: BorderSide(color: Colors.red),
                                                                    ),
                                                                  ),
                                                                  child: Text(
                                                                      'Not taken',
                                                                      style: TextStyle(color: isNotTakenExpandedList[index] ? Colors.white : Colors.red)),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width:
                                                                      0),
                                                              Container(
                                                                width:
                                                                    150,
                                                                height:
                                                                    50,
                                                                child:
                                                                    ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    setState(() {
                                                                      isTakenExpandedList[index] = !isTakenExpandedList[index];
                                                                      isNotTakenExpandedList[index] = false;
                                                                    });
                                                                  },
                                                                  style:
                                                                      ElevatedButton.styleFrom(
                                                                    backgroundColor: isTakenExpandedList[index]
                                                                        ? Colors.green
                                                                        : Colors.white,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(20),
                                                                      side: BorderSide(color: isTakenExpandedList[index] ? Colors.green : Colors.red),
                                                                    ),
                                                                  ),
                                                                  child: Text(
                                                                      'Taken',
                                                                      style: TextStyle(color: isTakenExpandedList[index] ? Colors.white : Colors.red)),
                                                                ),

                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(height: 10,),
                                                          Container(
                                                            width: double.infinity,
                                                            color: Colors.black12,
                                                            child: Center(
                                                              child: Text(
                                                                "${mMedication.data!.evening![index].previousNote}",
                                                                style: TextStyle(
                                                                    fontSize: 14,
                                                                    color: Colors
                                                                        .black38),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              height:
                                                                  10),
                                                          Visibility(
                                                            visible:
                                                                isNotTakenExpandedList[index],
                                                            child:
                                                                Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                  height:
                                                                      20,
                                                                ),
                                                                Text(
                                                                  'Notes (mandatory)',
                                                                  style: TextStyle(
                                                                      fontWeight: FontWeight.normal,
                                                                      fontSize: 20),
                                                                ),
                                                                SizedBox(
                                                                    height:
                                                                        15),
                                                                TextField(
                                                                  maxLines:
                                                                      2,
                                                                  controller:
                                                                      controllerNotTaken,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    filled:
                                                                        true,
                                                                    fillColor:
                                                                        Colors.white,
                                                                    hintText:
                                                                        '',
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderSide: BorderSide(color: Colors.black),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide: BorderSide(width: 1, color: Colors.grey),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    height:
                                                                        50),
                                                              ],
                                                            ),
                                                          ),
                                                          Visibility(
                                                            visible:
                                                                isTakenExpandedList[index],
                                                            child:
                                                                Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                  height:
                                                                      20,
                                                                ),
                                                                Text(
                                                                  'Notes (optional)',
                                                                  style: TextStyle(
                                                                      fontWeight: FontWeight.normal,
                                                                      fontSize: 20),
                                                                ),
                                                                SizedBox(
                                                                    height:
                                                                        15),
                                                                TextField(
                                                                  maxLines:
                                                                      2,
                                                                  controller:
                                                                      controllerTaken,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    filled:
                                                                        true,
                                                                    fillColor:
                                                                        Colors.white,
                                                                    hintText:
                                                                        '',
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderSide: BorderSide(color: Colors.black),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide: BorderSide(width: 1, color: Colors.grey),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    height:
                                                                        50),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                        },
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
                                //**Lunchtime

                                //**Evening
                              ],
                            ),
                            Column(
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
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _isBedTime = !_isBedTime;
                                            });
                                          },
                                          //**inside builder
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Icon(Icons.wb_twighlight),
                                                    Text(
                                                      "Bed time",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "${mMedication.data!.bedTime!.length}"+" meds",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.grey),
                                                    ),
                                                    Icon(
                                                      _isBedTime
                                                          ? Icons
                                                          .keyboard_arrow_up
                                                          : Icons
                                                          .keyboard_arrow_down_sharp,
                                                      size: 30,
                                                      color: kDC3Color,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Visibility(
                                                visible: _isBedTime,
                                                child: Column(
                                                  children: [
                                                    ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount: mMedication.data!.bedTime!.length,
                                                      physics: NeverScrollableScrollPhysics(),
                                                      itemBuilder:
                                                          (context,
                                                          index) {
                                                        // isNotTakenExpandedList[index] = !isNotTakenExpandedList[index];
                                                        // isTakenExpandedList[index] = false;
                                                        return Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text(
                                                                "${mMedication.data!.bedTime![index].medicationName}",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                    20,
                                                                    fontWeight:
                                                                    FontWeight.bold),
                                                              ),
                                                              Text(
                                                                "${mMedication.data!.bedTime![index].dosage}",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                    16),
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    "${mMedication.data!.bedTime![index].note1}"+"${mMedication.data!.bedTime![index].note2}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                        16),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                  height:
                                                                  10),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                                children: [
                                                                  Container(
                                                                    width:
                                                                    150,
                                                                    height:
                                                                    50,
                                                                    child:
                                                                    ElevatedButton(
                                                                      onPressed:
                                                                          () {
                                                                        setState(() {
                                                                          isNotTakenExpandedList[index] = !isNotTakenExpandedList[index];
                                                                          isTakenExpandedList[index] = false;
                                                                        });
                                                                      },
                                                                      style:
                                                                      ElevatedButton.styleFrom(
                                                                        backgroundColor: isNotTakenExpandedList[index]
                                                                            ? Colors.red
                                                                            : Colors.white,
                                                                        shape:
                                                                        RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(20),
                                                                          side: BorderSide(color: Colors.red),
                                                                        ),
                                                                      ),
                                                                      child: Text(
                                                                          'Not taken',
                                                                          style: TextStyle(color: isNotTakenExpandedList[index] ? Colors.white : Colors.red)),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      width:
                                                                      0),
                                                                  Container(
                                                                    width:
                                                                    150,
                                                                    height:
                                                                    50,
                                                                    child:
                                                                    ElevatedButton(
                                                                      onPressed:
                                                                          () {
                                                                        setState(() {
                                                                          isTakenExpandedList[index] = !isTakenExpandedList[index];
                                                                          isNotTakenExpandedList[index] = false;
                                                                        });
                                                                      },
                                                                      style:
                                                                      ElevatedButton.styleFrom(
                                                                        backgroundColor: isTakenExpandedList[index]
                                                                            ? Colors.green
                                                                            : Colors.white,
                                                                        shape:
                                                                        RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(20),
                                                                          side: BorderSide(color: isTakenExpandedList[index] ? Colors.green : Colors.red),
                                                                        ),
                                                                      ),
                                                                      child: Text(
                                                                          'Taken',
                                                                          style: TextStyle(color: isTakenExpandedList[index] ? Colors.white : Colors.red)),
                                                                    ),

                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(height: 10,),
                                                              Container(
                                                                width: double.infinity,
                                                                color: Colors.black12,
                                                                child: Center(
                                                                  child: Text(
                                                                    "${mMedication.data!.bedTime![index].previousNote}",
                                                                    style: TextStyle(
                                                                        fontSize: 14,
                                                                        color: Colors
                                                                            .black38),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height:
                                                                  10),
                                                              Visibility(
                                                                visible:
                                                                isNotTakenExpandedList[index],
                                                                child:
                                                                Column(
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                                  children: [
                                                                    SizedBox(
                                                                      height:
                                                                      20,
                                                                    ),
                                                                    Text(
                                                                      'Notes (mandatory)',
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight.normal,
                                                                          fontSize: 20),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                        15),
                                                                    TextField(
                                                                      maxLines:
                                                                      2,
                                                                      controller:
                                                                      controllerNotTaken,
                                                                      decoration:
                                                                      InputDecoration(
                                                                        filled:
                                                                        true,
                                                                        fillColor:
                                                                        Colors.white,
                                                                        hintText:
                                                                        '',
                                                                        border:
                                                                        OutlineInputBorder(
                                                                          borderSide: BorderSide(color: Colors.black),
                                                                        ),
                                                                        focusedBorder:
                                                                        OutlineInputBorder(
                                                                          borderSide: BorderSide(width: 1, color: Colors.grey),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                        50),
                                                                  ],
                                                                ),
                                                              ),
                                                              Visibility(
                                                                visible:
                                                                isTakenExpandedList[index],
                                                                child:
                                                                Column(
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                                  children: [
                                                                    SizedBox(
                                                                      height:
                                                                      20,
                                                                    ),
                                                                    Text(
                                                                      'Notes (optional)',
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight.normal,
                                                                          fontSize: 20),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                        15),
                                                                    TextField(
                                                                      maxLines:
                                                                      2,
                                                                      controller:
                                                                      controllerTaken,
                                                                      decoration:
                                                                      InputDecoration(
                                                                        filled:
                                                                        true,
                                                                        fillColor:
                                                                        Colors.white,
                                                                        hintText:
                                                                        '',
                                                                        border:
                                                                        OutlineInputBorder(
                                                                          borderSide: BorderSide(color: Colors.black),
                                                                        ),
                                                                        focusedBorder:
                                                                        OutlineInputBorder(
                                                                          borderSide: BorderSide(width: 1, color: Colors.grey),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                        50),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
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
                                //**Lunchtime

                                //**Evening
                              ],
                            ),
                            Column(
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
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _isAsNeeded = !_isAsNeeded;
                                            });
                                          },
                                          //**inside builder
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Icon(Icons.wb_twighlight),
                                                    Text(
                                                      "As needed",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "${mMedication.data!.asNeeded!.length}"+" meds",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.grey),
                                                    ),
                                                    Icon(
                                                      _isAsNeeded
                                                          ? Icons
                                                          .keyboard_arrow_up
                                                          : Icons
                                                          .keyboard_arrow_down_sharp,
                                                      size: 30,
                                                      color: kDC3Color,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Visibility(
                                                visible: _isAsNeeded,
                                                child: Column(
                                                  children: [
                                                    ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount: mMedication.data!.asNeeded!.length,
                                                      physics: NeverScrollableScrollPhysics(),
                                                      itemBuilder:
                                                          (context,
                                                          index) {
                                                        // isNotTakenExpandedList[index] = !isNotTakenExpandedList[index];
                                                        // isTakenExpandedList[index] = false;
                                                        return Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text(
                                                                "${mMedication.data!.asNeeded![index].medicationName}",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                    20,
                                                                    fontWeight:
                                                                    FontWeight.bold),
                                                              ),
                                                              Text(
                                                                "${mMedication.data!.asNeeded![index].dosage}",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                    16),
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    "${mMedication.data!.asNeeded![index].note1}"+"${mMedication.data!.asNeeded![index].note2}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                        16),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                  height:
                                                                  10),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                                children: [
                                                                  Container(
                                                                    width:
                                                                    150,
                                                                    height:
                                                                    50,
                                                                    child:
                                                                    ElevatedButton(
                                                                      onPressed:
                                                                          () {
                                                                        setState(() {
                                                                          isNotTakenExpandedList[index] = !isNotTakenExpandedList[index];
                                                                          isTakenExpandedList[index] = false;
                                                                        });
                                                                      },
                                                                      style:
                                                                      ElevatedButton.styleFrom(
                                                                        backgroundColor: isNotTakenExpandedList[index]
                                                                            ? Colors.red
                                                                            : Colors.white,
                                                                        shape:
                                                                        RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(20),
                                                                          side: BorderSide(color: Colors.red),
                                                                        ),
                                                                      ),
                                                                      child: Text(
                                                                          'Not taken',
                                                                          style: TextStyle(color: isNotTakenExpandedList[index] ? Colors.white : Colors.red)),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      width:
                                                                      0),
                                                                  Container(
                                                                    width:
                                                                    150,
                                                                    height:
                                                                    50,
                                                                    child:
                                                                    ElevatedButton(
                                                                      onPressed:
                                                                          () {
                                                                        setState(() {
                                                                          isTakenExpandedList[index] = !isTakenExpandedList[index];
                                                                          isNotTakenExpandedList[index] = false;
                                                                        });
                                                                      },
                                                                      style:
                                                                      ElevatedButton.styleFrom(
                                                                        backgroundColor: isTakenExpandedList[index]
                                                                            ? Colors.green
                                                                            : Colors.white,
                                                                        shape:
                                                                        RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(20),
                                                                          side: BorderSide(color: isTakenExpandedList[index] ? Colors.green : Colors.red),
                                                                        ),
                                                                      ),
                                                                      child: Text(
                                                                          'Taken',
                                                                          style: TextStyle(color: isTakenExpandedList[index] ? Colors.white : Colors.red)),
                                                                    ),

                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(height: 10,),
                                                              Container(
                                                                width: double.infinity,
                                                                color: Colors.black12,
                                                                child: Center(
                                                                  child: Text(
                                                                    "${mMedication.data!.asNeeded![index].previousNote}",
                                                                    style: TextStyle(
                                                                        fontSize: 14,
                                                                        color: Colors
                                                                            .black38),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height:
                                                                  10),
                                                              Visibility(
                                                                visible:
                                                                isNotTakenExpandedList[index],
                                                                child:
                                                                Column(
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                                  children: [
                                                                    SizedBox(
                                                                      height:
                                                                      20,
                                                                    ),
                                                                    Text(
                                                                      'Notes (mandatory)',
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight.normal,
                                                                          fontSize: 20),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                        15),
                                                                    TextField(
                                                                      maxLines:
                                                                      2,
                                                                      controller:
                                                                      controllerNotTaken,
                                                                      decoration:
                                                                      InputDecoration(
                                                                        filled:
                                                                        true,
                                                                        fillColor:
                                                                        Colors.white,
                                                                        hintText:
                                                                        '',
                                                                        border:
                                                                        OutlineInputBorder(
                                                                          borderSide: BorderSide(color: Colors.black),
                                                                        ),
                                                                        focusedBorder:
                                                                        OutlineInputBorder(
                                                                          borderSide: BorderSide(width: 1, color: Colors.grey),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                        50),
                                                                  ],
                                                                ),
                                                              ),
                                                              Visibility(
                                                                visible:
                                                                isTakenExpandedList[index],
                                                                child:
                                                                Column(
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                                  children: [
                                                                    SizedBox(
                                                                      height:
                                                                      20,
                                                                    ),
                                                                    Text(
                                                                      'Notes (optional)',
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight.normal,
                                                                          fontSize: 20),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                        15),
                                                                    TextField(
                                                                      maxLines:
                                                                      2,
                                                                      controller:
                                                                      controllerTaken,
                                                                      decoration:
                                                                      InputDecoration(
                                                                        filled:
                                                                        true,
                                                                        fillColor:
                                                                        Colors.white,
                                                                        hintText:
                                                                        '',
                                                                        border:
                                                                        OutlineInputBorder(
                                                                          borderSide: BorderSide(color: Colors.black),
                                                                        ),
                                                                        focusedBorder:
                                                                        OutlineInputBorder(
                                                                          borderSide: BorderSide(width: 1, color: Colors.grey),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                        50),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
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
                                //**Lunchtime

                                //**Evening
                              ],
                            ),

                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: kDC4Color,
                                  minimumSize: const Size.fromHeight(50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text('Save')),
                          ],
                        ),
                      );
                    }
                }
              }),
        ),
      ),
    );
  }
}
