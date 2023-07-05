class CareWorkerReport {
  String date;
  List<Data> data;

  CareWorkerReport({required this.date, required this.data});

  factory CareWorkerReport.fromJson(Map<String, dynamic> json) {
    return CareWorkerReport(
      date: json['date'],
      data: List<Data>.from(json['data'].map((data) => Data.fromJson(data))),
    );
  }
}

class Data {
  int id;
  String startTime;
  String endTime;
  String totalTime;
  String careWorkerName;
  List<int> taskCompleted;

  Data({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.totalTime,
    required this.careWorkerName,
    required this.taskCompleted,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      totalTime: json['total_time'],
      careWorkerName: json['care_worker_name'],
      taskCompleted: List<int>.from(json['task_completed']),
    );
  }
}