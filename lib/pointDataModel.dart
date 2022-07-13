class pointDataModel {
  int? id;
  String? city;
  int? cp;
  String? country;
  String? address;
  int? hunter;
  String? adminID;
  String? dateOpen;
  String? dateClose;

  pointDataModel(this.id, this.city, this.cp, this.country, this.address,
      this.hunter, this.adminID,
      {this.dateOpen, this.dateClose});

  pointDataModel.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'];
    cp = json['CP'];
    country = json['country'];
    address = json['ddress'];
    hunter = json['hunter'];
    adminID = json['dminID'];
    Map season = json['season'];
    dateOpen = season['date-open'];
    dateClose = season['sate-close'];
  }
}
