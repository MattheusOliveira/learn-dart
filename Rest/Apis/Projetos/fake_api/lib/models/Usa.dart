class Usa {
  List<Data> datas;
  List<Source> sources;

  Usa.fromJson(Map<String, dynamic> json) {
    datas = (json['data'] as List<dynamic>).map((e) => Data.fromJson(e)).toList();
    sources = (json['source'] as List<dynamic>).map((e) => Source.fromJson(e)).toList();
  }

  Map<String,dynamic> toJson() {
    return {
      'data': datas,
      'source': sources
    };
  }
}

class Data {
  String iDNation;
  String nation;
  int iDYear;
  String year;
  int population;
  String slugNation;

  Data({this.iDNation, this.nation, this.iDYear, this.year, this.population, this.slugNation});

  Data.fromJson(Map<String, dynamic> json) {
    iDNation = json['ID Nation'];
    nation = json['Nation'];
    iDYear = json['ID Year'];
    population = json['Population'];
    slugNation = json['Slug Nation'];
  }

  Map<String,dynamic> toJson() {
    return {
      'ID Nation': iDNation,
      'Nation': nation,
      'IDYear': iDYear,
      'population': population,
      'Slug Nation': slugNation
    };
  }
}

class Source {
  List<String> measures;
  Annotations annotations;
  String name;
  List<String> substitutions;

  Source({this.measures, this.annotations, this.name, this.substitutions}); 

  Source.fromJson(Map<String, dynamic> json) {
    measures = json['measures'].cast<String>();
    annotations = Annotations.fromJson(json['annotations']);
    name = json['name'];
    substitutions = json['substitutions'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    return {
      'measures': measures,
      'annotations': annotations,
      'name': name,
      'substitutions': substitutions
    };
  }

}

class Annotations {
  String source_name;
  String source_description;
  String dataset_name;
  String dataset_link;
  String table_id;
  String topic;
  String subtopic;

  Annotations({this.source_name, this.source_description, this.dataset_name, this.dataset_link, this.table_id, this.topic, this.subtopic});

  Annotations.fromJson(Map<String,dynamic> json) {
    source_name = json['source_name'];
    source_description = json['source_description'];
    dataset_name = json['dataset_name'];
    dataset_link = json['dataset_link'];
    table_id = json['table_id'];
    topic = json['topic'];
    subtopic = json['subtopic'];
  }

  Map<String, dynamic> toJson() {
    return {
      'source_name': source_name,
      'source_description': source_description,
      'dataset_name': dataset_name,
      'dataset_link': dataset_link,
      'table_id': table_id,
      'topic': topic,
      'subtopic': subtopic
    };
  }

}
