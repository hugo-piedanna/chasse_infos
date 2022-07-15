class pointDataModel {
  int? id;
  String? name;
  String? city;
  int? cp;
  String? country;
  String? address;
  int? hunter;
  String? adminID;
  String? dateOpen;
  String? dateClose;
  String? time;

  pointDataModel(this.id, this.name, this.city, this.cp, this.country,
      this.address, this.hunter, this.adminID,
      {this.dateOpen, this.dateClose, this.time});

  pointDataModel.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    cp = json['CP'];
    country = json['country'];
    address = json['address'];
    hunter = json['hunter'];
    adminID = json['adminID'];
    Map season = json['season'];
    dateOpen = season['date-open'];
    dateClose = season['date-close'];
    time = season['time'];
  }
}
