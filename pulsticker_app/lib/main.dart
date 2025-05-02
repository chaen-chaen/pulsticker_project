import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // JSON을 Dart 객체로 변환할 때 필요

// 앱 실행 진입점
void main() {
  runApp(const PulstickerApp());
}

// 앱 전체 구조 설정
class PulstickerApp extends StatelessWidget {
  const PulstickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pulsticker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const PulstickerListPage(), // 첫 화면으로 띄울 위젯
    );
  }
}

// 뉴스 리스트 화면
class PulstickerListPage extends StatefulWidget {
  const PulstickerListPage({super.key});

  @override
  State<PulstickerListPage> createState() => _PulstickerListPageState();
}

class _PulstickerListPageState extends State<PulstickerListPage> {
  // 서버에서 받아올 뉴스 데이터를 담는 리스트
  List<dynamic> pulstickers = [];

  @override
  void initState() {
    super.initState();
    fetchPulstickers(); // 앱이 실행되면 자동으로 데이터 불러오기
  }

  // Django 서버에서 뉴스 데이터 받아오기
  Future<void> fetchPulstickers() async {
    final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/pulstickers/'), // Android 에뮬레이터용 로컬 주소
    );

    if (response.statusCode == 200) {
      setState(() {
        pulstickers = json.decode(response.body); // JSON 문자열 → Dart 리스트
      });
    } else {
      throw Exception('Failed to load pulstickers'); // 에러 메시지
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pulsticker'),
      ),
      body: ListView.builder(
        itemCount: pulstickers.length,
        itemBuilder: (context, index) {
          final item = pulstickers[index];
          return ListTile(
            title: Text(item['title']),
            subtitle: Text(item['content']),
          );
        },
      ),
    );
  }
}
