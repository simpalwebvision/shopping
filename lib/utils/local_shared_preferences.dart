import 'package:shared_preferences/shared_preferences.dart';

const technicianLoginKey = "TECHNICIAN_LOGIN_STATUS";
const salesLoginKey = "SALES_LOGIN_STATUS";
const customerLoginKey = "CUSTOMER_LOGIN_STATUS";
const adminLoginKey = "ADMIN_LOGIN_STATUS";
const superAdminLoginKey = "SUPER_ADMIN_LOGIN_STATUS";

const custUidKey = "CUSTUIDKEY";
const custMobileKey = "CUSTMOBILEKEY";
const custUserTokeKey = "CUSTUSERTOKENKEY";

class LocalPreferences {
  setTechnicianLoginBool(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(technicianLoginKey, value);
  }

  setSalesLoginBool(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(salesLoginKey, value);
  }

  setCustomerLoginBool(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(customerLoginKey, value);
  }

  setAdminLoginBool(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(adminLoginKey, value);
  }

  setSuperAdminLoginBool(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(superAdminLoginKey, value);
  }

  // ------------------------------------------------------------------
  Future setUid(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(custUidKey, val);
  }

  Future<String?> getUid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(custUidKey);
  }

  // ------------------------------------------------------------------

  Future setMobile(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(custMobileKey, val);
  }

  Future<String?> getMobile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(custMobileKey);
  }

  // ------------------------------------------------------------------

  Future setUserToken(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(custUserTokeKey, val);
  }

  Future<String?> getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(custUserTokeKey);
  }
}
