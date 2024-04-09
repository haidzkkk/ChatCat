import 'package:flutter/material.dart';

class Task {
  String title;
  String startTime;
  String endTime;
  String priority;
  Color color;

  Task({required this.title, required this.startTime, required this.endTime, required this.priority, required this.color});
}

  List<Task> dailyTasks = [
    Task(
      title: 'Họp Ban Lãnh Đạo và Đội Ngũ Quản Lý',
      startTime: '8:00 AM',
      endTime: '9:00 AM',
      priority: 'High',
      color: Colors.red, // Màu đỏ cho ưu tiên cao
    ),
    Task(
      title: 'Theo Dõi Hoạt Động Bệnh Viện',
      startTime: '9:00 AM',
      endTime: '10:00 AM',
      priority: 'Medium',
      color: Colors.orange, // Màu vàng cho ưu tiên trung bình
    ),
    Task(
      title: 'Quản Lý Tài Chính',
      startTime: '10:00 AM',
      endTime: '11:00 AM',
      priority: 'Low',
      color: Colors.blue, // Màu xanh cho ưu tiên thấp
    ),
    Task(
      title: 'Tương Tác với Bệnh Nhân và Gia Đình',
      startTime: '11:00 AM',
      endTime: '12:00 PM',
      priority: 'High',
      color: Colors.red, // Màu đỏ cho ưu tiên cao
    ),
  ];
