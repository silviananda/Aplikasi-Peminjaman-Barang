<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

class Logo extends REST_Controller {

	function __construct($config = 'rest'){
        parent::__construct($config);
        $this->db->db_debug = FALSE;
    }

    function show_get($token){
        $logo = $this->db
        	->select("u.id_user, u.username, u.logo")
        	->from('users u')
        	->join('token t', 't.id_user = u.id_user', "left")
        	->where('t.token !=', $token)
        	->or_where('t.token is null')
        	->get();

        if ($logo->num_rows() > 0) {
        	$logo = $logo->result();

        	foreach ($logo as $key => $value) {
	        	$value->logo = "http://localhost:8080/barangkita-ci/" . "images/" . $value->id_user ."/logo/".$value->logo;
	        }
        }else{
        	$logo = array();
        }

        $this->response($logo, 200);
    }
}