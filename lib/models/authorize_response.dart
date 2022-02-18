class AuthorizeResponse {
  Authorize? authorize;
  EchoReq? echoReq;
  String? msgType;

  AuthorizeResponse({this.authorize, this.echoReq, this.msgType});

  AuthorizeResponse.fromJson(Map<String, dynamic> json) {
    authorize = json['authorize'] != null ? new Authorize.fromJson(json['authorize']) : null;
    echoReq = json['echo_req'] != null ? new EchoReq.fromJson(json['echo_req']) : null;
    msgType = json['msg_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.authorize != null) {
      data['authorize'] = this.authorize!.toJson();
    }
    if (this.echoReq != null) {
      data['echo_req'] = this.echoReq!.toJson();
    }
    data['msg_type'] = this.msgType;
    return data;
  }
}

class Authorize {
  List<AccountList>? accountList;
  int? balance;
  String? country;
  String? currency;
  String? email;
  String? fullname;
  int? isVirtual;
  String? landingCompanyFullname;
  String? landingCompanyName;
  LocalCurrencies? localCurrencies;
  String? loginid;
  String? preferredLanguage;
  List<String>? scopes;
  Trading? trading;
  List<String>? upgradeableLandingCompanies;
  int? userId;

  Authorize({this.accountList, this.balance, this.country, this.currency, this.email, this.fullname, this.isVirtual, this.landingCompanyFullname, this.landingCompanyName, this.localCurrencies, this.loginid, this.preferredLanguage, this.scopes, this.trading, this.upgradeableLandingCompanies, this.userId});

  Authorize.fromJson(Map<String, dynamic> json) {
    if (json['account_list'] != null) {
      accountList = <AccountList>[];
      json['account_list'].forEach((v) { accountList!.add(new AccountList.fromJson(v)); });
    }
    balance = json['balance'];
    country = json['country'];
    currency = json['currency'];
    email = json['email'];
    fullname = json['fullname'];
    isVirtual = json['is_virtual'];
    landingCompanyFullname = json['landing_company_fullname'];
    landingCompanyName = json['landing_company_name'];
    localCurrencies = json['local_currencies'] != null ? new LocalCurrencies.fromJson(json['local_currencies']) : null;
    loginid = json['loginid'];
    preferredLanguage = json['preferred_language'];
    scopes = json['scopes'].cast<String>();
    trading = json['trading'] != null ? new Trading.fromJson(json['trading']) : null;
    upgradeableLandingCompanies = json['upgradeable_landing_companies'].cast<String>();
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.accountList != null) {
      data['account_list'] = this.accountList!.map((v) => v.toJson()).toList();
    }
    data['balance'] = this.balance;
    data['country'] = this.country;
    data['currency'] = this.currency;
    data['email'] = this.email;
    data['fullname'] = this.fullname;
    data['is_virtual'] = this.isVirtual;
    data['landing_company_fullname'] = this.landingCompanyFullname;
    data['landing_company_name'] = this.landingCompanyName;
    if (this.localCurrencies != null) {
      data['local_currencies'] = this.localCurrencies!.toJson();
    }
    data['loginid'] = this.loginid;
    data['preferred_language'] = this.preferredLanguage;
    data['scopes'] = this.scopes;
    if (this.trading != null) {
      data['trading'] = this.trading!.toJson();
    }
    data['upgradeable_landing_companies'] = this.upgradeableLandingCompanies;
    data['user_id'] = this.userId;
    return data;
  }
}

class AccountList {
  String? accountType;
  String? currency;
  int? isDisabled;
  int? isVirtual;
  String? landingCompanyName;
  String? loginid;
  Trading? trading;

  AccountList({this.accountType, this.currency, this.isDisabled, this.isVirtual, this.landingCompanyName, this.loginid, this.trading});

  AccountList.fromJson(Map<String, dynamic> json) {
    accountType = json['account_type'];
    currency = json['currency'];
    isDisabled = json['is_disabled'];
    isVirtual = json['is_virtual'];
    landingCompanyName = json['landing_company_name'];
    loginid = json['loginid'];
    trading = json['trading'] != null ? new Trading.fromJson(json['trading']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_type'] = this.accountType;
    data['currency'] = this.currency;
    data['is_disabled'] = this.isDisabled;
    data['is_virtual'] = this.isVirtual;
    data['landing_company_name'] = this.landingCompanyName;
    data['loginid'] = this.loginid;
    if (this.trading != null) {
      data['trading'] = this.trading!.toJson();
    }
    return data;
  }
}

class Trading {


  Trading();

Trading.fromJson(Map<String, dynamic> json) {
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  return data;
}
}

class LocalCurrencies {
  INR? iNR;

  LocalCurrencies({this.iNR});

  LocalCurrencies.fromJson(Map<String, dynamic> json) {
    iNR = json['INR'] != null ? new INR.fromJson(json['INR']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iNR != null) {
      data['INR'] = this.iNR!.toJson();
    }
    return data;
  }
}

class INR {
  int? fractionalDigits;

  INR({this.fractionalDigits});

  INR.fromJson(Map<String, dynamic> json) {
    fractionalDigits = json['fractional_digits'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fractional_digits'] = this.fractionalDigits;
    return data;
  }
}

class EchoReq {
  String? authorize;

  EchoReq({this.authorize});

  EchoReq.fromJson(Map<String, dynamic> json) {
    authorize = json['authorize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authorize'] = this.authorize;
    return data;
  }
}
