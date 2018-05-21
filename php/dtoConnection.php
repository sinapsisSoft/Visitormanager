<?php
  
  class DtoConnection{

    private $server="";
    private $user="";
    private $password="";
    private $dataBase="";
    
    function __construct(){
         $this->server="127.1.1.0";
         $this->user="root";
         $this->password="";
         $this->dataBase="visitormanager";
    }
    public function getServer()
    {
        return $this->server;
    }
    public function getUser()
    {
        return $this->user;
    }
    public function getPassword()
    {
        return $this->password;
    }
    public function getDataBase()
    {
        return $this->dataBase;
    }

    
    }
  
?>