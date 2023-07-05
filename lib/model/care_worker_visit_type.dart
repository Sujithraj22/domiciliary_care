class CareWorkerVisitType {
  int? visitId;
  String? visitName;
  List<RequiredTask>? requiredTask;

  CareWorkerVisitType({this.visitId, this.visitName, this.requiredTask});

  CareWorkerVisitType.fromJson(Map<String, dynamic> json) {
    visitId = json['visit_id'];
    visitName = json['visit_name'];
    if (json['required_task'] != null) {
      requiredTask = <RequiredTask>[];
      json['required_task'].forEach((v) {
        requiredTask!.add(new RequiredTask.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['visit_id'] = this.visitId;
    data['visit_name'] = this.visitName;
    if (this.requiredTask != null) {
      data['required_task'] =
          this.requiredTask!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RequiredTask {
  int? taskId;
  String? noteForCareWorker;

  RequiredTask({this.taskId, this.noteForCareWorker});

  RequiredTask.fromJson(Map<String, dynamic> json) {
    taskId = json['task_id'];
    noteForCareWorker = json['note_for_care_worker'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['task_id'] = this.taskId;
    data['note_for_care_worker'] = this.noteForCareWorker;
    return data;
  }
}