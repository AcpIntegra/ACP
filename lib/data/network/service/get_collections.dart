import 'package:acp_app/utils/constants/db_tables.dart';

class Collection {
  String collectionName;
  String collectionURL;
  int collectionId;

  Collection(this.collectionName, this.collectionURL, this.collectionId);
}

Collection mapListToCollection(Collection collection) {
  return Collection(collection.collectionName, collection.collectionURL,
      collection.collectionId);
}

List<Collection> getCollectionsList() {
  List<Collection> collections = [
    Collection(TableNames.articleList,
        'https://media.acponline.org/feeds/annals-latest-rss.xml', 1),
    Collection(TableNames.currentIssues,
        'https://media.acponline.org/feeds/annals-current-rss.xml', 2),
    Collection(TableNames.acpJournalClub,
        'https://media.acponline.org/feeds/annals-acpj-rss.xml', 3),
    Collection(TableNames.beyondTheGuildelines,
        'https://media.acponline.org/feeds/annals-beyo-rss.xml', 4),
    Collection(TableNames.clinicalGuidelines,
        'https://media.acponline.org/feeds/annals-clin-rss.xml', 4),
    Collection(TableNames.covid19,
        'https://media.acponline.org/feeds/annals-covi-rss.xml', 5),
    Collection(TableNames.inTheClinic,
        'https://media.acponline.org/feeds/annals-inth-rss.xml', 6),
    Collection(TableNames.onBeingADoctor,
        'https://media.acponline.org/feeds/annals-onbe-rss.xml', 7),
    Collection(TableNames.originalResearch,
        'https://media.acponline.org/feeds/annals-orig-rss.xml', 8),
    Collection(TableNames.reviews,
        'https://media.acponline.org/feeds/annals-revi-rss.xml', 9)
  ];

  // Use the map function to apply the mapping to each element in the array
  return collections.map(mapListToCollection).toList();
}
