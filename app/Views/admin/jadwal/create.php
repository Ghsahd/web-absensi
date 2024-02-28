<?= $this->extend('templates/admin_page_layout') ?>
<?= $this->section('content') ?>
<div class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-lg-12 col-md-12">
        <div class="card">
          <div class="card-header card-header-primary">
            <h4 class="card-title"><b>Form Tambah Jadwal</b></h4>
          </div>
          <div class="card-body mx-5 my-3">

            <form action="<?= base_url('admin/jadwal'); ?>" method="post">
              <?= csrf_field() ?>
              <?php $validation = \Config\Services::validation(); ?>

              <?php if (session()->getFlashdata('msg')) : ?>
                <div class="pb-2">
                  <div class="alert alert-danger">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                      <i class="material-icons">close</i>
                    </button>
                    <?= session()->getFlashdata('msg') ?>
                  </div>
                </div>
              <?php endif; ?>
              <div class="row">
                <div class="col-12">
                  <label for="id_matpel">Kelas</label>
                  <select class="custom-select <?= $validation->getError('id_kelas') ? 'is-invalid' : ''; ?>" id="id_kelas" name="id_kelas">
                    <option value="">--Kelas-</option>
                    <?php foreach ($kelas as $value) : ?>
                      <?= var_dump($kelas) ?>
                      <option value="<?= $value['id_kelas']; ?>" <?= old('id_kelas') ?? $oldInput['id_kelas'] ?? '' == $value['id_kelas'] ? 'selected' : ''; ?>>
                        <?= $value['kelas'] . " " . $value['jurusan']; ?>
                      </option>
                    <?php endforeach; ?>
                  </select>
                  <div class="invalid-feedback">
                    <?= $validation->getError('id_kelas'); ?>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-12">
                  <label for="id_matpel">Mata Pelajaran</label>
                  <select class="custom-select <?= $validation->getError('id_matpel') ? 'is-invalid' : ''; ?>" id="id_matpel" name="id_matpel">
                    <option value="">--Mata Pelajaran-</option>
                    <?php foreach ($matpel as $value) : ?>
                      <option value="<?= $value['id_matpel']; ?>" <?= old('id_matpel') ?? $oldInput['id_matpel'] ?? '' == $value['id_matpel'] ? 'selected' : ''; ?>>
                        <?= $value['matpel']; ?>
                      </option>
                    <?php endforeach; ?>
                  </select>
                  <div class="invalid-feedback">
                    <?= $validation->getError('id_matpel'); ?>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-12">
                  <label for="id_matpel">Guru</label>
                  <select class="custom-select <?= $validation->getError('id_guru') ? 'is-invalid' : ''; ?>" id="id_guru" name="id_guru">
                    <option value="">--Guru-</option>
                    <?php foreach ($guru as $value) : ?>
                      <option value="<?= $value['id_guru']; ?>" <?= old('id_guru') ?? $oldInput['id_guru'] ?? '' == $value['id_guru'] ? 'selected' : ''; ?>>
                        <?= $value['nama_guru']; ?>
                      </option>
                    <?php endforeach; ?>
                  </select>
                  <div class="invalid-feedback">
                    <?= $validation->getError('id_guru'); ?>
                  </div>
                </div>
              </div>
              <div class="form-group mt-4">
                <input type="text" id="hari" class="form-control <?= $validation->getError('hari') ? 'is-invalid' : ''; ?>" name="hari" placeholder="Hari" , value="<?= old('Hari') ?? $oldInput['hari']  ?? '' ?>" required>
                <div class="invalid-feedback">
                  <?= $validation->getError('hari'); ?>
                </div>
              </div>
              <div class="form-group mt-4">
                  <label for="jam_mulai">Jam Mulai</label>
                  <input type="time" id="jam_mulai" class="form-control <?= $validation->getError('jam_mulai') ? 'is-invalid' : ''; ?>" name="jam_mulai" value="<?= old('jam_mulai') ?? $oldInput['jam_mulai'] ?? ''; ?>" required>
                  <div class="invalid-feedback">
                      <?= $validation->getError('jam_mulai'); ?>
                  </div>
              </div>
              <div class="form-group mt-4">
                <label for="jam_mulai">Jam Selesai</label>
                <input type="time" id="jam_selesai" class="form-control <?= $validation->getError('jam_selesai') ? 'is-invalid' : ''; ?>" name="jam_selesai" value="<?= old('jam_selesai') ?? $oldInput['jam_selesai'] ?? ''; ?>" required>
                <div class="invalid-feedback">
                    <?= $validation->getError('jam_selesai'); ?>
                </div>
              </div>
              <button type="submit" class="btn btn-primary mt-4">Simpan</button>
            </form>
            <hr>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<?= $this->endSection() ?>