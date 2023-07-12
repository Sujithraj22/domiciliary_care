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

  //bool isNotTaken = false;
  //bool isTaken = false;
  // bool isNotTakenExpanded = false;
  // bool isTakenExpanded = false;
  // late List<bool> isMorningNotTakenExpandedList = [true, false];
  // late List<bool> isMorningTakenExpandedList= [true, false];
  List<bool> isMorningNotTakenExpandedList =
      List.generate(10, (index) => false);
  List<bool> isLunchtimeNotTakenExpandedList =
      List.generate(10, (index) => false);
  List<bool> isEveningNotTakenExpandedList =
      List.generate(10, (index) => false);
  List<bool> isBedtimeNotTakenExpandedList =
      List.generate(10, (index) => false);
  List<bool> isAsneededNotTakenExpandedList =
      List.generate(10, (index) => false);

  List<bool> isMorningTakenExpandedList = List.generate(10, (index) => false);
  List<bool> isLunchtimeTakenExpandedList = List.generate(10, (index) => false);
  List<bool> isEveningTakenExpandedList = List.generate(10, (index) => false);
  List<bool> isBedtimeTakenExpandedList = List.generate(10, (index) => false);
  List<bool> isAsneededTakenExpandedList = List.generate(10, (index) => false);

  // List<bool>? isMorningNotTakenExpandedList;
  // List<bool>? isMorningTakenExpandedList;
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
              builder: (BuildContext context,
                  AsyncSnapshot<Medication> mMedication) {
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
                                                    Icon(Icons.wb_twighlight,color: mMedication.data!.morning!.length==0?Colors.grey:Colors.black),
                                                    Text(
                                                      "Morning",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,color: mMedication.data!.morning!.length==0?Colors.grey:Colors.black),
                                                    ),
                                                    Text(
                                                      "${mMedication.data!.morning!.length == 0 ? "No" : "${mMedication.data!.morning!.length}"}" +
                                                          " meds",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.grey),
                                                    ),
                                                    mMedication.data!.morning!
                                                        .length !=
                                                        0
                                                        ? Icon(
                                                      _isMorning
                                                          ? Icons
                                                          .keyboard_arrow_up
                                                          : Icons
                                                          .keyboard_arrow_down_sharp,
                                                      size: 30,
                                                      color: kDC3Color,
                                                    )
                                                        : SizedBox(width: 25),
                                                  ],
                                                ),
                                              ),
                                              Visibility(
                                                visible: _isMorning,
                                                child: Column(
                                                  children: [
                                                    ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount: mMedication
                                                          .data!
                                                          .morning!
                                                          .length,
                                                      physics:
                                                          NeverScrollableScrollPhysics(),
                                                      itemBuilder:
                                                          (context, index) {
                                                        // isMorningNotTakenExpandedList[index] = !isMorningNotTakenExpandedList[index];
                                                        // isMorningTakenExpandedList[index] = false;
                                                        // isMorningNotTakenExpandedList = List.generate(10, (index) => false);
                                                        // isMorningTakenExpandedList = List.generate(10, (index) => false);
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
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
                                                                        FontWeight
                                                                            .bold),
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
                                                                    "${mMedication.data!.morning![index].note1}" +
                                                                        "${mMedication.data!.morning![index].note2}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                  height: 10),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Container(
                                                                    width: 150,
                                                                    height: 50,
                                                                    child:
                                                                        ElevatedButton(
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          isMorningNotTakenExpandedList[index] =
                                                                              !isMorningNotTakenExpandedList[index];
                                                                          //isMorningNotTakenExpandedList[index] = true;
                                                                          isMorningTakenExpandedList[index] =
                                                                              false;
                                                                        });
                                                                      },
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        backgroundColor: isMorningNotTakenExpandedList[index]
                                                                            ? Colors.red
                                                                            : Colors.white,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(20),
                                                                          side:
                                                                              BorderSide(color: Colors.red),
                                                                        ),
                                                                      ),
                                                                      child: Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Icon(isMorningNotTakenExpandedList[index] ?Icons.check_circle_outline_rounded:Icons.close_rounded, color:isMorningNotTakenExpandedList[index] ? Colors.white : Colors.red),
                                                                          Text(
                                                                              'Not taken',
                                                                              style:
                                                                                  TextStyle(color: isMorningNotTakenExpandedList[index] ? Colors.white : Colors.red)),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      width: 0),
                                                                  Container(
                                                                    width: 150,
                                                                    height: 50,
                                                                    child:
                                                                        ElevatedButton(
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          isMorningTakenExpandedList[index] =
                                                                              !isMorningTakenExpandedList[index];
                                                                          isMorningNotTakenExpandedList[index] =
                                                                              false;
                                                                        });
                                                                      },
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        backgroundColor: isMorningTakenExpandedList[index]
                                                                            ? Colors.green
                                                                            : Colors.white,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(20),
                                                                          side:
                                                                              BorderSide(color: isMorningTakenExpandedList[index] ? Colors.green : Colors.green),
                                                                        ),
                                                                      ),
                                                                      child: Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Icon(isMorningTakenExpandedList[index] ?Icons.check_circle_outline_rounded:Icons.close_rounded, color:isMorningTakenExpandedList[index] ? Colors.white : Colors.green),
                                                                          Text(
                                                                              'Taken',
                                                                              style:
                                                                                  TextStyle(color: isMorningTakenExpandedList[index] ? Colors.white : Colors.green)),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),

                                                              SizedBox(
                                                                  height: 10),
                                                              Visibility(
                                                                visible:
                                                                    isMorningNotTakenExpandedList[
                                                                        index],
                                                                child: Column(
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
                                                                          fontWeight: FontWeight
                                                                              .normal,
                                                                          fontSize:
                                                                              20),
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
                                                                          borderSide:
                                                                              BorderSide(color: Colors.black),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              width: 1,
                                                                              color: Colors.grey),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            25),
                                                                  ],
                                                                ),
                                                              ),
                                                              Visibility(
                                                                visible:
                                                                    isMorningTakenExpandedList[
                                                                        index],
                                                                child: Column(
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
                                                                          fontWeight: FontWeight
                                                                              .normal,
                                                                          fontSize:
                                                                              20),
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
                                                                          borderSide:
                                                                              BorderSide(color: Colors.black),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              width: 1,
                                                                              color: Colors.grey),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            25),
                                                                  ],
                                                                ),
                                                              ),

                                                              Container(
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .black12,
                                                                    border: Border.all(
                                                                     color: Colors.grey,
                                                                    ),
                                                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                                                ),
                                                                width: double
                                                                    .infinity,

                                                                child: Center(
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.all(8.0),
                                                                    child: Text(
                                                                      "${mMedication.data!.morning![index].previousNote}",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                          14,
                                                                          color: Colors
                                                                              .black38),
                                                                    ),
                                                                  ),
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
                            //Lunchtime
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
                                              _isLunchtime = !_isLunchtime;
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
                                                    Icon(Icons.wb_sunny_rounded,color: mMedication.data!.lunchTime!.length==0?Colors.grey:Colors.black),
                                                    Text(
                                                      "Lunchtime",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,color: mMedication.data!.lunchTime!.length==0?Colors.grey:Colors.black),
                                                    ),
                                                    Text(
                                                      "${mMedication.data!.lunchTime!.length == 0 ? "No" : "${mMedication.data!.lunchTime!.length}"}" +
                                                          " meds",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.grey),
                                                    ),
                                                    mMedication.data!.lunchTime!
                                                                .length !=
                                                            0
                                                        ? Icon(
                                                            _isLunchtime
                                                                ? Icons
                                                                    .keyboard_arrow_up
                                                                : Icons
                                                                    .keyboard_arrow_down_sharp,
                                                            size: 30,
                                                            color: kDC3Color,
                                                          )
                                                        : SizedBox(width: 25),
                                                  ],
                                                ),
                                              ),
                                              Visibility(
                                                visible: _isLunchtime,
                                                child: Column(
                                                  children: [
                                                    ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount: mMedication
                                                          .data!
                                                          .lunchTime!
                                                          .length,
                                                      physics:
                                                          NeverScrollableScrollPhysics(),
                                                      itemBuilder:
                                                          (context, index) {
                                                        // isMorningNotTakenExpandedList[index] = !isMorningNotTakenExpandedList[index];
                                                        // isMorningTakenExpandedList[index] = false;
                                                        // isMorningNotTakenExpandedList = List.generate(10, (index) => false);
                                                        // isMorningTakenExpandedList = List.generate(10, (index) => false);
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "${mMedication.data!.lunchTime![index].medicationName}",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Text(
                                                                "${mMedication.data!.lunchTime![index].dosage}",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    "${mMedication.data!.lunchTime![index].note1}" +
                                                                        "${mMedication.data!.lunchTime![index].note2}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                  height: 10),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                                children: [
                                                                  Container(
                                                                    width: 150,
                                                                    height: 50,
                                                                    child:
                                                                    ElevatedButton(
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                                () {
                                                                              isLunchtimeNotTakenExpandedList[index] =
                                                                              !isLunchtimeNotTakenExpandedList[index];
                                                                              //isEveningNotTakenExpandedList[index] = true;
                                                                              isLunchtimeTakenExpandedList[index] =
                                                                              false;
                                                                            });
                                                                      },
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        backgroundColor: isLunchtimeNotTakenExpandedList[index]
                                                                            ? Colors.red
                                                                            : Colors.white,
                                                                        shape:
                                                                        RoundedRectangleBorder(
                                                                          borderRadius:
                                                                          BorderRadius.circular(20),
                                                                          side:
                                                                          BorderSide(color: Colors.red),
                                                                        ),
                                                                      ),
                                                                      child: Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Icon(isLunchtimeNotTakenExpandedList[index] ?Icons.check_circle_outline_rounded:Icons.close_rounded, color:isMorningNotTakenExpandedList[index] ? Colors.white : Colors.red),
                                                                          Text(
                                                                              'Not taken',
                                                                              style:
                                                                              TextStyle(color: isLunchtimeNotTakenExpandedList[index] ? Colors.white : Colors.red)),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      width: 0),
                                                                  Container(
                                                                    width: 150,
                                                                    height: 50,
                                                                    child:
                                                                    ElevatedButton(
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                                () {
                                                                              isLunchtimeTakenExpandedList[index] =
                                                                              !isLunchtimeTakenExpandedList[index];
                                                                              isLunchtimeNotTakenExpandedList[index] =
                                                                              false;
                                                                            });
                                                                      },
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        backgroundColor: isLunchtimeTakenExpandedList[index]
                                                                            ? Colors.green
                                                                            : Colors.white,
                                                                        shape:
                                                                        RoundedRectangleBorder(
                                                                          borderRadius:
                                                                          BorderRadius.circular(20),
                                                                          side:
                                                                          BorderSide(color: isLunchtimeTakenExpandedList[index] ? Colors.green : Colors.green),
                                                                        ),
                                                                      ),
                                                                      child: Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Icon(isLunchtimeTakenExpandedList[index] ?Icons.check_circle_outline_rounded:Icons.close_rounded, color:isLunchtimeTakenExpandedList[index] ? Colors.white : Colors.green),
                                                                          Text(
                                                                              'Taken',
                                                                              style:
                                                                              TextStyle(color: isLunchtimeTakenExpandedList[index] ? Colors.white : Colors.green)),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                color: Colors
                                                                    .black12,
                                                                child: Center(
                                                                  child: Text(
                                                                    "${mMedication.data!.morning![index].previousNote}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .black38),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 10),
                                                              Visibility(
                                                                visible:
                                                                    isLunchtimeNotTakenExpandedList[
                                                                        index],
                                                                child: Column(
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
                                                                          fontWeight: FontWeight
                                                                              .normal,
                                                                          fontSize:
                                                                              20),
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
                                                                          borderSide:
                                                                              BorderSide(color: Colors.black),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              width: 1,
                                                                              color: Colors.grey),
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
                                                                    isLunchtimeTakenExpandedList[
                                                                        index],
                                                                child: Column(
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
                                                                          fontWeight: FontWeight
                                                                              .normal,
                                                                          fontSize:
                                                                              20),
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
                                                                          borderSide:
                                                                              BorderSide(color: Colors.black),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              width: 1,
                                                                              color: Colors.grey),
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
                            //Evening
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
                                                    Icon(Icons.wb_twighlight,color: mMedication.data!.evening!.length==0?Colors.grey:Colors.black),
                                                    Text(
                                                      "Evening",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,color: mMedication.data!.evening!.length==0?Colors.grey:Colors.black),
                                                    ),
                                                    Text(
                                                      "${mMedication.data!.evening!.length == 0 ? "No" : "${mMedication.data!.evening!.length}"}" +
                                                          " meds",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.grey),
                                                    ),
                                                    mMedication.data!.evening!
                                                        .length !=
                                                        0
                                                        ? Icon(
                                                      _isEvening
                                                          ? Icons
                                                          .keyboard_arrow_up
                                                          : Icons
                                                          .keyboard_arrow_down_sharp,
                                                      size: 30,
                                                      color: kDC3Color,
                                                    )
                                                        : SizedBox(width: 25),
                                                  ],
                                                ),
                                              ),
                                              Visibility(
                                                visible: _isEvening,
                                                child: Column(
                                                  children: [
                                                    ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount: mMedication
                                                          .data!
                                                          .evening!
                                                          .length,
                                                      physics:
                                                          NeverScrollableScrollPhysics(),
                                                      itemBuilder:
                                                          (context, index) {
                                                        // isMorningNotTakenExpandedList[index] = !isMorningNotTakenExpandedList[index];
                                                        // isMorningTakenExpandedList[index] = false;
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
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
                                                                        FontWeight
                                                                            .bold),
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
                                                                    "${mMedication.data!.evening![index].note1}" +
                                                                        "${mMedication.data!.evening![index].note2}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                  height: 10),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                                children: [
                                                                  Container(
                                                                    width: 150,
                                                                    height: 50,
                                                                    child:
                                                                    ElevatedButton(
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                                () {
                                                                              isEveningNotTakenExpandedList[index] =
                                                                              !isEveningNotTakenExpandedList[index];
                                                                              //isEveningNotTakenExpandedList[index] = true;
                                                                              isEveningTakenExpandedList[index] =
                                                                              false;
                                                                            });
                                                                      },
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        backgroundColor: isEveningNotTakenExpandedList[index]
                                                                            ? Colors.red
                                                                            : Colors.white,
                                                                        shape:
                                                                        RoundedRectangleBorder(
                                                                          borderRadius:
                                                                          BorderRadius.circular(20),
                                                                          side:
                                                                          BorderSide(color: Colors.red),
                                                                        ),
                                                                      ),
                                                                      child: Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Icon(isEveningNotTakenExpandedList[index] ?Icons.check_circle_outline_rounded:Icons.close_rounded, color:isEveningNotTakenExpandedList[index] ? Colors.white : Colors.red),
                                                                          Text(
                                                                              'Not taken',
                                                                              style:
                                                                              TextStyle(color: isEveningNotTakenExpandedList[index] ? Colors.white : Colors.red)),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      width: 0),
                                                                  Container(
                                                                    width: 150,
                                                                    height: 50,
                                                                    child:
                                                                    ElevatedButton(
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                                () {
                                                                              isEveningTakenExpandedList[index] =
                                                                              !isEveningTakenExpandedList[index];
                                                                              isEveningNotTakenExpandedList[index] =
                                                                              false;
                                                                            });
                                                                      },
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        backgroundColor: isEveningTakenExpandedList[index]
                                                                            ? Colors.green
                                                                            : Colors.white,
                                                                        shape:
                                                                        RoundedRectangleBorder(
                                                                          borderRadius:
                                                                          BorderRadius.circular(20),
                                                                          side:
                                                                          BorderSide(color: isEveningTakenExpandedList[index] ? Colors.green : Colors.green),
                                                                        ),
                                                                      ),
                                                                      child: Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Icon(isEveningTakenExpandedList[index] ?Icons.check_circle_outline_rounded:Icons.close_rounded, color:isEveningTakenExpandedList[index] ? Colors.white : Colors.green),
                                                                          Text(
                                                                              'Taken',
                                                                              style:
                                                                              TextStyle(color: isEveningTakenExpandedList[index] ? Colors.white : Colors.green)),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                color: Colors
                                                                    .black12,
                                                                child: Center(
                                                                  child: Text(
                                                                    "${mMedication.data!.evening![index].previousNote}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .black38),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 10),
                                                              Visibility(
                                                                visible:
                                                                    isEveningNotTakenExpandedList[
                                                                        index],
                                                                child: Column(
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
                                                                          fontWeight: FontWeight
                                                                              .normal,
                                                                          fontSize:
                                                                              20),
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
                                                                          borderSide:
                                                                              BorderSide(color: Colors.black),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              width: 1,
                                                                              color: Colors.grey),
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
                                                                    isEveningTakenExpandedList[
                                                                        index],
                                                                child: Column(
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
                                                                          fontWeight: FontWeight
                                                                              .normal,
                                                                          fontSize:
                                                                              20),
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
                                                                          borderSide:
                                                                              BorderSide(color: Colors.black),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              width: 1,
                                                                              color: Colors.grey),
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
                            //Bedtime
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
                                                    Icon(Icons.bedtime_rounded,color: mMedication.data!.bedTime!.length==0?Colors.grey:Colors.black),
                                                    Text(
                                                      "Bed time",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,color: mMedication.data!.bedTime!.length==0?Colors.grey:Colors.black),
                                                    ),
                                                    Text(
                                                      "${mMedication.data!.bedTime!.length == 0 ? "No" : "${mMedication.data!.bedTime!.length}"}" +
                                                          " meds",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.grey),
                                                    ),
                                                    mMedication.data!.bedTime!
                                                        .length !=
                                                        0
                                                        ? Icon(
                                                      _isBedTime
                                                          ? Icons
                                                          .keyboard_arrow_up
                                                          : Icons
                                                          .keyboard_arrow_down_sharp,
                                                      size: 30,
                                                      color: kDC3Color,
                                                    )
                                                        : SizedBox(width: 25),
                                                  ],
                                                ),
                                              ),
                                              Visibility(
                                                visible: _isBedTime,
                                                child: Column(
                                                  children: [
                                                    ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount: mMedication
                                                          .data!
                                                          .bedTime!
                                                          .length,
                                                      physics:
                                                          NeverScrollableScrollPhysics(),
                                                      itemBuilder:
                                                          (context, index) {
                                                        // isEveningNotTakenExpandedList[index] = !isEveningNotTakenExpandedList[index];
                                                        // isEveningTakenExpandedList[index] = false;
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
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
                                                                        FontWeight
                                                                            .bold),
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
                                                                    "${mMedication.data!.bedTime![index].note1}" +
                                                                        "${mMedication.data!.bedTime![index].note2}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                  height: 10),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                                children: [
                                                                  Container(
                                                                    width: 150,
                                                                    height: 50,
                                                                    child:
                                                                    ElevatedButton(
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                                () {
                                                                              isBedtimeNotTakenExpandedList[index] =
                                                                              !isBedtimeNotTakenExpandedList[index];
                                                                              //isBedtimeNotTakenExpandedList[index] = true;
                                                                              isBedtimeTakenExpandedList[index] =
                                                                              false;
                                                                            });
                                                                      },
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        backgroundColor: isBedtimeNotTakenExpandedList[index]
                                                                            ? Colors.red
                                                                            : Colors.white,
                                                                        shape:
                                                                        RoundedRectangleBorder(
                                                                          borderRadius:
                                                                          BorderRadius.circular(20),
                                                                          side:
                                                                          BorderSide(color: Colors.red),
                                                                        ),
                                                                      ),
                                                                      child: Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Icon(isBedtimeNotTakenExpandedList[index] ?Icons.check_circle_outline_rounded:Icons.close_rounded, color:isBedtimeNotTakenExpandedList[index] ? Colors.white : Colors.red),
                                                                          Text(
                                                                              'Not taken',
                                                                              style:
                                                                              TextStyle(color: isBedtimeNotTakenExpandedList[index] ? Colors.white : Colors.red)),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      width: 0),
                                                                  Container(
                                                                    width: 150,
                                                                    height: 50,
                                                                    child:
                                                                    ElevatedButton(
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                                () {
                                                                              isBedtimeTakenExpandedList[index] =
                                                                              !isBedtimeTakenExpandedList[index];
                                                                              isBedtimeNotTakenExpandedList[index] =
                                                                              false;
                                                                            });
                                                                      },
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        backgroundColor: isBedtimeTakenExpandedList[index]
                                                                            ? Colors.green
                                                                            : Colors.white,
                                                                        shape:
                                                                        RoundedRectangleBorder(
                                                                          borderRadius:
                                                                          BorderRadius.circular(20),
                                                                          side:
                                                                          BorderSide(color: isBedtimeTakenExpandedList[index] ? Colors.green : Colors.green),
                                                                        ),
                                                                      ),
                                                                      child: Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Icon(isBedtimeTakenExpandedList[index] ?Icons.check_circle_outline_rounded:Icons.close_rounded, color:isBedtimeTakenExpandedList[index] ? Colors.white : Colors.green),
                                                                          Text(
                                                                              'Taken',
                                                                              style:
                                                                              TextStyle(color: isBedtimeTakenExpandedList[index] ? Colors.white : Colors.green)),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                color: Colors
                                                                    .black12,
                                                                child: Center(
                                                                  child: Text(
                                                                    "${mMedication.data!.bedTime![index].previousNote}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .black38),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 10),
                                                              Visibility(
                                                                visible:
                                                                    isBedtimeNotTakenExpandedList[
                                                                        index],
                                                                child: Column(
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
                                                                          fontWeight: FontWeight
                                                                              .normal,
                                                                          fontSize:
                                                                              20),
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
                                                                          borderSide:
                                                                              BorderSide(color: Colors.black),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              width: 1,
                                                                              color: Colors.grey),
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
                                                                    isBedtimeTakenExpandedList[
                                                                        index],
                                                                child: Column(
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
                                                                          fontWeight: FontWeight
                                                                              .normal,
                                                                          fontSize:
                                                                              20),
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
                                                                          borderSide:
                                                                              BorderSide(color: Colors.black),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              width: 1,
                                                                              color: Colors.grey),
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
                            //asneeded
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
                                                    Icon(Icons.schedule_rounded,color: mMedication.data!.asNeeded!.length==0?Colors.grey:Colors.black),
                                                    Text(
                                                      "As needed",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,color: mMedication.data!.asNeeded!.length==0?Colors.grey:Colors.black),
                                                    ),
                                                    Text(
                                                      "${mMedication.data!.asNeeded!.length == 0 ? "No" : "${mMedication.data!.asNeeded!.length}"}" +
                                                          " meds",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.grey),
                                                    ),
                                                    mMedication.data!.asNeeded!
                                                        .length !=
                                                        0
                                                        ? Icon(
                                                      _isAsNeeded
                                                          ? Icons
                                                          .keyboard_arrow_up
                                                          : Icons
                                                          .keyboard_arrow_down_sharp,
                                                      size: 30,
                                                      color: kDC3Color,
                                                    )
                                                        : SizedBox(width: 25),
                                                  ],
                                                ),
                                              ),
                                              Visibility(
                                                visible: _isAsNeeded,
                                                child: Column(
                                                  children: [
                                                    ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount: mMedication
                                                          .data!
                                                          .asNeeded!
                                                          .length,
                                                      physics:
                                                          NeverScrollableScrollPhysics(),
                                                      itemBuilder:
                                                          (context, index) {
                                                        // isBedtimeNotTakenExpandedList[index] = !isBedtimeNotTakenExpandedList[index];
                                                        // isBedtimeTakenExpandedList[index] = false;
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
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
                                                                        FontWeight
                                                                            .bold),
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
                                                                    "${mMedication.data!.asNeeded![index].note1}" +
                                                                        "${mMedication.data!.asNeeded![index].note2}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                  height: 10),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                                children: [
                                                                  Container(
                                                                    width: 150,
                                                                    height: 50,
                                                                    child:
                                                                    ElevatedButton(
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                                () {
                                                                              isAsneededNotTakenExpandedList[index] =
                                                                              !isAsneededNotTakenExpandedList[index];
                                                                              //isAsneededNotTakenExpandedList[index] = true;
                                                                              isAsneededTakenExpandedList[index] =
                                                                              false;
                                                                            });
                                                                      },
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        backgroundColor: isAsneededNotTakenExpandedList[index]
                                                                            ? Colors.red
                                                                            : Colors.white,
                                                                        shape:
                                                                        RoundedRectangleBorder(
                                                                          borderRadius:
                                                                          BorderRadius.circular(20),
                                                                          side:
                                                                          BorderSide(color: Colors.red),
                                                                        ),
                                                                      ),
                                                                      child: Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Icon(isAsneededNotTakenExpandedList[index] ?Icons.check_circle_outline_rounded:Icons.close_rounded, color:isAsneededNotTakenExpandedList[index] ? Colors.white : Colors.red),
                                                                          Text(
                                                                              'Not taken',
                                                                              style:
                                                                              TextStyle(color: isAsneededNotTakenExpandedList[index] ? Colors.white : Colors.red)),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      width: 0),
                                                                  Container(
                                                                    width: 150,
                                                                    height: 50,
                                                                    child:
                                                                    ElevatedButton(
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                                () {
                                                                              isAsneededTakenExpandedList[index] =
                                                                              !isAsneededTakenExpandedList[index];
                                                                              isAsneededNotTakenExpandedList[index] =
                                                                              false;
                                                                            });
                                                                      },
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        backgroundColor: isAsneededTakenExpandedList[index]
                                                                            ? Colors.green
                                                                            : Colors.white,
                                                                        shape:
                                                                        RoundedRectangleBorder(
                                                                          borderRadius:
                                                                          BorderRadius.circular(20),
                                                                          side:
                                                                          BorderSide(color: isAsneededTakenExpandedList[index] ? Colors.green : Colors.green),
                                                                        ),
                                                                      ),
                                                                      child: Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Icon(isAsneededTakenExpandedList[index] ?Icons.check_circle_outline_rounded:Icons.close_rounded, color:isAsneededTakenExpandedList[index] ? Colors.white : Colors.green),
                                                                          Text(
                                                                              'Taken',
                                                                              style:
                                                                              TextStyle(color: isAsneededTakenExpandedList[index] ? Colors.white : Colors.green)),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                color: Colors
                                                                    .black12,
                                                                child: Center(
                                                                  child: Text(
                                                                    "${mMedication.data!.asNeeded![index].previousNote}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .black38),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 10),
                                                              Visibility(
                                                                visible:
                                                                    isAsneededNotTakenExpandedList[
                                                                        index],
                                                                child: Column(
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
                                                                          fontWeight: FontWeight
                                                                              .normal,
                                                                          fontSize:
                                                                              20),
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
                                                                          borderSide:
                                                                              BorderSide(color: Colors.black),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              width: 1,
                                                                              color: Colors.grey),
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
                                                                    isAsneededTakenExpandedList[
                                                                        index],
                                                                child: Column(
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
                                                                          fontWeight: FontWeight
                                                                              .normal,
                                                                          fontSize:
                                                                              20),
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
                                                                          borderSide:
                                                                              BorderSide(color: Colors.black),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              width: 1,
                                                                              color: Colors.grey),
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
