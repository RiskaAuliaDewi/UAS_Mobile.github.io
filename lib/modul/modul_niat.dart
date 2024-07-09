class ModelNiat {
  int? id; // Nullable integer to hold an ID
  String? name; // Nullable string for the name
  String? arabic; // Nullable string for the Arabic text
  String? latin; // Nullable string for the Latin text
  String? terjemahan; // Nullable string for the translation

  // Constructor with named parameters
  ModelNiat(this.id, this.name, this.arabic, this.latin, this.terjemahan);

  // Named constructor to create an instance from a JSON map
  ModelNiat.fromJson(Map<String, dynamic> json) {
    id = json['id']; // Assigning 'id' from JSON to the class property
    name = json['name']; // Assigning 'name' from JSON to the class property
    arabic =
        json['arabic']; // Assigning 'arabic' from JSON to the class property
    latin = json['latin']; // Assigning 'latin' from JSON to the class property
    terjemahan = json[
        'terjemahan']; // Assigning 'terjemahan' from JSON to the class property
  }
}
