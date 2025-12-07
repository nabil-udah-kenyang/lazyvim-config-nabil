<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title></title>
</head>

<body>
  <?php
  $nama = "rendi\n";
  echo $nama;
  for ($a = 1; $a < 10; $a++) {
    echo "angka $a\n";
  }

  mysqli_connect("localhost", "root", "", "db_nabil");
  mysqli_query("INSERT INTO siswa (nama, alamat) VALUES ('nabil', 'bekasi');"

</body>

</html>
