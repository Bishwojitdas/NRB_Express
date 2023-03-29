import 'package:get/get.dart';
import 'package:nrb_express/data/model/attendance_model.dart';

class AttendanceController extends GetxController{
List<AttendanceModel>? attendanceList=[
  AttendanceModel(id: "1", date: "09-02-23", checkInTime: "10:12 AM", checkInAddress: "Dhanmondi 10, Dhaka", checkOutTime: "7:30 PM", checkOutAddress: "Dhanmondi 15"),
  AttendanceModel(id: "2", date: "10-02-23", checkInTime: "10:12 AM", checkInAddress: "Dhanmondi 10, Dhaka", checkOutTime: "7:30 PM", checkOutAddress: "Dhanmondi 15"),
  AttendanceModel(id: "3", date: "11-02-23", checkInTime: "10:12 AM", checkInAddress: "Dhanmondi 12, Dhaka", checkOutTime: "7:30 PM", checkOutAddress: "Dhanmondi 15"),
  AttendanceModel(id: "4", date: "12-02-23", checkInTime: "10:12 AM", checkInAddress: "Dhanmondi 10, Dhaka", checkOutTime: "7:30 PM", checkOutAddress: "Dhanmondi 10"),
  AttendanceModel(id: "5", date: "13-02-23", checkInTime: "10:12 AM", checkInAddress: "Dhanmondi 10, Dhaka", checkOutTime: "7:30 PM", checkOutAddress: "Dhanmondi 15"),
  AttendanceModel(id: "6", date: "14-02-23", checkInTime: "10:12 AM", checkInAddress: "Dhanmondi 15, Dhaka", checkOutTime: "7:30 PM", checkOutAddress: "Dhanmondi 27"),
  AttendanceModel(id: "7", date: "15-02-23", checkInTime: "10:12 AM", checkInAddress: "Dhanmondi 10, Dhaka", checkOutTime: "7:30 PM", checkOutAddress: "Dhanmondi 15"),
  AttendanceModel(id: "8", date: "16-02-23", checkInTime: "10:12 AM", checkInAddress: "Dhanmondi 10, Dhaka", checkOutTime: "7:30 PM", checkOutAddress: "Dhanmondi 15"),
  AttendanceModel(id: "9", date: "17-02-23", checkInTime: "10:12 AM", checkInAddress: "Dhanmondi 10, Dhaka", checkOutTime: "7:30 PM", checkOutAddress: "Dhanmondi 32"),
  AttendanceModel(id: "10", date: "18-02-23", checkInTime: "10:12 AM", checkInAddress: "Dhanmondi 32, Dhaka", checkOutTime: "7:30 PM", checkOutAddress: "Dhanmondi 15"),
].obs;
}