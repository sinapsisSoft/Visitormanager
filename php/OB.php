<?php
   
   include("DaoBusiness.php");
   class OB_General{

    
    private $dtoBusiness;
    private $daoBusiness;
    private $result;
    
    function __construct(){

       $this->daoBusiness=new DaoBusiness();
       $this->dtoBusiness=new DtoBusiness();
    }
  
    function CreateBusiness($businessNit,$businessName,$businessAddress, $businessPhone,  $businessMail){
       $result=null;
       $this->dtoBusiness->businessMail=$businessMail;
       $this->dtoBusiness->businessPhone=$businessPhone;
       $this->dtoBusiness->businessAddress=$businessAddress;
       $this->dtoBusiness->businessName=$businessName;
       $this->dtoBusiness->businessNit=$businessNit; 

       $resutl=$this->daoBusiness->CreateBusiness($this->dtoBusiness);
        if($resutl==false){
            echo("Error");
        }else{
           
            echo("Insert OK");
        }
    }
    function SearchBusiness($businessNit,$typeSeach){
        $result=null;
        $result=$this->daoBusiness->SearchBusiness($businessNit,$typeSeach);
                       
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
$obj->CreateBusiness("80859867-8","Sinapsis Soft 2","Calle 102 # 35 -45","7800733","info@sinapsissoft2.com");
   
?>