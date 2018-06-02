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
       $this->dtoUser->userMail=$userMail;
       $this->dtoUser->userType=$userType;
       $this->dtoUser->userName=$userName;
       $this->dtoUser->userSurname=$useRsurname;
       $this->dtoUser->userState=$useRstate; 
      
       
       $resutl=$this->daoUser->CreateUser($this->dtoUser);
        if($resutl==false){
            echo("Error");
        }else{
           
            echo("Insert OK");
        }
    }
    function SearchUser($userData,$typeSeach){
        $result=null;
        $result=$this->daoUser->SearchUser($userData,$typeSeach);
                       
        if($result==false){
            echo("Error");
        }
        return $result;
     }
}

$obj=new OB_General(); 
$obj->CreateUser("diehei@gmail.com","2","Diego","Casallas","1");
//$result=$obj->SearchUser("diehercasvan@outlook.com",1);
//echo($result);

?>