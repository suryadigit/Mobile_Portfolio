import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:intl/intl.dart';
import 'package:sakura_app/provider/myModel.dart';

import '../widgets/changePwProfile.dart';
import '../widgets/dashboard.dart';
import '../widgets/detailKasbon.dart';
import '../widgets/history.dart';

class AllBarang extends ChangeNotifier {
  List<Barang> myList = [
    Barang(
        image: "products/rinsocair.png",
        nama: "Rinso Matic Cair 2.7L",
        harga: 239000,
        stok: 18,
        kode: '8991998111765'),
    Barang(
        image: "products/sempurna16.png",
        nama: "Sempurna Mild 16",
        harga: 24000,
        stok: 22,
        kode: '1234567891011'),
    Barang(
        image: "products/unibis.png",
        nama: "Unibis Crackers",
        harga: 7000,
        stok: 20,
        kode: '887229160218'),
    Barang(
        image: "products/moltorefill.png",
        nama: "Molto Refill All in One 720ML",
        harga: 20000,
        stok: 18,
        kode: '899199811267'),
    Barang(
        image: "products/indomie.png",
        nama: "Indomie (semua varian)",
        harga: 3500,
        stok: 18,
        kode: '8998866200578'),
    Barang(
        image: "products/ultramilk.png",
        nama: "Ultra Milk 250ML",
        harga: 6000,
        stok: 18,
        kode: '8991998111766'),
    Barang(
        image: "products/daia.png",
        nama: "Daia Sachet",
        harga: 1000,
        stok: 18,
        kode: '8998866610261'),
    Barang(
        image: "products/kopi.png",
        nama: "Kopi Tubruk Gadjah 150gr",
        harga: 11000,
        stok: 18,
        kode: '8991998111767'),
    Barang(
        image: "products/pop-mie.jpg",
        nama: "Pop Mie Cup",
        harga: 5000,
        stok: 18,
        kode: '08968606002'),
    Barang(
        image: "products/frisian-flag-kaleng.jpg",
        nama: "Susu Kental Manis Frisian Flag",
        harga: 11000,
        stok: 18,
        kode: '8992753101207'),
    Barang(
        image: "products/gery-salut.jpg",
        nama: "Gery Salut Unibis",
        harga: 6000,
        stok: 22,
        kode: '8992775315095'),
  ];

  //ambil isi dari list barang
  List<Barang> get listBarang => myList.toList();

  void addBarang(Barang newBarang) {
    myList.add(newBarang);
    notifyListeners();
  }

  //fitur cari barang dengan search box
  searchTextFiled(String query) {
    if (query.isEmpty) {
      myList = myList.toList();
      notifyListeners();
      return;
    }
    final suggestions = AllBarang().myList.where((item) {
      final namaBarang = item.nama.toLowerCase();
      final input = query.toLowerCase();

      return namaBarang.contains(input);
    }).toList();

    myList = suggestions;
    notifyListeners();
  }

  //fitur cari barang dengan scan barcode
  Future scanBarcode() async {
    var getCode = await FlutterBarcodeScanner.scanBarcode(
        ('#009922'), "Batal", true, ScanMode.DEFAULT);

    if (getCode != "-1") {
      final scanned = AllBarang().myList.where((item) {
        final barcode = item.kode;
        return barcode == getCode;
      }).toList();
      myList = scanned;
    }
    notifyListeners();
  }

  //untuk hapus barang
  void hapusBarang(Barang barang) {
    myList.remove(barang);
    notifyListeners();
  }

// menambah barang ke dasboard
  void tambahBarang(Barang barang) {
    myList.add(barang);
    notifyListeners();
  }

  //TAMBAH BARANG
  TextEditingController _imageController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _hargaController = TextEditingController();
  TextEditingController _stokController = TextEditingController();
  TextEditingController _kodeController = TextEditingController();

  TextEditingController get imageController => _imageController;
  TextEditingController get namaController => _namaController;
  TextEditingController get hargaController => _hargaController;
  TextEditingController get stokController => _stokController;
  TextEditingController get kodeController => _kodeController;
  String? hasilScan;

  Future scanBarcodeForItem() async {
    String hasilScan;
    hasilScan = await FlutterBarcodeScanner.scanBarcode(
        ('#009922'), "Batal", true, ScanMode.DEFAULT);

    if (hasilScan != "-1") {
      _kodeController.text = hasilScan;
    }
  }

  //untuk edit barang
  void updateBarang(Barang updatedBarang) {
    //cari dari kode
    final index =
        myList.indexWhere((barang) => barang.kode == updatedBarang.kode);
    if (index != -1) {
      // klo ketemu, diupdate
      myList[index] = updatedBarang;
      notifyListeners();
    }
  }

  textSearch(String query) {
    final suggestions = AllBarang().myList.where((item) {
      final namaBarang = item.nama.toLowerCase();
      final input = query.toLowerCase();

      return namaBarang.contains(input);
    }).toList();

    myList = suggestions;
  }

