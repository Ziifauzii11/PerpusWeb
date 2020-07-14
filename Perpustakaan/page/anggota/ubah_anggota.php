<?php
    $nim = @$_GET['id'];
    $sql = $koneksi->query("select * from tb_anggota where nim='$nim'");
    $tampil = $sql->fetch_assoc();
    $jkl = $tampil['jk'];
    $prodi = $tampil['prodi'];
?>
<div class="panel panel-default">
<div class="panel-heading">
      Ubah Data
</div>
<div class="panel-body">
    <div class="row">
        <div class="col-md-12">
            <form method="POST">
                <div class="form-group">
                    <label>NIM</label>
                    <input class="form-control" name="nim" value="<?php echo $tampil['nim']?>" readonly/>
                </div>
				<div class="form-group">
                    <label>Nama</label>
                    <input class="form-control" name="nama" value="<?php echo $tampil['nama']?>"/>
                        </div>
						<div class="form-group">
                            <label>Tempat Lahir</label>
                            <input class="form-control" name="tempat_lahir" value="<?php echo $tampil['tempat_lahir']?>"/>
                        </div>
                        <div class="form-group">
                                <label>Tanggal Lahir</label>
                                <input class="form-control" type="date" name="tgl_lahir"  value="<?php echo $tampil['tgl_lahir']?>"/>                                
                            </div>
                        <div class="form-group">
                            <label>Jenis Kelamin</label></br>
                            <label class="radio-inline">
                                <input type="radio" value="L" name="jk" <?php echo($jkl=='L')?"checked":"" ?> /> Laki-Laki
                            </label>
                            <label class="radio-inline">
                                <input type="radio" value="P" name="jk" <?php echo($jkl=='P')?"checked":"" ?>/> Perempuan
                            </label>
                        </div>							
						<div class="form-group">
                            <label>Program Studi</label>
                            <input class="form-control" name="prodi" value="<?php echo $tampil['prodi']?>"/>
                        </div>								
							<div>
								<input type="submit" name="simpan" value="Simpan" class="btn btn-primary">	
							</div>
						</div>							
					</form>
				</div>
            </div>
        </div>
</div>
<?php
   $nim = @$_POST ['nim'];
   $nama = @$_POST ['nama'];
   $tempat_lahir = @$_POST ['tempat_lahir'];
   $tgl_lahir = @$_POST ['tgl_lahir'];
   $jk = @$_POST ['jk'];
   $prodi = @$_POST ['prodi'];
   $simpan = @$_POST ['simpan'];
   if($simpan) {
    $sql = $koneksi->query("update tb_anggota set nama='$nama',tempat_lahir='$tempat_lahir',tgl_lahir='$tgl_lahir',
    jk='$jk',prodi='$prodi' where nim='$nim'");
		  ?>
		    <script type="text/javascript">
			     alert("Data Berhasil Disimpan");	
                 window.location.href="?page=anggota";
		    </script>
		<?php
	  }
?>