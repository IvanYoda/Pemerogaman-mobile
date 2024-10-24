import 'package:flutter/material.dart';
import 'about_page.dart';
import 'profile_page.dart';

class HomePage extends StatelessWidget {
  final String username;

  HomePage({required this.username});

  // Daftar tempat wisata
  final List<Map<String, String>> touristSpots = [
    {
      'name': 'Pantai Kuta',
      'description':
          'Pantai indah dengan pasir putih dan ombak yang cocok untuk berselancar. Terletak di Bali, Pantai Kuta adalah salah satu tujuan wisata paling populer di Indonesia.',
      'imageUrl': 'assets/kuta.jpeg',
    },
    {
      'name': 'Candi Borobudur',
      'description':
          'Candi Buddha terbesar di dunia dan salah satu situs bersejarah Indonesia. Terletak di Magelang, Jawa Tengah, candi ini dikelilingi oleh pemandangan alam yang menakjubkan.',
      'imageUrl': 'assets/borobudur.jpeg',
    },
    {
      'name': 'Danau Toba',
      'description':
          'Danau vulkanik terbesar di Indonesia dengan pemandangan pegunungan yang memukau. Terletak di Sumatera Utara, Danau Toba adalah destinasi yang ideal untuk bersantai dan menikmati keindahan alam.',
      'imageUrl': 'assets/toba.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.lightBlue,
        actions: [
          // Tombol Navigasi Profil di AppBar
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfilePage(username: username)),
              );
            },
            child: Text(
              'Go to Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.lightBlue.shade100, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Text
                Text(
                  'Welcome, $username',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                // List of Tourist Spots
                Expanded(
                  child: ListView.builder(
                    itemCount: touristSpots.length,
                    itemBuilder: (context, index) {
                      final spot = touristSpots[index];
                      return Card(
                        elevation: 10,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Gambar tempat wisata dengan sudut yang melengkung
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              child: Image.asset(
                                spot['imageUrl']!,
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    spot['name']!,
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlue.shade800,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    spot['description']!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // Button Row at the Bottom
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Tombol Navigasi About Page
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutPage()),
                          );
                        },
                        child: Text(
                          'About',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: Colors.lightBlue.shade900,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