  Future editBarcode() async {
    var getCode = await FlutterBarcodeScanner.scanBarcode(
        ('#009922'), "Batal", true, ScanMode.DEFAULT);
    _kodeController.text = getCode;
    notifyListeners();
  }

  getUserDatatmp(int index) {
    return myList[index];
  }
}

class HistoryFilter extends ChangeNotifier {
  final List<String> _historyFilter = [
    "Semua",
    "Hari ini",
    "Kemarin",
    "7 hari terakhir",
    "30 hari terakhir",
  ];

  List<String> get historyFilter => _historyFilter.toList();

  String? _selectedValue = "Semua";

  String? get selectedValue => _selectedValue;
  set selectedValue(val) {
    _selectedValue = val;
    notifyListeners();
  }
}

class Alamat {
  String pemilik;
  String alamat;
  String kecamatan;
  String kota;
  String provinsi;

  Alamat({
    required this.pemilik,
    required this.alamat,
    required this.kecamatan,
    required this.kota,
    required this.provinsi,
  });
}

class AlamatProvider with ChangeNotifier {
  Alamat _alamat = Alamat(
    pemilik: 'Jhon Anzep',
    alamat: 'Jl. Jamin Ginting No.1',
    kecamatan: 'Medan Baru',
    kota: 'Kota Medan',
    provinsi: 'Sumatera Utara',
  );

  Alamat get alamat => _alamat;

  void updateAlamat(
    String pemilik,
    String alamat,
    String kecamatan,
    String kota,
    String provinsi,
  ) {
    _alamat = Alamat(
      pemilik: pemilik,
      alamat: alamat,
      kecamatan: kecamatan,
      kota: kota,
      provinsi: provinsi,
    );
    notifyListeners();
  }
}

class EditAlamat extends ChangeNotifier {
  TextEditingController pemilikController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController kecamatanController = TextEditingController();
  TextEditingController kotaController = TextEditingController();
  TextEditingController provinsiController = TextEditingController();

  void dispose() {
    pemilikController.dispose();
    alamatController.dispose();
    kecamatanController.dispose();
    kotaController.dispose();
    provinsiController.dispose();
    super.dispose();
  }

  void updateAlamat(
    AlamatProvider alamatProvider,
    BuildContext context,
  ) {
    alamatProvider.updateAlamat(
      pemilikController.text,
      alamatController.text,
      kecamatanController.text,
      kotaController.text,
      provinsiController.text,
    );

    Navigator.pop(context);
  }
}

class CardData extends ChangeNotifier {
  bool isSelecting = false;

  List<Map<String, dynamic>> cardDataList = [
    {'nama': 'Nama Pembeli 1', 'harga': 'Rp. 12.000,00', 'isChecked': false},
    {'nama': 'Nama Pembeli 2', 'harga': 'Rp. 5.000,00', 'isChecked': false},
    {'nama': 'Nama Pembeli 3', 'harga': 'Rp. 20.000,00', 'isChecked': false},
    {'nama': 'Nama Pembeli 4', 'harga': 'Rp. 20.000,00', 'isChecked': false},
  ];
  List<int> selectedIndices = [];

  void toggleCardSelection(int index) {
    cardDataList[index]['isChecked'] = !cardDataList[index]['isChecked'];

    if (cardDataList.any((card) => card['isChecked'])) {
      isSelecting = true;
    } else {
      isSelecting = false;
    }

    if (cardDataList[index]['isChecked']) {
      selectedIndices.add(index);
    } else {
      selectedIndices.remove(index);
    }

    notifyListeners();
  }

  void removeSelectedIndices() {
    selectedIndices.sort((a, b) => b.compareTo(a));
    selectedIndices.forEach((index) {
      cardDataList.removeAt(index);
    });
    selectedIndices.clear();

    isSelecting = false; // Reset isSelecting when removing selections

    notifyListeners();
  }
}

class MyRoutes extends ChangeNotifier {
  List pageList = [
    DashboardPage(),
    DetailKasbon(),
    HistoryPage(),
    ChangePwProfile(),
  ];

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

class Auth extends ChangeNotifier {
  bool _obscurePassword = true;
  bool get osbcurePassword => _obscurePassword;

  void hidePassword() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }
}

class RangeDatePicker extends ChangeNotifier {
  // DateTimeRange selectedRangeDate =
  //     DateTimeRange(start: DateTime(2023), end: DateTime(2024));

  final startDate = DateTime(2023);
  final endDate = DateTime(2024);

  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;

  DateTimeRange rangeDate = DateTimeRange(
      start: DateTime.now(), end: DateTime.now().add(Duration(days: 1)));

  void pickDateRange(BuildContext context) async {
    DateTimeRange? newDateRange = await showDateRangePicker(
        context: context,
        initialDateRange: rangeDate,
        firstDate: startDate,
        lastDate: endDate);

    if (newDateRange == null) return;
    rangeDate = newDateRange;
    notifyListeners();
  }

  set setSelectedDate(val) {
    _selectedDate = val;
    notifyListeners();
  }

  String getDateTimeSelected(BuildContext context) {
    return DateFormat('dd mmmm yyyy').format(selectedDate);
  }
}
