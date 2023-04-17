import 'dart:convert';

import 'package:domiciliary_care/models/samplePosts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:domiciliary_care/screens/patientreport.dart';

class WorkReport {
  String workerName = 'Sujith Raj';
  String dateOfWork = 'Wednesday 23 Mar';
  String clockInTime = '10:33';
  String clockOutTime = '18:53';
  String totaltime = '18:53';
  String careWorker = 'Care Workers ';

  //String careWorkerName = 'Rovin';

  List<SamplePosts> samplePosts = [];
  List<Map<String, dynamic>> iconLists = [
    {
      'isSaved': false,
      'isMedication': true,
      'isBodyMap': false,
      'isFood': false,
      'isDrinks': false,
      'isPersonalCare': false,
      'isToiletAssistance': false,
      'isRepositioning': false,
      'isCompanionshipRespitCare': true,
      'isLaundry': false,
      'isGroceries': false,
      'isHousework': false,
      'isHouseholdChores': true,
      'isUnableToDeliverCare': false,
      'dateOfWork': 'Wednesday 24 Mar',
      'clockInTime': '10:34',
      'clockOutTime': '18:54',
      'totalTime': '2h 88m',
      'careWorker': 'Care Workers',
      'careWorkerName': 'Rovin',
    },
    {
      'isSaved': true,
      'isMedication': false,
      'isBodyMap': true,
      'isFood': true,
      'isDrinks': false,
      'isPersonalCare': false,
      'isToiletAssistance': false,
      'isRepositioning': false,
      'isCompanionshipRespitCare': true,
      'isLaundry': false,
      'isGroceries': false,
      'isHousework': true,
      'isHouseholdChores': false,
      'isUnableToDeliverCare': false,
      'dateOfWork': 'Wednesday 25 Mar',
      'clockInTime': '10:34',
      'clockOutTime': '18:54',
      'totalTime': '2h 88m',
      'careWorker': 'Care Workers',
      'careWorkerName': 'Rovin',
    },
    {
      'isSaved': false,
      'isMedication': true,
      'isBodyMap': false,
      'isFood': false,
      'isDrinks': false,
      'isPersonalCare': false,
      'isToiletAssistance': false,
      'isRepositioning': false,
      'isCompanionshipRespitCare': false,
      'isLaundry': false,
      'isGroceries': false,
      'isHousework': false,
      'isHouseholdChores': false,
      'isUnableToDeliverCare': true,
      'dateOfWork': 'Wednesday 26 Mar',
      'clockInTime': '10:34',
      'clockOutTime': '-',
      'totalTime': '2h 88m',
      'careWorker': 'Care Workers',
      'careWorkerName': 'Sujith',
    },
    {
      'isSaved': false,
      'isMedication': true,
      'isBodyMap': false,
      'isFood': false,
      'isDrinks': false,
      'isPersonalCare': false,
      'isToiletAssistance': false,
      'isRepositioning': true,
      'isCompanionshipRespitCare': true,
      'isLaundry': false,
      'isGroceries': false,
      'isHousework': false,
      'isHouseholdChores': false,
      'isUnableToDeliverCare': false,
      'dateOfWork': 'Wednesday 27 Mar',
      'clockInTime': '10:34',
      'clockOutTime': '18:54',
      'totalTime': '2h 88m',
      'careWorker': 'Care Workers',
      'careWorkerName': 'Rovin',
    },
    {
      'isSaved': true,
      'isMedication': true,
      'isBodyMap': false,
      'isFood': false,
      'isDrinks': false,
      'isPersonalCare': false,
      'isToiletAssistance': false,
      'isRepositioning': false,
      'isCompanionshipRespitCare': true,
      'isLaundry': false,
      'isGroceries': false,
      'isHousework': false,
      'isHouseholdChores': false,
      'isUnableToDeliverCare': true,
      'dateOfWork': 'Wednesday 27 Mar',
      'clockInTime': '10:34',
      'clockOutTime': '-',
      'totalTime': '2h 88m',
      'careWorker': 'Care Workers',
      'careWorkerName': 'Rovin',
    },
    {
      'isSaved': false,
      'isMedication': true,
      'isBodyMap': false,
      'isFood': false,
      'isDrinks': false,
      'isPersonalCare': false,
      'isToiletAssistance': false,
      'isRepositioning': false,
      'isCompanionshipRespitCare': true,
      'isLaundry': false,
      'isGroceries': false,
      'isHousework': false,
      'isHouseholdChores': false,
      'isUnableToDeliverCare': true,
      'dateOfWork': 'Wednesday 24 Mar',
      'clockInTime': '10:34',
      'clockOutTime': '18:54',
      'totalTime': '2h 88m',
      'careWorker': 'Care Workers',
      'careWorkerName': 'Rovin',
    },
    {
      'isSaved': false,
      'isMedication': true,
      'isBodyMap': false,
      'isFood': false,
      'isDrinks': false,
      'isPersonalCare': false,
      'isToiletAssistance': false,
      'isRepositioning': false,
      'isCompanionshipRespitCare': true,
      'isLaundry': false,
      'isGroceries': false,
      'isHousework': false,
      'isHouseholdChores': false,
      'isUnableToDeliverCare': true,
      'dateOfWork': 'Wednesday 24 Mar',
      'clockInTime': '10:34',
      'clockOutTime': '18:54',
      'totalTime': '2h 88m',
      'careWorker': 'Care Workers',
      'careWorkerName': 'Rovin',
    },
    {
      'isSaved': false,
      'isMedication': true,
      'isBodyMap': false,
      'isFood': false,
      'isDrinks': false,
      'isPersonalCare': false,
      'isToiletAssistance': false,
      'isRepositioning': false,
      'isCompanionshipRespitCare': true,
      'isLaundry': false,
      'isGroceries': false,
      'isHousework': false,
      'isHouseholdChores': false,
      'isUnableToDeliverCare': true,
      'dateOfWork': 'Wednesday 24 Mar',
      'clockInTime': '10:34',
      'clockOutTime': '18:54',
      'totalTime': '2h 88m',
      'careWorker': 'Care Workers',
      'careWorkerName': 'Rovin',
    },
  ];

  WorkReport();

  Future<List<SamplePosts>> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        samplePosts.add(SamplePosts.fromJson(index));
      }
      return samplePosts;
    } else {
      return samplePosts;
    }
  }
}
