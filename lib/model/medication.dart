class Medication {
  List<Medicine>? morning;
  List<Medicine>? lunchTime;
  List<Medicine>? evening;
  List<Medicine>? bedTime;
  List<Medicine>? asNeeded;

  Medication(
      {this.morning,
        this.lunchTime,
        this.evening,
        this.bedTime,
        this.asNeeded});

  Medication.fromJson(Map<String, dynamic> json) {
    if (json['morning'] != null) {
      morning = <Medicine>[];
      json['morning'].forEach((v) {
        morning!.add(new Medicine.fromJson(v));
      });
    }
    if (json['lunch_time'] != null) {
      lunchTime = <Medicine>[];
      json['lunch_time'].forEach((v) {
        lunchTime!.add(new Medicine.fromJson(v));
      });
    }
    if (json['evening'] != null) {
      evening = <Medicine>[];
      json['evening'].forEach((v) {
        evening!.add(new Medicine.fromJson(v));
      });
    }
    if (json['bed_time'] != null) {
      bedTime = <Medicine>[];
      json['bed_time'].forEach((v) {
        bedTime!.add(new Medicine.fromJson(v));
      });
    }
    if (json['as_needed'] != null) {
      asNeeded = <Medicine>[];
      json['as_needed'].forEach((v) {
        asNeeded!.add(new Medicine.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.morning != null) {
      data['morning'] = this.morning!.map((v) => v.toJson()).toList();
    }
    if (this.lunchTime != null) {
      data['lunch_time'] = this.lunchTime!.map((v) => v.toJson()).toList();
    }
    if (this.evening != null) {
      data['evening'] = this.evening!.map((v) => v.toJson()).toList();
    }
    if (this.bedTime != null) {
      data['bed_time'] = this.bedTime!.map((v) => v.toJson()).toList();
    }
    if (this.asNeeded != null) {
      data['as_needed'] = this.asNeeded!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Medicine {
  String? medicationName;
  String? dosage;
  String? note1;
  String? note2;
  String? previousNote;

  Medicine(
      {this.medicationName,
        this.dosage,
        this.note1,
        this.note2,
        this.previousNote});

  Medicine.fromJson(Map<String, dynamic> json) {
    medicationName = json['medication_name'];
    dosage = json['dosage'];
    note1 = json['note1'];
    note2 = json['note2'];
    previousNote = json['previous_note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medication_name'] = this.medicationName;
    data['dosage'] = this.dosage;
    data['note1'] = this.note1;
    data['note2'] = this.note2;
    data['previous_note'] = this.previousNote;
    return data;
  }
}

