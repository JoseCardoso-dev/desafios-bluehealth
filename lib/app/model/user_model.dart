// ignore_for_file: unnecessary_getters_setters

class UserModel {
  String? _imgUrl;
  String? _firstName;
  String? _name;
  String? _cpf;
  String? _bloodGroup;
  String? _healthInsurance;
  String? _rg;
  String? _emergencyContact;
  String? _planCoverage;
  String? _planValidity;

  UserModel(
      {String? imgUrl,
      String? firstName,
      String? name,
      String? cpf,
      String? bloodGroup,
      String? healthInsurance,
      String? rg,
      String? emergencyContact,
      String? planCoverage,
      String? planValidity}) {
    if (imgUrl != null) {
      _imgUrl = imgUrl;
    }
    if (firstName != null) {
      _firstName = firstName;
    }
    if (name != null) {
      _name = name;
    }
    if (cpf != null) {
      _cpf = cpf;
    }
    if (bloodGroup != null) {
      _bloodGroup = bloodGroup;
    }
    if (healthInsurance != null) {
      _healthInsurance = healthInsurance;
    }
    if (rg != null) {
      _rg = rg;
    }
    if (emergencyContact != null) {
      _emergencyContact = emergencyContact;
    }
    if (planCoverage != null) {
      _planCoverage = planCoverage;
    }
    if (planValidity != null) {
      _planValidity = planValidity;
    }
  }

  String? get imgUrl => _imgUrl;
  set imgUrl(String? imgUrl) => _imgUrl = imgUrl;
  String? get firstName => _firstName;
  set firstName(String? firstName) => _firstName = firstName;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get cpf => _cpf;
  set cpf(String? cpf) => _cpf = cpf;
  String? get bloodGroup => _bloodGroup;
  set bloodGroup(String? bloodGroup) => _bloodGroup = bloodGroup;
  String? get healthInsurance => _healthInsurance;
  set healthInsurance(String? healthInsurance) =>
      _healthInsurance = healthInsurance;
  String? get rg => _rg;
  set rg(String? rg) => _rg = rg;
  String? get emergencyContact => _emergencyContact;
  set emergencyContact(String? emergencyContact) =>
      _emergencyContact = emergencyContact;
  String? get planCoverage => _planCoverage;
  set planCoverage(String? planCoverage) => _planCoverage = planCoverage;
  String? get planValidity => _planValidity;
  set planValidity(String? planValidity) => _planValidity = planValidity;

  UserModel.fromJson(Map<String, dynamic> json) {
    _imgUrl = json['img_url'];
    _firstName = json['first_name'];
    _name = json['name'];
    _cpf = json['cpf'];
    _bloodGroup = json['blood_group'];
    _healthInsurance = json['health_insurance'];
    _rg = json['rg'];
    _emergencyContact = json['emergency_contact'];
    _planCoverage = json['plan_coverage'];
    _planValidity = json['plan_validity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['img_url'] = _imgUrl;
    data['first_name'] = _firstName;
    data['name'] = _name;
    data['cpf'] = _cpf;
    data['blood_group'] = _bloodGroup;
    data['health_insurance'] = _healthInsurance;
    data['rg'] = _rg;
    data['emergency_contact'] = _emergencyContact;
    data['plan_coverage'] = _planCoverage;
    data['plan_validity'] = _planValidity;
    return data;
  }
}
