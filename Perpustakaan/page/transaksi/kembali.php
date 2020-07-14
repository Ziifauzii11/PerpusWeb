<?php
$id =$_GET['id'];
$judul =$_GET['judul'];
$sql = $koneksi->query("update tb_transaksi set status = 'kembali' where id='$id'");
$sql2 = $koneksi->query("update tb_buku set jumlah_buku = (jumlah_buku+1) where id='$id'");
    ?>
        <script type="text/javascript">
            alert("Proses Kembali Buku Berhasil");
            window.location.href="?page=transaksi";
        </script>
    <?php
?>