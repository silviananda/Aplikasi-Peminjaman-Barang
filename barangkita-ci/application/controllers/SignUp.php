<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

class SignUp extends REST_Controller {

    function __construct($config = 'rest'){
        parent::__construct($config);
        $this->db->db_debug = FALSE;

    }

    function index_post(){
        $email = $this->post('email');
        $username = $this->post('username');
        $password = $this->post('password');
        if (($email !="") && ($username !="")  && ($password != "")) {
            $insertData = array( //harus sesuai db
                'email' =>$email,
                'name' =>$username,
                'password' => hash('sha256', $password),
            );
            $insert = $this->db->insert('users', $insertData);
            if ($insert) {
                $this->response(array('status' => 'success'), 200);
            }
            else {
                $this->response(array('status' => 'fail'), 502);
            }
        } else {
            $this->response(array('status' => 'fail'), 502);
        }
    }
}
