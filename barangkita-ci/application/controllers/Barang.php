<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

    class Barang extends REST_Controller {

    function __construct($config = 'rest'){
        parent::__construct($config);
        $this->db->db_debug = FALSE;
    }

    function show_get($id_user){
        $barang = $this->db
            ->select("u.id_user, b.id_barang, b.barang, b.nama_barang, u.username")
            ->from('barang b')
            ->JOIN('users u', 'u.id_user = b.id_user')
            ->where('u.id_user', $id_user)
            ->get();

        if ($barang->num_rows() > 0) {
            $barang = $barang->result();

            foreach ($barang as $key => $value) {
                $value->barang = "http://localhost:8080/barangkita-ci/" . "images/" . $value->id_user ."/barang/".$value->barang;
            }
        }else{
            $barang = array();
        }

        $this->response($barang, 200);
    }

}
