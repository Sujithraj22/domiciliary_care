
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:u20x_native/model/care_worker_visit_type.dart';
import '../model/care_worker_report.dart';
import '../model/client_profile.dart';
import '../model/jsonworkdata.dart';
import '../model/medication.dart';

Future<ClientProfile> fetchClientProfile() async {
  final myResponse = await http.get(Uri.parse('https://raw.githubusercontent.com/rovin01/DCAPI/main/client_profile'), headers: {
    "source": "mobile",
    "Content-Type": "application/json",
  });
  if (myResponse.statusCode == 200) {
    final Map<String, dynamic> parsed = json.decode(myResponse.body);
    return ClientProfile.fromJson(parsed);
  }else{
    throw Exception('Failed to fetch Client Profile data');
  }
}

Future<List<CareWorkerVisitType>> fetchVisitType() async {
  final myResponse = await http.get(Uri.parse('https://raw.githubusercontent.com/rovin01/DCAPI/main/care_worker_visit_type'), headers: {
    "source": "mobile",
    "Content-Type": "application/json",
  });
  if (myResponse.statusCode == 200) {
    final List<dynamic> parsed = json.decode(myResponse.body);
    //return CareWorkerVisitType.fromJson(parsed[0]);
    List<CareWorkerVisitType> visitTypes = parsed.map((item) => CareWorkerVisitType.fromJson(item)).toList();
    return visitTypes;
  }else{
    throw Exception('Failed to fetch Visit Type data');
  }
}
Future<List<CareWorkerReport>> fetchWorkerReport() async {
  final myResponse = await http.get(Uri.parse('https://raw.githubusercontent.com/rovin01/DCAPI/main/care_worker_report'), headers: {
    "source": "mobile",
    "Content-Type": "application/json",
  });
  if (myResponse.statusCode == 200) {
    final List<dynamic> parsed = json.decode(myResponse.body);
    //return CareWorkerVisitType.fromJson(parsed[0]);
    List<CareWorkerReport> workerReport = parsed.map((item) => CareWorkerReport.fromJson(item)).toList();
    return workerReport;
  }else{
    throw Exception('Failed to fetch Care Worker Data');
  }
}
Future<Medication> fetchMedication() async {
  final myResponse = await http.get(Uri.parse('https://raw.githubusercontent.com/rovin01/DCAPI/main/medication'), headers: {
    "source": "mobile",
    "Content-Type": "application/json",
  });
  if (myResponse.statusCode == 200) {
    final Map<String, dynamic> parsed = json.decode(myResponse.body);
    return Medication.fromJson(parsed);
  }else{
    throw Exception('Failed to fetch Medication data');
  }
}