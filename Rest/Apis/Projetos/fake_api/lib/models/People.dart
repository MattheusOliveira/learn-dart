class Employer {
  String status;
  List<String> period_job;
  List<Data> data;
  String message;

  Employer({this.status, this.period_job, this.data, this.message});

  Employer.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    period_job = json['period_job'].cast<String>();
    data = (json['data'] as List<dynamic>).map((e) => Data.fromJson(e)).toList();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    return {
      'satus': status,
      'period_job': period_job,
      'data': data,
      'message': message
    };
  }
}

class Data {
  int id;
  String employee_name;
  int employee_salary;
  int employee_age;
  String profile_image;

  Data({
    this.id,
    this.employee_name,
    this.employee_salary,
    this.employee_age,
    this.profile_image,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employee_name = json['employee_name'];
    employee_age = json['employee_age'];
    employee_salary = json['employee_salary'];
    profile_image = json['profile_image'];
  }

  Map<String,dynamic> toJson() {
    return {
      'id': id,
      'employee_name': employee_name,
      'employee_age': employee_age,
      'employee_salary':employee_salary,
      'profile_image': profile_image
    };
  }
}


