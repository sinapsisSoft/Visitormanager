<?php
   
   include("DaoUser.php");
   class OB_General{

    
    private $dtoUser;
    private $daoUser;
    private $result;
    
    function __construct(){

       $this->daoUser=new DaoUser();
       $this->dtoUser=new DtoUser();
    }
    function CreateUser($userMail,$userType, $userName, $useRsurname, $useRstate){
       $result=null;
       $this->dtoUser->SetUser($userMail,$userType, $userName, $useRsurname, $useRstate);
       
       $resutl=$this->daoUser->CreateUser($this->dtoUser);
        if($resutl==false){
            echo("Error");
        }else{
           
            echo("Insert OK");
        }
    }
    function SearchUser($userMail){
        $result=null;
        $resutl=$this->daoUser->SearchUser($userMail);
        if($resutl==false){
            echo("Error");
        }else{
            $row = $resutl->fetch_array(MYSQLI_ASSOC);
            echo($row["User_mail"]);
        }
     }
}

$obj=new OB_General(); 
$obj->CreateUser("dcasallas@gmail.com",1,"Felipe ","Casallas",1);

?>