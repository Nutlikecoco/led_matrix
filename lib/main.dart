import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LED Matrix',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LEDScreen(),
    );
  }
}

class LEDScreen extends StatefulWidget {
  @override
  _LEDScreenState createState() => _LEDScreenState();
}

class _LEDScreenState extends State<LEDScreen> {
  int number = 0; // เลขที่จะแสดง

  // เมธอดสำหรับแสดงจุด LED 1 จุด
  Widget _buildDot(bool isActive) {
    return Container(
      width: 20, // ความกว้างของจุด
      height: 20, // ความสูงของจุด
      margin: const EdgeInsets.all(1), // ระยะห่างรอบๆจุด
      decoration: BoxDecoration(
        shape: BoxShape.circle, // กำหนดให้เป็นรูปวงกลม
        color: isActive ? Color.fromARGB(255, 167, 253, 98) : Color.fromARGB(255, 59, 59, 59), // สีของจุด
      ),
    );
  }

  // เมธอดสำหรับแสดงแถวของจุด LED
  Widget _buildRow(List<bool> row) {
    List<Widget> dots = [];
    for (int i = 0; i < row.length; i++) {
      dots.add(_buildDot(row[i]));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: dots,
    );
  }

  // เมธอดสำหรับแสดงตารางของจุดเป็นตัวเลข 1 หลัก
  Widget _buildDigit(int digit) {
    List<List<bool>> digitMatrix = _getDigitMatrix(digit);
    List<Widget> rows = [];
    for (int i = 0; i < digitMatrix.length; i++) {
      rows.add(_buildRow(digitMatrix[i]));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: rows,
    );
  }

  // เมธอดสำหรับรับเลขและแปลงเป็นตารางของจุด
  List<List<bool>> _getDigitMatrix(int digit) {
    List<List<bool>> digitMatrix = [];
    switch (digit) {
      case 0:
        digitMatrix = [
          [false, true, true, true, false],
          [true, false, false, false, true],
          [true, false, false, false, true],
          [true, false, false, false, true],
          [true, false, false, false, true],
          [true, false, false, false, true],
          [false, true, true, true, false],
        ];
        break;
      case 1:
        digitMatrix = [
          [false, false, true, false, false],
          [false, true, true, false, false],
          [false, false, true, false, false],
          [false, false, true, false, false],
          [false, false, true, false, false],
          [false, false, true, false, false],
          [false, true, true, true, false],
        ];
        break;
      case 2:
        digitMatrix = [
          [false, true, true, true, false],
          [true, false, false, false, true],
          [false, false, false, false, true],
          [false, false, false, true, false],
          [false, false, true, false, false],
          [false, true, false, false, false],
          [true, true, true, true, true],
        ];
        break;
      case 3:
        digitMatrix = [
          [false, true, true, true, false],
          [true, false, false, false, true],
          [false, false, false, false, true],
          [false, true, true, true, false],
          [false, false, false, false, true],
          [true, false, false, false, true],
          [false, true, true, true, false],
        ];
        break;
      case 4:
        digitMatrix = [
          [false, false, false, true, false],
          [false, false, true, true, false],
          [false, true, false, true, false],
          [true, false, false, true, false],
          [true, true, true, true, true],
          [false, false, false, true, false],
          [false, false, false, true, false],
        ];
        break;
      case 5:
        digitMatrix = [
          [true, true, true, true, true],
          [true, false, false, false, false],
          [true, true, true, true, false],
          [false, false, false, false, true],
          [false, false, false, false, true],
          [true, false, false, false, true],
          [false, true, true, true, false],
        ];
        break;
      case 6:
        digitMatrix = [
          [false, true, true, true, false],
          [true, false, false, false, true],
          [true, false, false, false, false],
          [true, true, true, true, false],
          [true, false, false, false, true],
          [true, false, false, false, true],
          [false, true, true, true, false],
        ];
        break;
      case 7:
        digitMatrix = [
          [true, true, true, true, true],
          [false, false, false, false, true],
          [false, false, false, true, false],
          [false, false, true, false, false],
          [false, true, false, false, false],
          [false, true, false, false, false],
          [false, true, false, false, false],
        ];
        break;
      case 8:
        digitMatrix = [
          [false, true, true, true, false],
          [true, false, false, false, true],
          [true, false, false, false, true],
          [false, true, true, true, false],
          [true, false, false, false, true],
          [true, false, false, false, true],
          [false, true, true, true, false],
        ];
        break;
      case 9:
        digitMatrix = [
          [false, true, true, true, false],
          [true, false, false, false, true],
          [true, false, false, false, true],
          [false, true, true, true, true],
          [false, false, false, false, true],
          [true, false, false, false, true],
          [false, true, true, true, false],
        ];
        break;
      default:
        digitMatrix = [
          [true, true, true, true, true],
          [true, false, false, false, true],
          [true, false, false, false, true],
          [true, false, false, false, true],
          [true, false, false, false, true],
          [true, false, false, false, true],
          [true, true, true, true, true],
        ];
    }
    return digitMatrix;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CP-SU LED MATRIX',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), // กำหนดสีข้อความใน AppBar เป็นสีขาว
        ),
        backgroundColor:
            Colors.deepPurple, // กำหนดสีของ AppBar 
        centerTitle: true,
        elevation: 2, // กำหนดความหนาของเส้นขอบ AppBar
      ),
      body: Container(
        color: Color.fromARGB(255, 202, 178, 255), // กำหนดสีพื้นหลังของ body
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // border: Border.all(color: Colors.black, width: 2),
                  color: Colors.deepPurple.shade50,
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_drop_up, size: 70),
                  onPressed: () {
                    setState(() {
                      number = (number + 1) %
                          100; // เพิ่มเลขขึ้น 1 และวนกลับไปเป็น 00 เมื่อถึง 99
                    });
                  },
                ),
              ),
              Container(
                height: 270,
                width: 400,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black, // กำหนดสีดำให้กับพื้นหลัง
                  border: Border.all(
                    color: Colors.white, // กำหนดสีขอบ
                    width: 12.0, // กำหนดความหนาขอบ
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child:
                          _buildDigit(number ~/ 10), // แสดงตัวเลขหลักที่หนึ่ง
                    ),
                    SizedBox(width: 20.0), // ระยะห่างระหว่างตัวเลข
                    Container(
                      child: _buildDigit(number % 10), // แสดงตัวเลขหลักที่สอง
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // border: Border.all(color: Colors.black, width: 2),
                  color: Colors.deepPurple.shade50,
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_drop_down, size: 70),
                  onPressed: () {
                    setState(() {
                      number = (number - 1) %
                          100; // ลดเลขลง 1 และวนกลับไปเป็น 99 เมื่อถึง 00
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}