import 'Mails.dart';

class SearchMailModel {
  SearchMailModel({
      this.mails,});

  SearchMailModel.fromJson(dynamic json) {
    if (json['mails'] != null) {
      mails = [];
      json['mails'].forEach((v) {
        mails.add(Mails.fromJson(v));
      });
    }
  }
  List<Mails> mails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (mails != null) {
      map['mails'] = mails.map((v) => v.toJson()).toList();
    }
    return map;
  }

}