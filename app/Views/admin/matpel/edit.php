<?= $this->extend('templates/admin_page_layout') ?>
<?= $this->section('content') ?>
<div class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-lg-12 col-md-12">
        <div class="card">
          <div class="card-header card-header-primary">
            <h4 class="card-title"><b>Edit Mata Pelajaran</b></h4>
          </div>
          <div class="card-body mx-5 my-3">

            <form action="<?= base_url('admin/matpel/' . $data['id_matpel']); ?>" method="post">
              <input type="hidden" name="_method" value="PATCH">
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

              <div class="form-group mt-4">
                <label for="matpel">Mata Pelajaran</label>
                <input type="text" id="matpel" class="form-control <?= $validation->getError('matpel') ? 'is-invalid' : ''; ?>" name="matpel" placeholder="" value="<?= old('matpel') ?? $oldInput['matpel'] ?? $data['matpel'] ?>">
                <div class="invalid-feedback">
                  <?= $validation->getError('matpel'); ?>
                </div>
              </div>
              <button type="submit" class="btn btn-primary mt-4">Update</button>
            </form>
            <hr>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<?= $this->endSection() ?>