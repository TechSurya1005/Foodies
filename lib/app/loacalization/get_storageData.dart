import 'package:foodies_app/controllers/getUsersController.dart';
import 'package:foodies_app/data/models/login_respose.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();
class GetStorageHelper {

  static setinitialdata() {
    box.writeIfNull('is_logged_in', false);
    box.writeIfNull('id', "");
    box.writeIfNull('access_token', "");
    box.writeIfNull('user_email', "");
    box.writeIfNull('user_name', "");
    box.writeIfNull('user_number', "");
    box.writeIfNull('user_dob', "");
    box.writeIfNull('gender', "");

    // box.writeIfNull('customer_type_name', "");
    // box.writeIfNull('emp_phone', "");
    // box.writeIfNull('emergency_contact', "");
    // box.writeIfNull('blood_group', "");
    // box.writeIfNull('designation_name', "");
    // box.writeIfNull('attendance', "");
    // box.writeIfNull('firm_name', "");
    // box.writeIfNull('customer_name', "");
    // box.writeIfNull('stockiest_name', "");
    // box.writeIfNull('stockiest_id', "");
    // box.writeIfNull('customer_phone', "");
    // box.writeIfNull('customer_whatsapp_phone', "");
    // box.writeIfNull('customer_email', "");
    // box.writeIfNull('pincode', "");
    // box.writeIfNull('address', "");
    // box.writeIfNull('profile_pic', "");
    // box.writeIfNull('user_type', "");
    // box.writeIfNull("role_type", "");
    // box.writeIfNull("is_firstTime", true);
    // box.writeIfNull("attendance", false);
  }

  static setdata(LoginRespose loginResponse) {
    box.write('is_logged_in', true);
    box.write('id',loginResponse.user.id);
    box.write('access_token', loginResponse.user.token);
    box.write('user_email', loginResponse.user.email);
    box.write('user_name', loginResponse.user.fullName);
    box.write('user_number', loginResponse.user.mobileNumber);
    box.write('user_dob', loginResponse.user.dob);
    box.write('gender', loginResponse.user.gender);
    // box.write('designation_name', loginResponse.data![0].designationName);
    // box.write('attendance', loginResponse.data![0].attendance);
    // box.write('firm_name', loginResponse.data![0].firmName);
    // box.write('customer_name', loginResponse.data![0].customerName);
    // box.write('stockiest_name', loginResponse.data![0].stockiestName);
    // box.write('stockiest_id', loginResponse.data![0].stateId);
    // box.write('customer_phone', loginResponse.data![0].customerPhone);
    // box.write('customer_whatsapp_phone', loginResponse.data![0].customerWhatsappPhone);
    // box.write('customer_email', loginResponse.data![0].customerEmail);
    // box.write('pincode', loginResponse.data![0].pincode);
    // box.write('user_address', loginResponse.user.address);
    // box.write('profile_pic', loginResponse.data![0].profilePic);
    // box.write('user_type', loginResponse.data![0].usertype);
    // box.write('role_type', loginResponse.data![0].roleType);
  }
}
