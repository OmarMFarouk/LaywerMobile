class CaseDetails {
  String? caseId;
  String? vendorId;
  String? caseSubject;
  String? caseType;
  String? caseNumber;
  String? caseArchiveNumber;
  String? caseCountry;
  String? caseCourtChamber;
  String? caseClientId;
  String? dateCreated;
  String? dateModified;

  CaseDetails(
      {this.caseId,
      this.vendorId,
      this.caseSubject,
      this.caseType,
      this.caseNumber,
      this.caseArchiveNumber,
      this.caseCountry,
      this.caseCourtChamber,
      this.caseClientId,
      this.dateCreated,
      this.dateModified});

  CaseDetails.fromJson(Map<String, dynamic> json) {
    caseId = json['case_id'];
    vendorId = json['vendor_id'];
    caseSubject = json['case_subject'];
    caseType = json['case_type'];
    caseNumber = json['case_number'];
    caseArchiveNumber = json['case_archiveNumber'];
    caseCountry = json['case_country'];
    caseCourtChamber = json['case_courtChamber'];
    caseClientId = json['case_clientId'];
    dateCreated = json['case_dateCreated'];
    dateModified = json['case_dateModified'];
  }
}

class CaseFile {
  String? fileid;
  String? vendorid;
  String? filepath;
  String? caseid;
  String? clientid;
  String? filedateAdded;

  CaseFile(
      {this.fileid,
      this.vendorid,
      this.filepath,
      this.caseid,
      this.clientid,
      this.filedateAdded});

  CaseFile.fromJson(Map<String, dynamic> json) {
    fileid = json['file_id'];
    vendorid = json['vendor_id'];
    filepath = json['file_path'];
    caseid = json['case_id'];
    clientid = json['client_id'];
    filedateAdded = json['file_dateAdded'];
  }
}

class CaseModel {
  bool? success;
  String? message;
  CaseDetails? caseDetails;
  List<CaseFile?>? caseFiles;

  CaseModel({this.success, this.message, this.caseDetails, this.caseFiles});

  CaseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    caseDetails = json['case_details'] != null
        ? CaseDetails?.fromJson(json['case_details'])
        : null;
    if (json['case_files'] != null) {
      caseFiles = <CaseFile>[];
      json['case_files'].forEach((v) {
        caseFiles!.add(CaseFile.fromJson(v));
      });
    }
  }
}
