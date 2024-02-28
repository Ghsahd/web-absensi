<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class JadwalModel extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'id_jadwal' => [
                'type'           => 'INT',
                'constraint'     => 11,
                'unsigned'       => true,
                'auto_increment' => true
            ],
            'id_kelas' => [
                'type'           => 'INT',
                'constraint'     => 11,
                'unsigned'       => true,
            ],
            'id_guru' => [
                'type'           => 'INT',
                'constraint'     => 11,
            ],
            'id_matpel' => [
                'type'           => 'INT',
                'constraint'     => 11,
                'unsigned'       => true,
            ],
            'hari' => [
                'type' => 'VARCHAR',
                'constraint' => '100',
            ],
            'jam_mulai' => [
                'type' => 'TIME',
            ],
            'jam_selesai' => [
                'type' => 'TIME'
            ],
            'created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL',
            'updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL',
            'deleted_at TIMESTAMP NULL',
        ]);

        // Primary key
        $this->forge->addKey('id_jadwal', true);
        

        $this->forge->addForeignKey('id_kelas', 'tb_kelas', 'id_kelas', 'CASCADE', 'NO ACTION');
        $this->forge->addForeignKey('id_guru', 'tb_guru', 'id_guru', 'CASCADE', 'NO ACTION');
        $this->forge->addForeignKey('id_matpel', 'tb_matpel', 'id_matpel', 'CASCADE', 'NO ACTION');

        // Create table
        $this->forge->createTable('tb_jadwal', true);

    }


    public function down()
    {
        $this->forge->dropColumn('tb_jadwal',TRUE);
    }
}
