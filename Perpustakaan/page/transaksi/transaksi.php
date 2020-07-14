<a href="?page=transaksi&aksi=tambah" class="btn btn-primary" style="margin-bottom:5px;"><i class="fa fa-plus"></i>Tambah Data</a>
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                Data Transaksi
            </div>
    <div class="panel-body">
    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
            <thead>
            <tr>
                <th>No</th>
                <th>Judul</th>
                <th>NIM</th>
                <th>Nama</th>
                <th>Tanggal Pinjam</th>
                <th>Tanggal Kembali</th>
                <th>Terlambat</th>
				<th>Status</th>
				<th>Aksi</th>
            </tr>
            </thead>
            <tbody>
			<?php
			$no = 1;
			$sql = $koneksi->query("select * from tb_transaksi where status='pinjam'");
			while ($data = $sql->fetch_assoc()) {
            ?>
			<tr>
				<td><?php echo $no++;?></td>
                <td><?php echo $data['judul'];?></td>
                <td><?php echo $data['nim'];?></td>
				<td><?php echo $data['nama'];?></td>
				<td><?php echo $data['tgl_pinjam'];?></td>
				<td><?php echo $data['tgl_kembali'];?></td>
				<td>
                    <?php
                    $tgl_dateline=$data['tgl_kembali'];
                    $tgl_kembali=date('d-m-y');
                    $lambat= terlambat($tgl_dateline,$tgl_kembali);
                    $denda1=1000;
                    $denda=$lambat*$denda1;
                    if ($lambat>0) {
                        echo "<font color='red'>$lambat hari<br>(Rp $denda)</font>";
                    }else{
                        echo $lambat." hari";
                    }
                        ?>
                </td>
				<td><?php echo $data['status'];?></td>		
				<td>
				<a href="?page=transaksi&aksi=kembali&id=<?php echo $data['id']; ?>&judul=
                <?php echo $data['judul']; ?>" class="btn btn-info" > Kembali</a>
                <a href="?page=transaksi&aksi=perpanjang&id=<?php echo $data['id']; ?>
                &judul=<?php echo $data['judul']?>&lambat=<?php echo $lambat ?>
                &tgl_kembali=<?php echo $data['tgl_kembali']?>" class="btn btn-danger" > Perpanjang</a>
				</td>
			</tr>
                <?php } ?>
			<tbody>
				</div>
			</div>
		</div>
	</div>
</div>