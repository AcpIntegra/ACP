class DataModel {
  final int? id;
  final Map<String, dynamic> data;

  DataModel({this.id, required this.data});

  // Convert DataModel object to a Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map.from(data);
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  // Create a DataModel from a Map
  factory DataModel.fromMap(Map<String, dynamic> map) {
    map.removeWhere((key, value) => key == 'id');
    return DataModel(id: map['id'], data: map);
  }
}
