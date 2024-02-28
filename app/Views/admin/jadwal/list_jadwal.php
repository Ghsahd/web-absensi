<div class="card-body table-responsive">
  <?php if (!$empty) : ?>
    <table class="table table-hover">
      <thead class="text-primary">
      <th><b>No</b></th>
        <th><b>Guru</b></th>
        <th><b>Kelas</b></th>
        <th><b>Mata Pelajaran</b></th>
        <th><b>Hari</b></th>
        <th><b>Jam Mulai</b></th>
        <th><b>Jam Selesai</b></th>
        <?php if (user()->toArray()['is_superadmin'] ?? '0' == '1') : ?>
        <th><b>Aksi</b></th>
        <?php endif ; ?>
      </thead>
      <tbody>
        <?php $i = 1;
        foreach ($data as $value) : ?>
          <tr>
            <td><?= $i; ?></td>
            <td><?= $value['nama_guru']; ?></td>
            <td><b><?= $value['kelas'] . " " . $value['jurusan']; ?></b></td>
            <td><?= $value['matpel']; ?></td>
            <td><?= $value['hari']; ?></td>
            <td><?= $value['jam_mulai']; ?></td>
            <td><?= $value['jam_selesai']; ?></td>
            <?php if (user()->toArray()['is_superadmin'] ?? '0' == '1') : ?>
            <td>
              <a href="<?= base_url('admin/jadwal/' . $value['id_jadwal'] . '/edit'); ?>" type="button" class="btn btn-primary p-2" id="<?= $value['id_jadwal']; ?>">
                <i class="material-icons">edit</i>
                Edit
              </a>
              <form action="<?= base_url('admin/jadwal/' . $value['id_jadwal']); ?>" method="post" class="d-inline">
                <?= csrf_field(); ?>
                <input type="hidden" name="_method" value="DELETE">
                <button onclick="return confirm('Konfirmasi untuk menghapus data');" type="submit" class="btn btn-danger p-2" id="<?= $value['id_jadwal']; ?>">
                  <i class="material-icons">delete_forever</i>
                  Delete
                </button>
              </form>
            </td>
            <?php endif ; ?>
          </tr>
        <?php $i++;
        endforeach; ?>
      </tbody>
    </table>
  <?php else : ?>
    <div class="row">
      <div class="col">
        <h4 class="text-center text-danger">Data tidak ditemukan</h4>
      </div>
    </div>
  <?php endif; ?>
</div>