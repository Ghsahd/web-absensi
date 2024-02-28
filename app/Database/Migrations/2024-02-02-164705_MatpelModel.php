<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class MatpelModel extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'id_matpel' => [
                'type'           => 'INT',
                'constraint'     => 11,
                'unsigned'       => true,
                'auto_increment' => true
            ],
            'matpel' => [
                'type' => 'VARCHAR',
                'constraint' => 100,
            ],
            'created_at' => [
                'type' => 'TIMESTAMP',
                'null' => true,
            ],
            'updated_at' => [
                'type' => 'TIMESTAMP',
                'null' => true,
            ],
            'deleted_at' => [
                'type' => 'TIMESTAMP',
                'null' => true,
            ],
        ]);

        $this->forge->addKey('id_matpel', true);
        $this->forge->createTable('tb_matpel', true);

    }

    public function down()
    {
        $this->forge->dropColumn('tb_matpel',TRUE);
    }
}
