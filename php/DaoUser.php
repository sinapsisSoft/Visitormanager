<?php
   include("connection.php"); 
   include("DtoUser.php"); 
    class DaoUser{

        private $con;
        private $result;
        private $daoUser;

        function __construct(){

            $objConnection= new Connecction();
            $daoUser=new DtoUser();
            $this->con=$objConnection->Connect();
            
        }

        function CreateUser($user){
            
            $result=null;
            
            if($this->con->connect_errno){
                echo("Error ");
            }else{
                echo("OK ");
              
                $result=$this->con->query("CALL CreateUser('".$user->GetUserMail()."',".$user->GetUserType().",'".$user->GetUserName()."','".$user->GetUserSurname()."',".$user->GetUserState().")");
                
                if(!$result){
                    
                     $result=false; 
                    
                }
                
            }
           
            $this->con->Close();
            return $result;

        }
        function SearchUser($mail){
            $result=null;
            
            if($this->con->connect_errno){
                echo("Error ");
            }else{
                echo("OK ");
                $result=$this->con->query("CALL SearchUser('".$mail."')");
                if(!$result){
                    
                     $result=false; 
                    
                }
            }
           
            $this->con->Close();
            return $result;
        }

        

        

    }

?>