import 'package:acp_app/utils/constants/db_tables.dart';

class Collections {
  ACPJournalClub aCPJournalClub;
  ACPJournalClub beyondTheGuidelines;
  ACPJournalClub clinicalGuidelines;
  ACPJournalClub cOVID19;
  ACPJournalClub inTheClinic;
  ACPJournalClub onBeingADoctor;
  ACPJournalClub originalResearch;
  ACPJournalClub reviews;

  Collections._(
      {required this.aCPJournalClub,
      required this.beyondTheGuidelines,
      required this.clinicalGuidelines,
      required this.cOVID19,
      required this.inTheClinic,
      required this.onBeingADoctor,
      required this.originalResearch,
      required this.reviews});

  factory Collections._fromJson(
          Map<String, Map<String, String>> json) =>
      Collections._(
          aCPJournalClub: ACPJournalClub.fromJson(json['ACP Journal Club']!),
          beyondTheGuidelines:
              ACPJournalClub.fromJson(json["Beyond the Guidelines"]!),
          clinicalGuidelines:
              ACPJournalClub.fromJson(json["Clinical Guidelines"]!),
          cOVID19: ACPJournalClub.fromJson(json["COVID-19"]!),
          inTheClinic: ACPJournalClub.fromJson(json["In the Clinic"]!),
          onBeingADoctor: ACPJournalClub.fromJson(json["On Being a Doctor"]!),
          originalResearch: ACPJournalClub.fromJson(json['Original Research']!),
          reviews: ACPJournalClub.fromJson(json["Reviews"]!));

  static final Collections _collections =
      Collections._fromJson(Collections.data);
  factory Collections() => _collections;

  static Map<String, Map<String, String>> data = {
    "ACP Journal Club": {
      "content": "ACP Journal Club",
      "icon": "asset/image/icons/acpjournalclubicon.png",
      "link": "https://media.acponline.org/feeds/annals-acpj-rss.xml",
      "tablename": TableNames.acpJournalClub
    },
    "Beyond the Guidelines": {
      "content": "Beyond the Guidelines",
      "icon": "asset/image/icons/beyondtheguidelines.png",
      "link": "https://media.acponline.org/feeds/annals-beyo-rss.xml",
      "tablename": TableNames.beyondTheGuildelines
    },
    "Clinical Guidelines": {
      "content": "Clinical Guidelines",
      "icon": "asset/image/icons/clinicalguidelines.png",
      "link": "https://media.acponline.org/feeds/annals-clin-rss.xml",
      "tablename": TableNames.clinicalGuidelines
    },
    "COVID-19": {
      "content": "COVID-19",
      "icon": "asset/image/icons/covid19.png",
      "link": "https://media.acponline.org/feeds/annals-covi-rss.xml",
      "tablename": TableNames.covid19
    },
    "In the Clinic": {
      "content": "In the Clinic",
      "icon": "asset/image/icons/intheclinic.png",
      "link": "https://media.acponline.org/feeds/annals-inth-rss.xml",
      "tablename": TableNames.inTheClinic
    },
    "On Being a Doctor": {
      "content": "On Being a Doctor",
      "icon": "asset/image/icons/onbeingadoctor.png",
      "link": "https://media.acponline.org/feeds/annals-onbe-rss.xml",
      "tablename": TableNames.onBeingADoctor
    },
    "Original Research": {
      "content": "Original Research",
      "icon": "asset/image/icons/originalresearch.png",
      "link": "https://media.acponline.org/feeds/annals-orig-rss.xml",
      "tablename": TableNames.originalResearch
    },
    "Reviews": {
      "content": "Reviews",
      "icon": "asset/image/icons/reviews.png",
      "link": "https://media.acponline.org/feeds/annals-revi-rss.xml",
      "tablename": TableNames.reviews
    },
  };
}

class ACPJournalClub {
  String content;
  String icon;
  String link;
  String tablename;
  ACPJournalClub(
      {required this.content,
      required this.icon,
      required this.link,
      required this.tablename});

  factory ACPJournalClub.fromJson(Map<String, String> json) => ACPJournalClub(
      content: json['content']!,
      icon: json['icon']!,
      link: json['link']!,
      tablename: json['tablename']!);
}
