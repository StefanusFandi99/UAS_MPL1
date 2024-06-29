import 'package:flutter/material.dart';

class HapusIklan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Hapus Iklan', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 57, 57, 57),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('• Hapus semua iklan', style: TextStyle(color: Colors.black)),
            Text('• Buka kunci semua fitur', style: TextStyle(color: Colors.black)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SubscriptionOption(
                  duration: '1 bulan',
                  price: 'Rp 19.000,00',
                  isHighlighted: false,
                ),
                SubscriptionOption(
                  duration: '1 tahun',
                  price: 'Rp 159.000,00',
                  isHighlighted: true,
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Anda akan mendapatkan uji coba gratis selama 3 hari. '
              'Anda dapat membatalkan langganan selama masa uji coba gratis. '
              'Setelah itu, Anda akan otomatis ditagih sebesar Rp 159.000,00 setiap tahun hingga Anda membatalkan langganan.',
              style: TextStyle(color: Colors.black),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Tambahkan logika untuk mulai uji coba gratis
                },
                child: Text('MULAI UJI COBA GRATIS', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 36),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Perkecil border radius menjadi 10
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubscriptionOption extends StatelessWidget {
  final String duration;
  final String price;
  final bool isHighlighted;

  SubscriptionOption({
    required this.duration,
    required this.price,
    required this.isHighlighted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: isHighlighted ? Colors.black : Colors.grey,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            duration,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isHighlighted ? Colors.black : Colors.grey,
            ),
          ),
          Text(
            price,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isHighlighted ? Colors.black : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
