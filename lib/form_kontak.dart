
// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, non_constant_identifier_names

    import 'package:flutter/material.dart';
    import 'database/db_helper.dart';
    import 'model/kontak.dart';
    
    
    class FormKontak extends StatefulWidget {
        final Kontak? kontak;
    
        FormKontak({this.kontak});
    
        @override
        _FormKontakState createState() => _FormKontakState();
    }
    
    class _FormKontakState extends State<FormKontak> {
        DbHelper db = DbHelper();
    
        TextEditingController? name;
        TextEditingController? price;
        TextEditingController? stok;
        TextEditingController? kode_barang;
    
        @override
        void initState() {
        name = TextEditingController(
            text: widget.kontak == null ? '' : widget.kontak!.name);
    
        price = TextEditingController(
            text: widget.kontak == null ? '' : widget.kontak!.price);
    
        stok = TextEditingController(
            text: widget.kontak == null ? '' : widget.kontak!.stok);
    
        kode_barang = TextEditingController(
            text: widget.kontak == null ? '' : widget.kontak!.kode_barang);
            
        super.initState();
        }
    
        @override
        Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
            title: Text('Form Kontak'),
            ),
            body: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
                Padding(
                padding: const EdgeInsets.only(
                    top: 20,
                ),
                child: TextField(
                    controller: name,
                    decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        )),
                ),
                ),
                Padding(
                padding: const EdgeInsets.only(
                    top: 20,
                ),
                child: TextField(
                    controller: price,
                    decoration: InputDecoration(
                        labelText: 'price',
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        )),
                ),
                ),
                Padding(
                padding: const EdgeInsets.only(
                    top: 20,
                ),
                child: TextField(
                    controller: stok,
                    decoration: InputDecoration(
                        labelText: 'stok',
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        )),
                ),
                ),
                Padding(
                padding: const EdgeInsets.only(
                    top: 20,
                ),
                child: TextField(
                    controller: kode_barang,
                    decoration: InputDecoration(
                        labelText: 'kode barang',
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        )),
                ),
                ),
                Padding(
                padding: const EdgeInsets.only(
                    top: 20
                ),
                child: ElevatedButton(
                    child: (widget.kontak == null)
                        ? Text(
                            'Add',
                            style: TextStyle(color: Colors.white),
                        )
                        : Text(
                            'Update',
                            style: TextStyle(color: Colors.white),
                        ),
                    onPressed: () {
                    upsertKontak();
                    },
                ),
                )
            ],
            ),
        );
        }
    
        Future<void> upsertKontak() async {
        if (widget.kontak != null) {
            //update
            await db.updateKontak(Kontak.fromMap({
            'id' : widget.kontak!.id,
            'name' : name!.text,
            'price' : price!.text,
            'stok' : stok!.text,
            'kode_barang' : kode_barang!.text
            }));
            Navigator.pop(context, 'update');
        } else {
            //insert
            await db.saveKontak(Kontak(
            name: name!.text,
            price: price!.text,
            stok: stok!.text,
            kode_barang: kode_barang!.text,
            ));
            Navigator.pop(context, 'save');
        }
        }
    }