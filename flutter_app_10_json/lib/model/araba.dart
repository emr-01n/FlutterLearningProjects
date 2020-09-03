import 'package:flutter_app_10_json/model/model.dart';

class Araba {

  final String marka;
  final String ulke;
  final int tarih;
  final List<Model> model;

	Araba.fromJsonMap(Map<String, dynamic> map): 
		marka = map["marka"],
		ulke = map["ulke"],
		tarih = map["tarih"],
		model = List<Model>.from(map["model"].map((it) => Model.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['marka'] = marka;
		data['ulke'] = ulke;
		data['tarih'] = tarih;
		data['model'] = model != null ? 
			this.model.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
