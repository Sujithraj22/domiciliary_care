class MyCalss {
  String? dateOfWork;
  List<WorkData>? workData;

  MyCalss({this.dateOfWork, this.workData});

  MyCalss.fromJson(Map<String, dynamic> json) {
    dateOfWork = json['dateOfWork'];
    if (json['workData'] != null) {
      workData = <WorkData>[];
      json['workData'].forEach((v) {
        workData!.add(new WorkData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateOfWork'] = this.dateOfWork;
    if (this.workData != null) {
      data['workData'] = this.workData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WorkData {
  bool? isSaved;
  bool? isMedication;
  bool? isBodyMap;
  bool? isFood;
  bool? isDrinks;
  bool? isPersonalCare;
  bool? isToiletAssistance;
  bool? isRepositioning;
  bool? isCompanionshipRespitCare;
  bool? isLaundry;
  bool? isGroceries;
  bool? isHousework;
  bool? isHouseholdChores;
  bool? isUnableToDeliverCare;
  String? clockInTime;
  String? clockOutTime;
  String? totalTime;
  String? careWorker;
  String? careWorkerName;

  WorkData(
      {this.isSaved,
        this.isMedication,
        this.isBodyMap,
        this.isFood,
        this.isDrinks,
        this.isPersonalCare,
        this.isToiletAssistance,
        this.isRepositioning,
        this.isCompanionshipRespitCare,
        this.isLaundry,
        this.isGroceries,
        this.isHousework,
        this.isHouseholdChores,
        this.isUnableToDeliverCare,
        this.clockInTime,
        this.clockOutTime,
        this.totalTime,
        this.careWorker,
        this.careWorkerName});

  WorkData.fromJson(Map<String, dynamic> json) {
    isSaved = json['isSaved'];
    isMedication = json['isMedication'];
    isBodyMap = json['isBodyMap'];
    isFood = json['isFood'];
    isDrinks = json['isDrinks'];
    isPersonalCare = json['isPersonalCare'];
    isToiletAssistance = json['isToiletAssistance'];
    isRepositioning = json['isRepositioning'];
    isCompanionshipRespitCare = json['isCompanionshipRespitCare'];
    isLaundry = json['isLaundry'];
    isGroceries = json['isGroceries'];
    isHousework = json['isHousework'];
    isHouseholdChores = json['isHouseholdChores'];
    isUnableToDeliverCare = json['isUnableToDeliverCare'];
    clockInTime = json['clockInTime'];
    clockOutTime = json['clockOutTime'];
    totalTime = json['totalTime'];
    careWorker = json['careWorker'];
    careWorkerName = json['careWorkerName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSaved'] = this.isSaved;
    data['isMedication'] = this.isMedication;
    data['isBodyMap'] = this.isBodyMap;
    data['isFood'] = this.isFood;
    data['isDrinks'] = this.isDrinks;
    data['isPersonalCare'] = this.isPersonalCare;
    data['isToiletAssistance'] = this.isToiletAssistance;
    data['isRepositioning'] = this.isRepositioning;
    data['isCompanionshipRespitCare'] = this.isCompanionshipRespitCare;
    data['isLaundry'] = this.isLaundry;
    data['isGroceries'] = this.isGroceries;
    data['isHousework'] = this.isHousework;
    data['isHouseholdChores'] = this.isHouseholdChores;
    data['isUnableToDeliverCare'] = this.isUnableToDeliverCare;
    data['clockInTime'] = this.clockInTime;
    data['clockOutTime'] = this.clockOutTime;
    data['totalTime'] = this.totalTime;
    data['careWorker'] = this.careWorker;
    data['careWorkerName'] = this.careWorkerName;
    return data;
  }
}