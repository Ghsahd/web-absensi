<?php

namespace App\Controllers\Admin;

use App\Models\GuruModel;
use App\Models\JadwalModel;
use App\Models\KelasModel;
use App\Models\MatpelModel;
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\Exceptions\PageNotFoundException;

class JadwalController extends ResourceController
{
    protected $guruModel;
    protected $matpelModel;
    protected $kelasModel; 
    protected $jadwalModel;

    public function __construct()
    {
        $this->guruModel = new GuruModel();
        $this->jadwalModel = new JadwalModel();
        $this->kelasModel = new KelasModel();
        $this->matpelModel = new MatpelModel();
    }
    public function index()
    {
        $data = [
            'title' => 'Jadwal',
            'ctx' => 'jadwal',
        ];
        return view('admin/jadwal/index',$data);
    }

    public function show($id = null)
    {
        $result = $this->jadwalModel
            ->join('tb_kelas', 'tb_jadwal.id_kelas = tb_kelas.id_kelas', 'LEFT')
            ->join('tb_guru', 'tb_jadwal.id_guru = tb_guru.id_guru', 'LEFT')
            ->join('tb_matpel', 'tb_jadwal.id_matpel = tb_matpel.id_matpel', 'LEFT')
            ->join('tb_jurusan', 'tb_kelas.id_jurusan = tb_jurusan.id', 'LEFT')
            ->findAll();

        $data = [
            'data' => $result,
            'empty' => empty($result)
        ];

        return view('admin/jadwal/list_jadwal', $data);
    }

    public function new()
    {
        $guru = $this->guruModel->findAll();
        $kelas = $this->kelasModel
            ->join('tb_jurusan', 'tb_kelas.id_jurusan = tb_jurusan.id', 'LEFT')
            ->findAll();
        $matpel = $this->matpelModel->findAll();

        $data = [
            'ctx' => 'jadwal',
            'guru' => $guru,
            'kelas' => $kelas,
            'matpel' => $matpel,
            'title' => 'Tambah Jadwal',
        ];

        return view('/admin/jadwal/create',$data);
    }

    /**
     * Create a new resource object, from "posted" parameters
     *
     * @return mixed
     */
    public function create()
    {
        // Validasi data input
        $validationRules = [
            'id_kelas' => 'required|numeric',
            'id_matpel' => 'required|numeric',
            'id_guru' => 'required|numeric',
            'hari' => 'required|max_length[32]'
        ];
    
        if (!$this->validate($validationRules)) {
            $guru = $this->guruModel->findAll();
            $kelas = $this->kelasModel
                ->join('tb_jurusan', 'tb_kelas.id_jurusan = tb_jurusan.id', 'LEFT')
                ->findAll();
            $matpel = $this->matpelModel->findAll();
    
            $data = [
                'ctx' => 'jadwal',
                'guru' => $guru,
                'kelas' => $kelas,
                'matpel' => $matpel,
                'title' => 'Tambah Jadwal',
                'validation' => $this->validator,
                'oldInput' => $this->request->getVar()
            ];
            return view('/admin/jadwal/new', $data);
        }
    
        // Data valid, siapkan data untuk disimpan
        $dataPost = [
            'id_kelas' => $this->request->getVar('id_kelas'),
            'id_matpel' => $this->request->getVar('id_matpel'),
            'id_guru' => $this->request->getVar('id_guru'),
            'hari' => $this->request->getVar('hari'),
            'jam_mulai' => date('H:i', strtotime($this->request->getVar('jam_mulai'))),
            'jam_selesai' => date('H:i', strtotime($this->request->getVar('jam_selesai'))),
        ];
    
        // Simpan data
        $result = $this->jadwalModel->save($dataPost);
    
        if ($result) {
            session()->setFlashdata('msg', 'Tambah data berhasil');
            return redirect()->to('/admin/jadwal');
        }
    
        session()->setFlashdata('msg', 'Gagal menambah data');
        return redirect()->to('/admin/jadwal/new');
    }
    
    public function edit($id = null)
    {
        $jadwal = $this->jadwalModel->where(['id_jadwal' => $id])->first();

        if (!$jadwal) {
            throw new PageNotFoundException('Data kelas dengan id ' . $id . ' tidak ditemukan');
        }
        $guru = $this->guruModel->findAll();
        $kelas = $this->kelasModel
            ->join('tb_jurusan', 'tb_kelas.id_jurusan = tb_jurusan.id', 'LEFT')
            ->findAll();
        $matpel = $this->matpelModel->findAll(); 

        $data = [
            'ctx' => 'jadwal',
            'guru' => $guru,
            'kelas' => $kelas,
            'matpel' => $matpel,
            'jadwal' => $jadwal,
            'title' => 'Edit Jadwal',
            'validation' => $this->validator,
            'oldInput' => $this->request->getVar()
        ];

        return view('/admin/jadwal/edit', $data);
    }

    /**
     * Add or update a model resource, from "posted" properties
     *
     * @return mixed
     */
    public function update($id = null)
    {
        $validationRules = [
            'id_kelas' => 'required|numeric',
            'id_matpel' => 'required|numeric',
            'id_guru' => 'required|numeric',
            'hari' => 'required|max_length[32]'
        ];

        $jadwal = $this->jadwalModel->where(['id_jadwal' => $id])->first();
        if (!$this->validate($validationRules)) {
            $guru = $this->guruModel->findAll();
            $kelas = $this->kelasModel
                ->join('tb_jurusan', 'tb_kelas.id_jurusan = tb_jurusan.id', 'LEFT')
                ->findAll();
            $matpel = $this->matpelModel->findAll();

            if (!$kelas) {
                throw new PageNotFoundException('Data kelas dengan id ' . $id . ' tidak ditemukan');
            }
            $data = [
                'ctx' => 'jadwal',
                'guru' => $guru,
                'kelas' => $kelas,
                'matpel' => $matpel,
                'title' => 'Edit Jadwal',
                'validation' => $this->validator,
                'oldInput' => $this->request->getVar()
            ];
            return view('/admin/jadwal/edit', $data);
        }
    
        // Data valid, siapkan data untuk disimpan
        $dataPost = [
            'id_kelas' => $this->request->getVar('id_kelas'),
            'id_matpel' => $this->request->getVar('id_matpel'),
            'id_guru' => $this->request->getVar('id_guru'),
            'hari' => $this->request->getVar('hari'),
            'jam_mulai' => date('H:i', strtotime($this->request->getVar('jam_mulai'))),
            'jam_selesai' => date('H:i', strtotime($this->request->getVar('jam_selesai'))),
        ];
    
        $result = $this->jadwalModel->update($jadwal,$dataPost);
    
        if ($result) {
            session()->setFlashdata('msg', 'Edit berhasil');
            return redirect()->to('/admin/jadwal');
        }
    
        session()->setFlashdata('msg', 'Gagal menambah data');
        return redirect()->to('/admin/jadwal/new');
    }

    /**
     * Delete the designated resource object from the model
     *
     * @return mixed
     */
    public function delete($id = null)
    {
        $result = $this->jadwalModel->delete($id);

        if ($result) {
            session()->setFlashdata([
                'msg' => 'Data berhasil dihapus',
                'error' => false
            ]);
            return redirect()->to('/admin/jadwal');
        }

        session()->setFlashdata([
            'msg' => 'Gagal menghapus data',
            'error' => true
        ]);
        return redirect()->to('/admin/jadwal');
    }
}
