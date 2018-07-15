<?php
/*
Autor:DIEGO CASALLAS
Description:This class is for the administrator of the search operation, update, insertion, deletion, of the visitor
handler application
Date: 09/07/2018
 */
include "connection.php";
class ObjectBusiness
{
    private $con;
    private $result;

    public function __construct()
    {
        $ObjConnection = new Connecction();
        $this->con = $ObjConnection->Connect();

    }
    //Fuction Search User
    public function SearchUser($mail, $state)
    {
        try
        {
            $query = $this->con->query("CALL Search_user('" . $mail . "'," . $state . ")");
            if (!$query) {
                $result = false;
            } else {
                $data = array();
                /*$rows = $result->num_rows;
                for ($j = 0; $j < $rows; ++$j){
                $result->data_seek($j);
                $row = $result->fetch_array(MYSQLI_ASSOC);

                echo 'Folio: '.$row['id'].'<br>';
                echo 'Nombre alumno: '.$row['nombre'].'<br>';
                echo 'Correo: '.$row['correo'].'<br>';
                echo 'Telefono: '.$row['telefono'].'<br>';
                echo "-----------------<br><br>";

                }*/
                while ($row = $query->fetch_assoc()) {
                    //$data[] = json_encode($row);
                    $data[] =$row;
                }
                $result = $data;
                //echo(json_encode($data));
            }

        } catch (Exception $e) {
            echo 'Excepción capturada:', $e->getMessage(), "\n";
        } finally {
            $query->Close();
            $this->con->Close();
        }
        return $result;
    }
    //End Fuction
    //Fuction Search User
    public function Log_user($mail, $state)
    {
        try
        {
            $query = $this->con->query("CALL Search_user('" . $mail . "'," . $state . ")");
            if (!$query) {
                $result = false;
            } else {
                $data = array();
                while ($row = $query->fetch_assoc()) {
                    $data[] = json_encode($row);
                }
                echo (json_encode($data));
            }

        } catch (Exception $e) {
            echo 'Excepción capturada:', $e->getMessage(), "\n";
        } finally {
            $query->Close();
            $this->con->Close();
        }
        return $result;
    }
    //End Fuction
}
