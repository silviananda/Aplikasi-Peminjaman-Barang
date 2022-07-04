<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

    class Profil extends REST_Controller {

    function __construct($config = 'rest'){
        parent::__construct($config);
        $this->db->db_debug = FALSE;
    }

    function show_get($token){
        $profil = $this->db
            ->select("u.id_user, u.username, u.logo")
            ->from('users u')
            ->join('token t', 't.id_user = u.id_user', "left")
            ->where('t.token', $token)
            ->get();

        if ($profil->num_rows() > 0) {
            $profil = $profil->result();

            foreach ($profil as $key => $value) {
                $value->profil = "http://localhost:8080/barangkita-ci/" . "images/" . $value->id_user ."/logo/".$value->logo;
            }
        }else{
            $profil = array();
        }

        $this->response($profil, 200);
    }

}
