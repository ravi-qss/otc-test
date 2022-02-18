class AuthorizeResponse {
  Authorize? authorize;
  EchoReq? echoReq;
  String? msgType;

  AuthorizeResponse({this.authorize,echoReq,msgType});

  AuthorizeResponse.fromJson(Map<String, dynamic> json) {
    authorize = json['authorize'] != null
        ? Authorize.fromJson(json['authorize'])
        : null;
    echoReq = json['echo_req'] != null
        ? EchoReq.fromJson(json['echo_req'])
        : null;
    msgType = json['msg_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (authorize != null) {
      data['authorize'] = authorize!.toJson();
    }
    if (echoReq != null) {
      data['echo_req'] = echoReq!.toJson();
    }
    data['msg_type'] = msgType;
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

  Authorize(
      {this.accountList,
     balance,
     country,
     currency,
     email,
     fullname,
     isVirtual,
     landingCompanyFullname,
     landingCompanyName,
     localCurrencies,
     loginid,
     preferredLanguage,
     scopes,
     trading,
     upgradeableLandingCompanies,
     userId});

  Authorize.fromJson(Map<String, dynamic> json) {
    if (json['account_list'] != null) {
      accountList = <AccountList>[];
      json['account_list'].forEach((v) {
        accountList!.add(AccountList.fromJson(v));
      });
    }
    balance = json['balance'];
    country = json['country'];
    currency = json['currency'];
    email = json['email'];
    fullname = json['fullname'];
    isVirtual = json['is_virtual'];
    landingCompanyFullname = json['landing_company_fullname'];
    landingCompanyName = json['landing_company_name'];
    localCurrencies = json['local_currencies'] != null
        ? LocalCurrencies.fromJson(json['local_currencies'])
        : null;
    loginid = json['loginid'];
    preferredLanguage = json['preferred_language'];
    scopes = json['scopes'].cast<String>();
    trading =
        json['trading'] != null ? Trading.fromJson(json['trading']) : null;
    upgradeableLandingCompanies =
        json['upgradeable_landing_companies'].cast<String>();
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (accountList != null) {
      data['account_list'] =accountList!.map((v) => v.toJson()).toList();
    }
    data['balance'] =balance;
    data['country'] =country;
    data['currency'] =currency;
    data['email'] =email;
    data['fullname'] =fullname;
    data['is_virtual'] =isVirtual;
    data['landing_company_fullname'] =landingCompanyFullname;
    data['landing_company_name'] =landingCompanyName;
    if (localCurrencies != null) {
      data['local_currencies'] =localCurrencies!.toJson();
    }
    data['loginid'] =loginid;
    data['preferred_language'] =preferredLanguage;
    data['scopes'] =scopes;
    if (trading != null) {
      data['trading'] =trading!.toJson();
    }
    data['upgradeable_landing_companies'] =upgradeableLandingCompanies;
    data['user_id'] =userId;
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

  AccountList(
      {this.accountType,
     currency,
     isDisabled,
     isVirtual,
     landingCompanyName,
     loginid,
     trading});

  AccountList.fromJson(Map<String, dynamic> json) {
    accountType = json['account_type'];
    currency = json['currency'];
    isDisabled = json['is_disabled'];
    isVirtual = json['is_virtual'];
    landingCompanyName = json['landing_company_name'];
    loginid = json['loginid'];
    trading =
        json['trading'] != null ? Trading.fromJson(json['trading']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['account_type'] =accountType;
    data['currency'] =currency;
    data['is_disabled'] =isDisabled;
    data['is_virtual'] =isVirtual;
    data['landing_company_name'] =landingCompanyName;
    data['loginid'] =loginid;
    if (trading != null) {
      data['trading'] =trading!.toJson();
    }
    return data;
  }
}

class Trading {
  Trading();

  Trading.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}

class LocalCurrencies {
  INR? iNR;

  LocalCurrencies({this.iNR});

  LocalCurrencies.fromJson(Map<String, dynamic> json) {
    iNR = json['INR'] != null ? INR.fromJson(json['INR']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (iNR != null) {
      data['INR'] =iNR!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fractional_digits'] =fractionalDigits;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['authorize'] =authorize;
    return data;
  }
}
