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
      'isMedication': true,
      'isBodyMap' : true,
      'isFood' : true,
      'isDrinks' : true,
      'isPersonalCare' : true,
      'isToiletAssistance' : true,
      'isRepositioning' : true,
      'isCompanionshipRespitCare' : true,
      'isLaundry' : true,
      'isGroceries' : true,
      'isHousework' : true,
      'isHouseholdChores' : true,
      'isUnableToDeliverCare' : true,
      'dateOfWork': 'Wednesday 24 Mar',
      'clockInTime': '10:34',
      'clockOutTime': '18:54',
      'totalTime': '28:88',
      'careWorker': 'Care Workers',
      'careWorkerName': 'Rovin',
    },
    {
      'isMedication': true,
      'dateOfWork': 'Wednesday 25 Mar',
      'clockInTime': '11:34',
      'clockOutTime': '19:54',
      'totalTime': '30:88',
      'careWorker': 'Care Worker',
      'careWorkerName': 'Sujith',
    },
    {
      'isMedication': true,
      'dateOfWork': 'Wednesday 25 Mar',
      'clockInTime': '11:34',
      'clockOutTime': '19:54',
      'totalTime': '30:88',
      'careWorker': 'Care Worker',
      'careWorkerName': 'Sujith',
    },
    {
      'isMedication': true,
      'dateOfWork': 'Wednesday 25 Mar',
      'clockInTime': '11:34',
      'clockOutTime': '19:54',
      'totalTime': '30:88',
      'careWorker': 'Care Worker',
      'careWorkerName': 'Sujith',
    },
    {
      'isMedication': true,
      'dateOfWork': 'Wednesday 25 Mar',
      'clockInTime': '11:34',
      'clockOutTime': '19:54',
      'totalTime': '30:88',
      'careWorker': 'Care Worker',
      'careWorkerName': 'John doe',
    },
    {
      'isMedication': true,
      'dateOfWork': 'Wednesday 25 Mar',
      'clockInTime': '11:34',
      'clockOutTime': '19:54',
      'totalTime': '30:88',
      'careWorker': 'Care Worker',
      'careWorkerName': 'Sujith',
    },
    {
      'isMedication': true,
      'dateOfWork': 'Wednesday 25 Mar',
      'clockInTime': '11:34',
      'clockOutTime': '19:54',
      'totalTime': '30:88',
      'careWorker': 'Care Worker',
      'careWorkerName': 'Sujith',
    },
    {
      'isMedication': true,
      'dateOfWork': 'Wednesday 25 Mar',
      'clockInTime': '11:34',
      'clockOutTime': '19:54',
      'totalTime': '30:88',
      'careWorker': 'Care Worker',
      'careWorkerName': 'John Doe',
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
