<?php
   /*
      Autor:DIEGO CASALLAS
      Description:This class is for the administrator of the connection data
      Date: 09/07/2018
    */
  class DtoConnection{

    private $server="";
    private $user="";
    private $password="";
    private $dataBase="";
    
    function __construct(){
         $this->server="72.29.73.187";
         $this->user="tecnipalma_ApiTecnipalma";
         $this->password="Tecnipalama2018*";
         $this->dataBase="tecnipalma_Visitor_Test";
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