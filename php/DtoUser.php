<?php
    class DtoUser{

        public $userMail;
        public $userType;
        public $userName;
        public $userSurname;
        public $userState;
        public $userId;
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
       public function SetUserId($id)
       {
            $this->userId=$id;
          
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