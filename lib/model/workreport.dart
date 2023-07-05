//***************************API Data *******************************

import 'dart:convert';

import 'package:u20x_native/model/samplePosts.dart';
//import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:u20x_native/views/dc/patientreport.dart';

class WorkReport {
  String workerName = 'Sujith Raj';
  String dateOfWork = 'Wednesday 23 Mar';
  String clockInTime = '10:33';
  String clockOutTime = '18:53';
  String totalTime = '18:53';
  String careWorker = 'Care Workers ';

  //String careWorkerName = 'Rovin';
  List<Map<String, dynamic>> workerReportData = [
    {
      "dateOfWork": "Wednesday 24 Apr",
      "workData": [
        {
          "isSaved": false,
          "isMedication": true,
          "isBodyMap": false,
          "isFood": false,
          "isDrinks": false,
          "isPersonalCare": false,
          "isToiletAssistance": false,
          "isRepositioning": false,
          "isCompanionshipRespiteCare": true,
          "isLaundry": false,
          "isGroceries": false,
          "isHousework": false,
          "isHouseholdChores": true,
          "isUnableToDeliverCare": false,
          "clockInTime": "10:35",
          "clockOutTime": "18:54",
          "totalTime": "2h 88m",
          "careWorker": "Care Workers",
          "careWorkerName": "Rovin1"
        },
        {
          "isSaved": false,
          "isMedication": true,
          "isBodyMap": false,
          "isFood": false,
          "isDrinks": false,
          "isPersonalCare": true,
          "isToiletAssistance": false,
          "isRepositioning": false,
          "isCompanionshipRespiteCare": false,
          "isLaundry": true,
          "isGroceries": false,
          "isHousework": false,
          "isHouseholdChores": true,
          "isUnableToDeliverCare": false,
          "clockInTime": "10:34",
          "clockOutTime": "18:54",
          "totalTime": "2h 88m",
          "careWorker": "Care Workers",
          "careWorkerName": "Rovin2"
        }
      ]
    },
    {
      "dateOfWork": "Wednesday 25 Apr",
      "workData": [
        {
          "isSaved": false,
          "isMedication": true,
          "isBodyMap": false,
          "isFood": false,
          "isDrinks": false,
          "isPersonalCare": false,
          "isToiletAssistance": true,
          "isRepositioning": true,
          "isCompanionshipRespiteCare": false,
          "isLaundry": false,
          "isGroceries": false,
          "isHousework": false,
          "isHouseholdChores": false,
          "isUnableToDeliverCare": false,
          "clockInTime": "10:34",
          "clockOutTime": "-",
          "totalTime": "2h 88m",
          "careWorker": "Care Workers",
          "careWorkerName": "Rovin3"
        }
      ]
    },
    {
      "dateOfWork": "Wednesday 29 Apr",
      "workData": [
        {
          "isSaved": false,
          "isMedication": true,
          "isBodyMap": false,
          "isFood": false,
          "isDrinks": false,
          "isPersonalCare": false,
          "isToiletAssistance": false,
          "isRepositioning": false,
          "isCompanionshipRespiteCare": true,
          "isLaundry": false,
          "isGroceries": false,
          "isHousework": false,
          "isHouseholdChores": true,
          "isUnableToDeliverCare": false,
          "clockInTime": "10:34",
          "clockOutTime": "18:54",
          "totalTime": "2h 88m",
          "careWorker": "Care Workers",
          "careWorkerName": "Rovin4"
        },
        {
          "isSaved": false,
          "isMedication": true,
          "isBodyMap": false,
          "isFood": false,
          "isDrinks": false,
          "isPersonalCare": false,
          "isToiletAssistance": false,
          "isRepositioning": false,
          "isCompanionshipRespiteCare": true,
          "isLaundry": false,
          "isGroceries": false,
          "isHousework": false,
          "isHouseholdChores": true,
          "isUnableToDeliverCare": false,
          "clockInTime": "10:34",
          "clockOutTime": "18:54",
          "totalTime": "2h 88m",
          "careWorker": "Care Workers",
          "careWorkerName": "Rovin5"
        }
      ]
    },
    {
      "dateOfWork": "Wednesday 30 Apr",
      "workData": [
        {
          "isSaved": false,
          "isMedication": true,
          "isBodyMap": false,
          "isFood": false,
          "isDrinks": false,
          "isPersonalCare": false,
          "isToiletAssistance": false,
          "isRepositioning": false,
          "isCompanionshipRespiteCare": true,
          "isLaundry": false,
          "isGroceries": false,
          "isHousework": false,
          "isHouseholdChores": true,
          "isUnableToDeliverCare": false,
          "clockInTime": "10:35",
          "clockOutTime": "18:54",
          "totalTime": "2h 88m",
          "careWorker": "Care Workers",
          "careWorkerName": "Rovin6"
        },
        {
          "isSaved": false,
          "isMedication": true,
          "isBodyMap": false,
          "isFood": false,
          "isDrinks": false,
          "isPersonalCare": true,
          "isToiletAssistance": false,
          "isRepositioning": false,
          "isCompanionshipRespiteCare": false,
          "isLaundry": true,
          "isGroceries": false,
          "isHousework": false,
          "isHouseholdChores": true,
          "isUnableToDeliverCare": false,
          "clockInTime": "10:34",
          "clockOutTime": "18:54",
          "totalTime": "2h 88m",
          "careWorker": "Care Workers",
          "careWorkerName": "Rovin7"
        }
      ]
    }
  ];

  List<SamplePosts> samplePosts = [];

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
