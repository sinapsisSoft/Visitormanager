<?php
     /*
      Autor:DIEGO CASALLAS
      Description:This class is for the administrator of the connection
      Date: 09/07/2018
    */
    require('dtoConnection.php');
   class Connecction{

     private $DTOConnection=null;
     private $server="";
     private $user="";
     private $password="";
     private $dataBase="";
     private $con;
     
     function __construct(){
          $dtoConnection=new DtoConnection();
          $this->server=$dtoConnection->getServer();
          $this->user=$dtoConnection->getUser();
          $this->password=$dtoConnection->getPassword();
          $this->dataBase=$dtoConnection->getDataBase();
     }

     function Connect(){
        
        $con=new mysqli($this->server,$this->user,$this->password,$this->dataBase);
        if ($con->connect_error) {
          die('Error de conexión: ' . $con->connect_error);
      }
        return $con;
     }
     function Close(){

        $con->close();
        
     }

   }
   $obj=new Connecction();
   $obj->Connect();
   
  

?>