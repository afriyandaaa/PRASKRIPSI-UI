// To parse this JSON data, do
//
//     final jadwalKrs = jadwalKrsFromJson(jsonString);

import 'dart:convert';

JadwalKrs jadwalKrsFromJson(String str) => JadwalKrs.fromJson(json.decode(str));

String jadwalKrsToJson(JadwalKrs data) => json.encode(data.toJson());

class JadwalKrs {
    String dosenPa;
    List<Kr> krs;
    String nama;
    String programStudi;

    JadwalKrs({
        required this.dosenPa,
        required this.krs,
        required this.nama,
        required this.programStudi,
    });

    factory JadwalKrs.fromJson(Map<String, dynamic> json) => JadwalKrs(
        dosenPa: json["dosen_pa"],
        krs: List<Kr>.from(json["krs"].map((x) => Kr.fromJson(x))),
        nama: json["nama"],
        programStudi: json["program_studi"],
    );

    Map<String, dynamic> toJson() => {
        "dosen_pa": dosenPa,
        "krs": List<dynamic>.from(krs.map((x) => x.toJson())),
        "nama": nama,
        "program_studi": programStudi,
    };
}

class Kr {
    Jadwal jadwal;

    Kr({
        required this.jadwal,
    });

    factory Kr.fromJson(Map<String, dynamic> json) => Kr(
        jadwal: Jadwal.fromJson(json["jadwal"]),
    );

    Map<String, dynamic> toJson() => {
        "jadwal": jadwal.toJson(),
    };
}

class Jadwal {
    String hari;
    String jamMulai;
    String jamSelesai;
    int kelas;
    String kode;
    String namaMatkul;
    String ruang;
    int sks;

    Jadwal({
        required this.hari,
        required this.jamMulai,
        required this.jamSelesai,
        required this.kelas,
        required this.kode,
        required this.namaMatkul,
        required this.ruang,
        required this.sks,
    });

    factory Jadwal.fromJson(Map<String, dynamic> json) => Jadwal(
        hari: json["hari"],
        jamMulai: json["jam_mulai"],
        jamSelesai: json["jam_selesai"],
        kelas: json["kelas"],
        kode: json["kode"],
        namaMatkul: json["nama_matkul"],
        ruang: json["ruang"],
        sks: json["sks"],
    );

    Map<String, dynamic> toJson() => {
        "hari": hari,
        "jam_mulai": jamMulai,
        "jam_selesai": jamSelesai,
        "kelas": kelas,
        "kode": kode,
        "nama_matkul": namaMatkul,
        "ruang": ruang,
        "sks": sks,
    };
}
