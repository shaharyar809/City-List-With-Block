class City {
  int? id;
  String? name;
  int? countryId;
  int? stateId;

  City({this.id, this.name, this.countryId, this.stateId});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
    stateId = json['state_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country_id'] = this.countryId;
    data['state_id'] = this.stateId;
    return data;
  }
}
