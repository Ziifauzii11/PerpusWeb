<?php
    $id = $_GET['id'];
    $sql = $koneksi->query("delete from tb_buku where id='$id'");
?>
<script type="text/javascript">
    window.location.href="?page=buku";
</script>