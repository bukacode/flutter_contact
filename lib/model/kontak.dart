
// ignore_for_file: file_names, unnecessary_this, prefer_collection_literals

class Kontak{
    int? id;
    String? name;
    String? price;
    String? stok;
    String? kode_barang;
    
    Kontak({this.id, this.name, this.price, this.stok, this.kode_barang});
    
    Map<String, dynamic> toMap() {
        var map = Map<String, dynamic>();
    
        if (id != null) {
          map['id'] = id;
        }
        map['name'] = name;
        map['price'] = price;
        map['stok'] = stok;
        map['kode_barang'] = kode_barang;
        
        return map;
    }
    
    Kontak.fromMap(Map<String, dynamic> map) {
        this.id = map['id'];
        this.name = map['name'];
        this.price = map['price'];
        this.stok = map['stok'];
        this.kode_barang = map['kode_barang'];
    }
}