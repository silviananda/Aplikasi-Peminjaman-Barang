<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

class SignIn extends REST_Controller {

    function __construct($config = 'rest'){
        parent::__construct($config);
        $this->db->db_debug = FALSE;

    }

    function index_post(){
        $username = $this->post('username');
        $password = $this->post('password');

        if (($username !="")  && ($password != "")) {
            $loginForm = array( //harus sesuai db
                'username =' =>$username,
                'password =' => hash('sha256', $password),
            );
           $result = $this->db->get_where('users', $loginForm);

           if ($result->num_rows()>0){ //cek user ada/engga di db
                $id_user = $result->row()->id_user;
                $token = hash('sha256', $username.$password);
                $token_insert = array(
                    'token' => $token,
                    'id_user' => $id_user,
                );
                $this->db->insert('token', $token_insert);
                $response = array(
                    'status' => 'sukses', 
                    'token'  => $token,
                
                );
                $this->response($response, 200);
           } 
           else{
            $this->response(array('status' => 'login gagal'), 502);
           }
        

        } else {
            $this->response(array('status' => 'fail'), 502);
        }
    }

}
