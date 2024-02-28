<?php

namespace App\Controllers\Admin;

use App\Models\MatpelModel;
use App\Controllers\Admin\JadwalController;
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\Exceptions\PageNotFoundException;

class MatpelController extends ResourceController
{
    
    protected $matpelModel;

    public function __construct()
    {
        $this->matpelModel = new MatpelModel();
    }
    public function index()
    {
        $matpelController = new JadwalController();
        return $matpelController->index();
    }

    /**
     * Return the properties of a resource object
     *
     * @return mixed
     */
    public function show($id = null)
    {
        $result = $this->matpelModel->findAll();
        $data = [
            'data' => $result,
            'empty' => empty($result)
        ];

        return view('admin/matpel/list_matpel', $data);
    }

    /**
     * Return a new resource object, with default properties
     *
     * @return mixed
     */
    public function new()
    {
        $data = [
            'ctx' => 'jadwal',
            'title' => 'Tambah Mata Pelajaran',
        ];
        return view('/admin/matpel/create', $data);
    }

    /**
     * Create a new resource object, from "posted" parameters
     *
     * @return mixed
     */
    public function create()
    {
        if (!$this->validate([
            'matpel' => [
                'rules' => 'required|max_length[32]|is_unique[tb_matpel.matpel]',
            ],
        ])) {
            $data = [
                'ctx' => 'jadwal',
                'title' => 'Tambah Mata Pelajaran',
                'validation' => $this->validator,
                'oldInput' => $this->request->getVar()
            ];
            return view('/admin/matpel/new', $data);
        }

        // ambil variabel POST
        $jurusan = $this->request->getVar('matpel');

        $result = $this->matpelModel->insert(['matpel' => $jurusan]);

        if ($result) {
            session()->setFlashdata([
                'msg' => 'Tambah data berhasil',
                'error' => false
            ]);
            return redirect()->to('/admin/matpel');
        }

        session()->setFlashdata([
            'msg' => 'Gagal menambah data',
            'error' => true
        ]);
        return redirect()->to('/admin/matpel/new');
    }

    /**
     * Return the editable properties of a resource object
     *
     * @return mixed
     */
    public function edit($id = null)
    {
        $matpel = $this->matpelModel->where(['id_matpel' => $id])->first();

        if (!$matpel) {
            throw new PageNotFoundException('Data jurusan dengan id ' . $id . ' tidak ditemukan');
        }

        $data = [
            'ctx' => 'jadwal',
            'data' => $matpel,
            'title' => 'Edit Mata Pelajaran',
        ];
        return view('/admin/matpel/edit', $data);
    }

    /**
     * Add or update a model resource, from "posted" properties
     *
     * @return mixed
     */
    public function update($id = null)
    {
        $matpel = $this->matpelModel->where(['id_matpel' => $id])->first();

        // ambil variabel POST
        $namaMatpel = $this->request->getRawInputVar('matpel');

        if ($matpel['matpel'] != $namaMatpel && !$this->validate([
            'matpel' => [
                'rules' => 'required|max_length[32]|is_unique[tb_matpel.matpel]',
            ],
        ])) {
            if (!$matpel) {
                throw new PageNotFoundException('Data jurusan dengan id ' . $id . ' tidak ditemukan');
            }

            $data = [
                'ctx' => 'jadwal',
                'title' => 'Edit Jurusan',
                'data' => $matpel,
                'validation' => $this->validator,
                'oldInput' => $this->request->getRawInput()
            ];
            return view('/admin/matpel/edit', $data);
        }

        $result = $this->matpelModel->update($id, [
            'matpel' => $namaMatpel
        ]);

        if ($result) {
            session()->setFlashdata([
                'msg' => 'Edit data berhasil',
                'error' => false
            ]);
            return redirect()->to('/admin/matpel');
        }

        session()->setFlashdata([
            'msg' => 'Gagal mengubah data',
            'error' => true
        ]);
        return redirect()->to('/admin/matpel/' . $id . '/edit');
    }

    /**
     * Delete the designated resource object from the model
     *
     * @return mixed
     */
    public function delete($id = null)
    {
        $result = $this->matpelModel->delete($id);

        if ($result) {
            session()->setFlashdata([
                'msg' => 'Data berhasil dihapus',
                'error' => false
            ]);
            return redirect()->to('/admin/matpel');
        }

        session()->setFlashdata([
            'msg' => 'Gagal menghapus data',
            'error' => true
        ]);
        return redirect()->to('/admin/matpel');
    }
}
