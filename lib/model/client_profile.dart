class ClientProfile {
  String? clientName;
  String? clientId;
  ContactDetails? contactDetails;
  List<Medications>? medications;
  List<Documents>? documents;
  List<VisitType>? visitType;
  List<FrondFamilyAccess>? frondFamilyAccess;
  List<KeyContact>? keyContact;
  PersonalDetails? personalDetails;

  ClientProfile(
      {this.clientName,
        this.clientId,
        this.contactDetails,
        this.medications,
        this.documents,
        this.visitType,
        this.frondFamilyAccess,
        this.keyContact,
        this.personalDetails});

  ClientProfile.fromJson(Map<String, dynamic> json) {
    clientName = json['client_name'];
    clientId = json['client_id'];
    contactDetails = json['contact_details'] != null
        ? new ContactDetails.fromJson(json['contact_details'])
        : null;
    if (json['Medications'] != null) {
      medications = <Medications>[];
      json['Medications'].forEach((v) {
        medications!.add(new Medications.fromJson(v));
      });
    }
    if (json['documents'] != null) {
      documents = <Documents>[];
      json['documents'].forEach((v) {
        documents!.add(new Documents.fromJson(v));
      });
    }
    if (json['visit_type'] != null) {
      visitType = <VisitType>[];
      json['visit_type'].forEach((v) {
        visitType!.add(new VisitType.fromJson(v));
      });
    }
    if (json['frond_family_access'] != null) {
      frondFamilyAccess = <FrondFamilyAccess>[];
      json['frond_family_access'].forEach((v) {
        frondFamilyAccess!.add(new FrondFamilyAccess.fromJson(v));
      });
    }
    if (json['key_contact'] != null) {
      keyContact = <KeyContact>[];
      json['key_contact'].forEach((v) {
        keyContact!.add(new KeyContact.fromJson(v));
      });
    }
    personalDetails = json['personal_details'] != null
        ? new PersonalDetails.fromJson(json['personal_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_name'] = this.clientName;
    data['client_id'] = this.clientId;
    if (this.contactDetails != null) {
      data['contact_details'] = this.contactDetails!.toJson();
    }
    if (this.medications != null) {
      data['Medications'] = this.medications!.map((v) => v.toJson()).toList();
    }
    if (this.documents != null) {
      data['documents'] = this.documents!.map((v) => v.toJson()).toList();
    }
    if (this.visitType != null) {
      data['visit_type'] = this.visitType!.map((v) => v.toJson()).toList();
    }
    if (this.frondFamilyAccess != null) {
      data['frond_family_access'] =
          this.frondFamilyAccess!.map((v) => v.toJson()).toList();
    }
    if (this.keyContact != null) {
      data['key_contact'] = this.keyContact!.map((v) => v.toJson()).toList();
    }
    if (this.personalDetails != null) {
      data['personal_details'] = this.personalDetails!.toJson();
    }
    return data;
  }
}

class ContactDetails {
  String? address;
  String? propertyAccess;
  String? phone;

  ContactDetails({this.address, this.propertyAccess, this.phone});

  ContactDetails.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    propertyAccess = json['property_access'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['property_access'] = this.propertyAccess;
    data['phone'] = this.phone;
    return data;
  }
}

class Medications {
  String? medName;
  String? medDose;
  String? medShedule;

  Medications({this.medName, this.medDose, this.medShedule});

  Medications.fromJson(Map<String, dynamic> json) {
    medName = json['med_name'];
    medDose = json['med_dose'];
    medShedule = json['med_shedule'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['med_name'] = this.medName;
    data['med_dose'] = this.medDose;
    data['med_shedule'] = this.medShedule;
    return data;
  }
}

class Documents {
  int? documentId;
  String? documentUrl;

  Documents({this.documentId, this.documentUrl});

  Documents.fromJson(Map<String, dynamic> json) {
    documentId = json['document_id'];
    documentUrl = json['document_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['document_id'] = this.documentId;
    data['document_url'] = this.documentUrl;
    return data;
  }
}

class VisitType {
  String? name;
  List<RequiredTask>? requiredTask;

  VisitType({this.name, this.requiredTask});

  VisitType.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['required_task'] != null) {
      requiredTask = <RequiredTask>[];
      json['required_task'].forEach((v) {
        requiredTask!.add(new RequiredTask.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.requiredTask != null) {
      data['required_task'] =
          this.requiredTask!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RequiredTask {
  int? taskId;
  String? taskName;
  String? taskNote;

  RequiredTask({this.taskId, this.taskName, this.taskNote});

  RequiredTask.fromJson(Map<String, dynamic> json) {
    taskId = json['task_id'];
    taskName = json['task_name'];
    taskNote = json['task_note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['task_id'] = this.taskId;
    data['task_name'] = this.taskName;
    data['task_note'] = this.taskNote;
    return data;
  }
}

class FrondFamilyAccess {
  String? ffName;
  String? ffEmail;

  FrondFamilyAccess({this.ffName, this.ffEmail});

  FrondFamilyAccess.fromJson(Map<String, dynamic> json) {
    ffName = json['ff_name'];
    ffEmail = json['ff_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ff_name'] = this.ffName;
    data['ff_email'] = this.ffEmail;
    return data;
  }
}

class KeyContact {
  String? name;
  String? relation;
  String? contactDetails;

  KeyContact({this.name, this.relation, this.contactDetails});

  KeyContact.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    relation = json['relation'];
    contactDetails = json['contact_details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['relation'] = this.relation;
    data['contact_details'] = this.contactDetails;
    return data;
  }
}

class PersonalDetails {
  String? dob;
  String? languagesSpocken;
  String? allergies;
  String? interestsHobbies;
  String? historyBackground;

  PersonalDetails(
      {this.dob,
        this.languagesSpocken,
        this.allergies,
        this.interestsHobbies,
        this.historyBackground});

  PersonalDetails.fromJson(Map<String, dynamic> json) {
    dob = json['dob'];
    languagesSpocken = json['languages_spocken'];
    allergies = json['allergies'];
    interestsHobbies = json['interests_hobbies'];
    historyBackground = json['history_background'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dob'] = this.dob;
    data['languages_spocken'] = this.languagesSpocken;
    data['allergies'] = this.allergies;
    data['interests_hobbies'] = this.interestsHobbies;
    data['history_background'] = this.historyBackground;
    return data;
  }
}
