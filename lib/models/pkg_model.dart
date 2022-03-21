

class PkgModel{
  String? p_name;
  String? p_duration;
  String? attendance;

  PkgModel({required this.p_name, required this.p_duration, required this.attendance});


  PkgModel.fromMap(Map<String, dynamic> data) {

      p_name = data['p_name'] as String;
      p_duration =  data['p_duration'] as String;
      attendance = data['attendance'] as String;

  }

  Map<String, dynamic> toMap() {
    return {
      'p_name': p_name,
      'p_duration': p_duration,
      'attendance': attendance,
    };
  }


}