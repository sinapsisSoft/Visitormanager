<?php
    class DtoBusiness{

        public $businessMail;
        public $businessPhone;
        public $businessAddress;
        public $businessName;
        public $businessNit;
        public $businessId;
        
       public function GetBusinessMail()
       {
           return $this->businessMail;
       }
       public function GetBusinessPhone()
       {
           return $this->businessPhone;
       }
       public function GetBusinessAddress()
       {
           return $this->businessAddress;
       }
       public function GetBusinessName()
       {
           return $this->businessName;
       }
       public function GetBusinessNit()
       {
           return $this->businessNit;
       }
       public function GetBusinessId()
       {
        return $this->businessId;
          
       }
       public function SetBusinessMail($mail)
       {
            $this->businessMail=$mail;
          
       }
       public function SetBusinessPhone($phone)
       {
            $this->businessPhone=$type;

       }
       public function SetBusinessAddress($address)
       {
            $this->businessAddress=$address;

       }
       public function SetBusinessName($name)
       {
            $this->businessName=$name;

       }
       public function SetBusinessNit($nit)
       {
            $this->businessNit=$nit;
       }
       public function SetBusinessId($id)
       {
            $this->businessId=$id;
       }

    } 
    
?>