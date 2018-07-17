<?php

// include the main file
include("Slim/Slim.php");
//include("php/OB.php");


// register the slim instance
\Slim\Slim::registerAutoloader();
//application 
$app = new \Slim\Slim();

//
$app->get('/',function() use ($app){
    	
    	//consultas a la base de datos 
    	// peticiones a otro rest 
    	// etcetera
    	$datos = array(
    					"nombre" => "pepe", 
    					"edad" => "23"
    					);

    	//json 
        echo json_encode($datos);
    }
)->setParams(array($app));

$app->get('/user/get_user',function() use ($app){
		//$userMail = $app->request()->params('paramName');
		$userMail = $app->request()->get('User_mail');
    	//almaceno el ID
    	//conexion con base de datos
    	//el proceso
		// retorno un JSON
		
		//$OBJ=new ObjectBusiness();
		//$datos=$OBJ->SearchUser($userMail,1);
		echo json_encode($userMail);
		
        
    }
);
$app->get('/business/get_business',function() use ($app){
	
	$business_nit = $app->request()->get('Business_nit');
	
	//$OBJ=new Obje	ctBusiness();
	//$datos=$OBJ->SearchUser($userMail,1);
	echo json_encode($business_nit);	
}
);



//inicializamos la aplicacion(API)
$app->run();

