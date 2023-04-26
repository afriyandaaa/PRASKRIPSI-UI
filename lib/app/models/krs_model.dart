// To parse this JSON data, do
//
//     final jadwalKrs = jadwalKrsFromJson(jsonString);

import 'dart:convert';

JadwalKrs jadwalKrsFromJson(String str) => JadwalKrs.fromJson(json.decode(str));

String jadwalKrsToJson(JadwalKrs data) => json.encode(data.toJson());

class JadwalKrs {
    JadwalKrs({
        required this.nTxHzif8Jmrw3L4Jr5M,
    });

    NTxHzif8Jmrw3L4Jr5M nTxHzif8Jmrw3L4Jr5M;

    factory JadwalKrs.fromJson(Map<String, dynamic> json) => JadwalKrs(
        nTxHzif8Jmrw3L4Jr5M: NTxHzif8Jmrw3L4Jr5M.fromJson(json["-NTxHZIF8Jmrw3l4jr5m"]),
    );

    Map<String, dynamic> toJson() => {
        "-NTxHZIF8Jmrw3l4jr5m": nTxHzif8Jmrw3L4Jr5M.toJson(),
    };
}

class NTxHzif8Jmrw3L4Jr5M {
    NTxHzif8Jmrw3L4Jr5M({
        required this.mahasiswa,
    });

    Map<String, Mahasiswa> mahasiswa;

    factory NTxHzif8Jmrw3L4Jr5M.fromJson(Map<String, dynamic> json) => NTxHzif8Jmrw3L4Jr5M(
        mahasiswa: Map.from(json["mahasiswa"]).map((k, v) => MapEntry<String, Mahasiswa>(k, Mahasiswa.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "mahasiswa": Map.from(mahasiswa).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class Mahasiswa {
    Mahasiswa({
        required this.kelas,
        required this.krs,
        required this.nama,
    });

    String kelas;
    List<Kr?> krs;
    String nama;

    factory Mahasiswa.fromJson(Map<String, dynamic> json) => Mahasiswa(
        kelas: json["kelas"],
        krs: List<Kr?>.from(json["krs"].map((x) => x == null ? null : Kr.fromJson(x))),
        nama: json["nama"],
    );

    Map<String, dynamic> toJson() => {
        "kelas": kelas,
        "krs": List<dynamic>.from(krs.map((x) => x?.toJson())),
        "nama": nama,
    };
}

class Kr {
    Kr({
        required this.jadwal,
        required this.matakuliah,
        required this.ruang,
        required this.sks,
    });

    Jadwal jadwal;
    Matakuliah matakuliah;
    String ruang;
    int sks;

    factory Kr.fromJson(Map<String, dynamic> json) => Kr(
        jadwal: Jadwal.fromJson(json["jadwal"]),
        matakuliah: Matakuliah.fromJson(json["matakuliah"]),
        ruang: json["ruang"],
        sks: json["sks"],
    );

    Map<String, dynamic> toJson() => {
        "jadwal": jadwal.toJson(),
        "matakuliah": matakuliah.toJson(),
        "ruang": ruang,
        "sks": sks,
    };
}

class Jadwal {
    Jadwal({
        required this.hari,
        required this.jamMulai,
        required this.jamSelesai,
    });

    String hari;
    String jamMulai;
    String jamSelesai;

    factory Jadwal.fromJson(Map<String, dynamic> json) => Jadwal(
        hari: json["hari"],
        jamMulai: json["jam_mulai"],
        jamSelesai: json["jam_selesai"],
    );

    Map<String, dynamic> toJson() => {
        "hari": hari,
        "jam_mulai": jamMulai,
        "jam_selesai": jamSelesai,
    };
}

class Matakuliah {
    Matakuliah({
        required this.kode,
        required this.namaMatkul,
    });

    String kode;
    String namaMatkul;

    factory Matakuliah.fromJson(Map<String, dynamic> json) => Matakuliah(
        kode: json["kode"],
        namaMatkul: json["nama_matkul"],
    );

    Map<String, dynamic> toJson() => {
        "kode": kode,
        "nama_matkul": namaMatkul,
    };
}
