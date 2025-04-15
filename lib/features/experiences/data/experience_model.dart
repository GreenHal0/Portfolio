import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/features/experiences/domain/experience.dart';

class ExperienceModel extends Experience{
  final String jobTitle;
  final String company;
  final DateTime startDate;
  final DateTime? endDate;
  final List<String> missions;

  ExperienceModel({
    required this.jobTitle,
    required this.company,
    required this.startDate,
    required this.endDate,
    required this.missions
  }) : super(jobTitle, company, startDate, endDate, missions) ;

  // Factory constructor for Cloud Firestore deserialization
  factory ExperienceModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return ExperienceModel(
      jobTitle: data?['jobTitle'],
      company: data?['company'],
      startDate: (data?['startDate'] as Timestamp?)!.toDate(),
      endDate: (data?['endDate'] as Timestamp?)?.toDate(),
      missions: (data?['missions'] as String?)?.split(';').map((e) => e.trim()).toList() ?? [],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "jobTitle": jobTitle,
      "company": company,
      "startDate": startDate,
      if (endDate!=null) "endDate": endDate,
      if (missions.isNotEmpty) "missions": missions.join(';'),
    };
  }
}