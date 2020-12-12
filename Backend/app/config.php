<?php


/*******************************
 * 
 *  Developer : Ajay randhawa
 *  Email : ajayrandhawartg@gmail.com
 *  
 *  Please don't share this script on nulled websites 
 *  Buy from Envato & appreciate Developer
 * 
 * ******************************/

 
//ob_start("ob_gzhandler");
error_reporting(0);
session_start();

/* DATABASE CONFIGURATION */
define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_DATABASE', 'onlinegrocerystore');
define("BASE_URL", "http://localhost/onlinegrocerystore/app/");
define("SITE_TOKEN", 'authdemo');


function getDB() 
{
	$dbhost=DB_SERVER;
	$dbuser=DB_USERNAME;
	$dbpass=DB_PASSWORD;
	$dbname=DB_DATABASE;
	$dbConnection = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);	
	$dbConnection->exec("set names utf8");
	$dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	return $dbConnection;
}
/* DATABASE CONFIGURATION END */
?>