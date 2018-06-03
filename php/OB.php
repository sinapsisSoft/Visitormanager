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

     function UpdateUserState($userId){
        $result=null;
        $this->dtoUser->userId=$userId;

        $result=$this->daoUser->UpdateUserState($this->dtoUser);
                       
        if($result==false){
            echo("Error");
        }
        return $result;
     }
     function UpdateUser($userId,$userType, $userName, $useRsurname, $userState){
        $result=null;
        $this->dtoUser->userId=$userId;
        $this->dtoUser->userType=$userType;
        $this->dtoUser->userName=$userName;
        $this->dtoUser->userSurname=$useRsurname;
        $this->dtoUser->userState=$userState; 
       
        
        $resutl=$this->daoUser->UpdateUser($this->dtoUser);
         if($resutl==false){
             echo("Error");
         }else{
            
             echo("Update OK");
         }
     }
}

$obj=new OB_General(); 
//$obj->UpdateUser("1","2","Diego ","Casallas Vanegas","2");
//$result=$obj->UpdateUserState('3');
//echo($result);

?>