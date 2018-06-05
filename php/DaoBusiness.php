<?php
   include("connection.php"); 
   include("DtoBusiness.php"); 
    class DaoBusiness{

        private $con;
        private $result;
        private $dtoBusiness;

        function __construct(){

            $objConnection= new Connecction();
            $dtoBusiness=new DtoBusiness();
            $this->con=$objConnection->Connect();
            
        }

        function CreateBusiness($ObjBusiness){
          
            $result=null;
            
            if($this->con->connect_errno){
                echo("Error ");
            }else{
                echo("OK ");
                
                $result=$this->con->query("CALL CreateBusiness('".$ObjBusiness->businessNit."','".$ObjBusiness->businessName."','".$ObjBusiness->businessAddress."','".$ObjBusiness->businessPhone."','".$ObjBusiness->businessMail."')");
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
            
            return $result;
        }

        function UpdateUserState($Objuser){
            
            
            $result=null;
            
            if($this->con->connect_errno){
                echo("Error ");
            }else{
                echo("OK ");
                $result=$this->con->query("CALL UpdateStateUser('".$Objuser->userId."')");
                if(!$result){
                    
                     $result=false; 
                    
                }
                
            }
           
            $this->con->Close();
            return $result;

        }
        function UpdateUser($Objuser){
            
            $result=null;
            $query=null;
            if($this->con->connect_errno){
                echo("Error ");
            }else{
                if($Objuser->userType!=""&& $Objuser->userName!="" && $Objuser->userSurname!="" && $Objuser->userState!="")
                {
                    $query="UPDATE user SET User_type=".$Objuser->userType.",User_name='".$Objuser->userName."',User_surname='".$Objuser->userSurname."',User_state=".$Objuser->userState." WHERE User_id=".$Objuser->userId;
                   
                }
                
                $result=$this->con->query($query);
                
                if(!$result){
                    
                     $result=false; 
                    
                }
                
            }
           
            $this->con->Close();
            return $result;

        }
    }

?>

