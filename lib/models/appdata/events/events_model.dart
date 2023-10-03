class EventsModel {
  final String id;
  final String title;
  final String subject;
  final String fClass;
  final String formLink;
  final String description;
  final String tokenFormField;
  final String lectureLink;
  final DateTime startDate;
  final DateTime endDate;

  EventsModel(
      {required this.id,
      required this.title,
      required this.subject,
      required this.fClass,
      required this.formLink,
      required this.description,
      required this.tokenFormField,
      required this.lectureLink,
      required this.endDate,
      required this.startDate});

  factory EventsModel.fromJson(Map<String, dynamic> json) {
    return EventsModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      subject: json['subject'] ?? '',
      fClass: json['class'] ?? '',
      formLink: json['formLink'] ?? '',
      description: json['description'] ?? '',
      tokenFormField: json['tokenFormField'] ?? '',
      lectureLink: json['lectureLink'] ?? '',
      startDate: json['startDate'] != null
          ? DateTime.parse(json['startDate'])
          : DateTime.now(),
      endDate: json['endDate'] != null
          ? DateTime.parse(json['endDate'])
          : DateTime.now(),
    );
  }
}
