import 'dart:io';
import 'dart:async';

Future<String> fetchKataMotivasi() async {
  await Future.delayed(Duration(seconds: 2));
  return 'TALON PLSS MEGALODON, KISUR SAYANG TALON';
}

String konversiNilai(int angka) {
  if (angka > 85) return "A";
  if (angka > 80) return "AB";
  if (angka > 75) return "B";
  if (angka > 70) return "BC";
  if (angka > 65) return "C";
  if (angka > 60) return "D";
  return "E";
}

Future<void> tugasPemmob2() async {
  stdout.writeln('=== TUGAS DART ESSENTIALS ===\n');

  stdout.write('Masukkan Nama: ');
  final nama = stdin.readLineSync() ?? '';

  stdout.write('Masukkan NIM: ');
  final nim = stdin.readLineSync() ?? '';

  stdout.write('Masukkan Program Studi: ');
  final prodi = stdin.readLineSync() ?? '';

  stdout.write('Masukkan Angkatan: ');
  final angkatan = stdin.readLineSync() ?? '';

  stdout.write('\nJumlah mata kuliah yang ingin diinput? ');
  final jumlahMatkul = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

  List<String> mataKuliah = [];
  for (var i = 1; i <= jumlahMatkul; i++) {
    stdout.write('Masukkan nama mata kuliah ke-$i: ');
    mataKuliah.add(stdin.readLineSync() ?? 'Mata Kuliah $i');
  }

  Map<String, String> harapanNilai = {};
  for (var mk in mataKuliah) {
    stdout.write('Harapan nilai untuk "$mk": ');
    final angka = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;
    harapanNilai[mk] = "$angka → ${konversiNilai(angka)}";
  }

  stdout.writeln('\nMengambil kata motivasi (async)...');
  final kataMotivasi = await fetchKataMotivasi();

  stdout.writeln('\n=== TUGAS ===');
  stdout.writeln('Nama         : $nama');
  stdout.writeln('NIM          : $nim');
  stdout.writeln('Program Studi: $prodi');
  stdout.writeln('Angkatan     : $angkatan');

  stdout.writeln('\nMata Kuliah & Harapan Nilai:');
  harapanNilai.forEach((mk, nilai) => stdout.writeln('- $mk : $nilai'));

  stdout.writeln('\nKata motivasi:');
  stdout.writeln('"$kataMotivasi"');
}

void main() async {
  await tugasPemmob2();
}
