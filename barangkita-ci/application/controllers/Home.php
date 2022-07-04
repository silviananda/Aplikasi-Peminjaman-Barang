<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

class Logo extends REST_Controller {

    function show_get($username){
        $Logo = $this->db->whereNot('username', $username)->get('username', 'logo')->row();
        $this->response($Logo, 200);
    }
}