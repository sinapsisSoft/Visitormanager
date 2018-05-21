<?php
    class DtoUser{

        private $userMail;
        private $userType;
        private $userName;
        private $userSurname;
        private $userState;
      
        public function SetUser($mail,$type,$name,$surname,$state){
            $this->userMail=$mail;
            $this->userType=$type;
            $this->userName=$name;
            $this->userSurname=$surname;
            $this->userState=$state;
            
       }
       public function GetUserMail()
       {
           return $this->userMail;
       }
       public function GetUserType()
       {
           return $this->userType;
       }
       public function GetUserName()
       {
           return $this->userName;
       }
       public function GetUserSurname()
       {
           return $this->userSurname;
       }
       public function GetUserState()
       {
           return $this->userState;
       }

       public function SetUserMail($mail)
       {
            $this->userMail=$mail;
          
       }
       public function SetUserType($type)
       {
            $this->userType=$type;

       }
       public function SetUserName($name)
       {
            $this->userName=$name;

       }
       public function SetUserSurname($surname)
       {
            $this->userSurname=$surname;

       }
       public function SetUserState($state)
       {
            $this->userState=$state;
       }

    } 
    
?>