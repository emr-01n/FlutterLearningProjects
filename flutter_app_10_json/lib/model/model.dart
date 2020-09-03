
class Model {

  final String model;
  final int fiyat;
  final bool benzinliMi;

	Model.fromJsonMap(Map<String, dynamic> map): 
		model = map["model"],
		fiyat = map["fiyat"],
		benzinliMi = map["benzinliMi"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['model'] = model;
		data['fiyat'] = fiyat;
		data['benzinliMi'] = benzinliMi;
		return data;
	}
}
