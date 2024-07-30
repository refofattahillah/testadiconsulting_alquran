class AudioFull {
  final String audio01;
  final String audio02;
  final String audio03;
  final String audio04;
  final String audio05;

  AudioFull({
    required this.audio01,
    required this.audio02,
    required this.audio03,
    required this.audio04,
    required this.audio05,
  });

  factory AudioFull.fromJson(Map<String, dynamic> json) {
    return AudioFull(
      audio01: json['01'],
      audio02: json['02'],
      audio03: json['03'],
      audio04: json['04'],
      audio05: json['05'],
    );
  }
}

class Surah {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String tempatTurun;
  final String arti;
  final String deskripsi;
  final AudioFull audioFull;

  Surah({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audioFull,
  });

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      nomor: json['nomor'],
      nama: json['nama'],
      namaLatin: json['namaLatin'],
      jumlahAyat: json['jumlahAyat'],
      tempatTurun: json['tempatTurun'],
      arti: json['arti'],
      deskripsi: json['deskripsi'],
      audioFull: AudioFull.fromJson(json['audioFull']),
    );
  }
}