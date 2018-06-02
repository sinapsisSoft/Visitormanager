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

        function CreateUser($Objuser){
            
            $result=null;
            
            if($this->con->connect_errno){
                echo("Error ");
            }else{
                echo("OK ");
                //$result=$this->con->query("CALL CreateUser('".$Objuser->userMail."',".$Objuser->userType.",'".$Objuser->userName."','".$Objuser->userSurname."',".$Objuser->userState.")");
                echo($Objuser->userMail.",".$Objuser->userType.",".$Objuser->userName.",".$Objuser->userSurname.",".$Objuser->userState);
               
                //$result=$this->con->query("CALL CreateUser('".$user->GetUserMail()."',".$user->GetUserType().",'".$user->GetUserName()."','".$user->GetUserSurname()."',".$user->GetUserState().")");
                
                if(!$result){
                    
                     $result=false; 
                    
                }
                
            }
           
            $this->con->Close();
            return $result;

        }
        function SearchUser($userData,$typeSearch){
            $result=null;
            $array=array();             
            $obj=new DtoUser();
            if($this->con->connect_errno){
                echo("Error ");
            }else{
                //echo("OK ");
                $result=$this->con->query("CALL SearchUser('".$userData."',".$typeSearch.")");
                if(!$result){
                     $result=false;         
                }
               else{
                $cont=0; 
                while($row = $result->fetch_assoc()){

                    $obj->userMail=$row["User_mail"];
                    $obj->userType=$row["User_type"];
                    $obj->userName=$row["User_name"];
                    $obj->userSurname=$row["User_surname"];
                    $obj->userState=$row["User_state"]; 
                    $obj->userId=$row["User_id"]; 
                    $array[$cont]=$obj;            
                    $cont++;
    
                }
                     
                $cont=0;
                $result=json_encode($array);
               
               }
           
            }
           
            $this->con->Close();
            //echo($result); 
            return $result;
        }

        

        

    }

?>