<?php

// Format Uang Indonesia
function format_uang($angka){
    return 'Rp. ' . number_format($angka, 0,',', '.');
}

// Format Uang Terbilang
function terbilang($angka){
    $angka = abs($angka);
    $baca = array('', 'satu','dua','tiga','empat','lima','enam','tujuh','delapan','sembilan','sepuluh','sebelas');
    $terbilang = '';

    if ($angka < 12){ // 1 sampai 11
        $terbilang = ' ' . $baca[$angka];
    } elseif($angka < 20){ // 12 sampai 19
        $terbilang = terbilang($angka - 10) . ' belas';
    } elseif($angka < 100){ // 20 sampai 99
        $terbilang = terbilang($angka / 10) . ' puluh' . terbilang($angka % 10);
    } elseif($angka < 199){ // 100 sampai 199
        $terbilang = ' seratus' . terbilang($angka - 100);
    } elseif($angka < 1000){ // 200 sampai 999
        $terbilang = terbilang($angka / 100) . ' ratus' . terbilang($angka % 100);
    } elseif($angka < 2000){ // 1.000 sampai 1.999
        $terbilang = ' seribu' . terbilang($angka - 1000);
    } elseif($angka < 1000000){ // 2.000 sampai 999.999
        $terbilang = terbilang($angka / 1000) . ' ribu' . terbilang($angka % 1000);
    } elseif($angka < 1000000000){ // 1.000.000 sampai 999.999.999
        $terbilang = terbilang($angka / 1000000) . ' juta' . terbilang($angka % 1000000);
    }

    return $terbilang;
}

// Format Tanggal Indonesia
if (!function_exists('format_tanggal')) {
    function format_tanggal($tanggal)
    {
        $timestamp = strtotime($tanggal);

        // Cek apakah tanggal valid
        if (!$timestamp) {
            return "Tanggal tidak valid";
        }

        // Array nama bulan
        $bulan = [
            1 => 'Januari',
            'Februari',
            'Maret',
            'April',
            'Mei',
            'Juni',
            'Juli',
            'Agustus',
            'September',
            'Oktober',
            'November',
            'Desember'
        ];

        // Mendapatkan nama hari
        $nama_hari = date('l', $timestamp);
        
        // Mengonversi nama hari ke dalam Bahasa Indonesia
        $hari_indonesia = [
            'Sunday' => 'Minggu',
            'Monday' => 'Senin',
            'Tuesday' => 'Selasa',
            'Wednesday' => 'Rabu',
            'Thursday' => 'Kamis',
            'Friday' => 'Jumat',
            'Saturday' => 'Sabtu',
        ];

        // Mengambil nama hari dalam Bahasa Indonesia
        $nama_hari_indonesia = $hari_indonesia[$nama_hari];

        // Format tanggal
        $tanggal_terformat = $nama_hari_indonesia . ', ' . date('d', $timestamp) . ' ' . $bulan[(int)date('m', $timestamp)] . ' ' . date('Y', $timestamp);
        
        return $tanggal_terformat;
    }
}


?>