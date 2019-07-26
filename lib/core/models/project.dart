class Project {
  String id;
  String name;
  int timeSpent;
  String logo;
  String color;

  Project({
    this.id,
    this.name,
    this.timeSpent,
    this.logo,
    this.color
  });

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    timeSpent = json['time_spent'];
    logo = json['logo'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['name'] = this.name;
    data['time_spent'] = this.timeSpent;
    data['logo'] = this.logo;
    data['color'] = this.color;

    return data;
  }
}