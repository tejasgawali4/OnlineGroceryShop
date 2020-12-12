<?php
require 'config.php';
require 'Slim/Slim.php';

\Slim\Slim::registerAutoloader();
$app = new \Slim\Slim();

$app->post('/login','login');
$app->post('/register','register');
$app->post('/gethomepage','gethomepage');
$app->post('/getcategory','getcategory');
$app->post('/categoryfilter','categoryfilter');
$app->post('/placeorder','placeorder');
$app->post('/getnotification','getnotification');
$app->post('/fetchorder','fetchorder');
$app->post('/fetchorderdetail','fetchorderdetail');
$app->post('/sendmessage','sendmessage');
$app->post('/sendfeedback','sendfeedback');
$app->post('/searchproduct','searchproduct');
$app->post('/offers','offers');
$app->post('/getshipping','getshipping');
$app->post('/gettoken','gettoken');
$app->post('/getauth','getauth');
$app->post('/getauthstore','getauthstore');
$app->post('/getmyorders','getmyorders');
$app->post('/getmyordersstore','getmyordersstore');
$app->post('/getdetails','getdetails');
$app->post('/getdetailsorders','getdetailsorders');
$app->post('/updateorderstatus','updateorderstatus');
$app->post('/updateorderstatusstore','updateorderstatusstore');
$app->post('/getarea','getarea');
$app->post('/getmatch','getmatch');
$app->post('/fetchimages','fetchimages');
$app->run();

function register() {
    
    $request = \Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody());
    
    try {
        
        $db = getDB();
        $userData ='';
        $sql = "INSERT INTO users(fname, email, mobile, password, address)VALUES(:fname,:email,:mobile, :password, :address)";
        $stmt = $db->prepare($sql);
        $stmt->bindParam("fname", $data->name,PDO::PARAM_STR);
        $stmt->bindParam("email", $data->email,PDO::PARAM_STR);
        $stmt->bindParam("mobile", $data->mobile,PDO::PARAM_STR);
        $stmt->bindParam("password", $data->password,PDO::PARAM_STR);
        $stmt->bindParam("address", $data->address,PDO::PARAM_STR);
        $stmt->execute();
         if($lastid = $db->lastInsertId()){
            
            $db = getDB();
            $userData ='';
            $sql = "SELECT user_id,fname,email,mobile,address FROM users WHERE user_id=:userid";
            $stmt = $db->prepare($sql);
            $stmt->bindParam("userid", $lastid, PDO::PARAM_STR);
            $stmt->execute();
            $mainCount=$stmt->rowCount();
            $userData = $stmt->fetch(PDO::FETCH_OBJ);
            
            if(!empty($userData))
            {
                $user_id=$userData->user_id;
                $userData->token = apiToken($user_id);
            }
            
            $db = null;
             if($userData){
                   $userData = json_encode($userData);
                    echo '{"userData": ' .$userData . '}';
                } else {
                   echo '{"error":{"text":"Bad request"}}';
                }


            } else {
               echo '{"error":{"text":"Bad request"}}';
            }

           
    }
    catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }
}



function login() {
    
    $request = \Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody());
    
    try {
        
        $db = getDB();
        $userData ='';
        $sql = "SELECT user_id,fname,email,mobile,address FROM users WHERE mobile=:mobile and password=:password ";
        $stmt = $db->prepare($sql);
        $stmt->bindParam("mobile", $data->mobile, PDO::PARAM_STR);
        $stmt->bindParam("password", $data->password, PDO::PARAM_STR);
        $stmt->execute();
        $mainCount=$stmt->rowCount();
        $userData = $stmt->fetch(PDO::FETCH_OBJ);
        
        if(!empty($userData))
        {
            $user_id=$userData->user_id;
            $userData->token = apiToken($user_id);
        }
        
        $db = null;
         if($userData){
               $userData = json_encode($userData);
                echo '{"userData": ' .$userData . '}';
            } else {
               echo '{"error":{"text":"Bad request"}}';
            }

           
    }
    catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }
}


function gethomepage(){

    $request = \Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody());
    $token=$data->token;
    $systemToken=apiToken();
    $homepage = "YES";
    
    try {
        if($token == $systemToken){
            $db = getDB();
            $sqlhome = "SELECT * FROM items WHERE homepage = :homepage ORDER BY rand()";
            $stmthome = $db->prepare($sqlhome);
            $stmthome->bindParam("homepage",$homepage, PDO::PARAM_STR);
            $stmthome->execute();
            $tempData = $stmthome->rowCount();
            $homeData = $stmthome->fetchAll(PDO::FETCH_OBJ);

            $sqlcate = "SELECT * FROM category";
            $stmtCate = $db->prepare($sqlcate);
            $stmtCate->execute();
            $catetempData = $stmtCate->rowCount();
            $CateData = $stmtCate->fetchAll(PDO::FETCH_OBJ);
            
            $sqlbanner = "SELECT * FROM banner ORDER BY rand()";
            $stmtbanner = $db->prepare($sqlbanner);
            $stmtbanner->execute();
            $bannertempData = $stmtbanner->rowCount();
            $bannerData = $stmtbanner->fetchAll(PDO::FETCH_OBJ);
            
            $db = null;

            echo '{
                "HomeData": '. json_encode($homeData) .' ,
                "CateData": '. json_encode($CateData) .' ,
                "BannData": '. json_encode($bannerData) .' 
            }';
                }
            else{
                echo '{"Error":"Error"}'; 
        }
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    } 
}

function getcategory(){

    $request = \Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody());
    $token=$data->token;
    $systemToken=apiToken();
    
    try {
        if($token == $systemToken){
            $db = getDB();
            $sqlhome = "SELECT * FROM category";
            $stmthome = $db->prepare($sqlhome);
            $stmthome->execute();
            $Data = $stmthome->fetchAll(PDO::FETCH_OBJ);
            $db = null;
            echo '{"Data": ' . json_encode($Data) . '}';
            }
            else{
                echo '{"Error":"Error"}'; 
        }
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    } 

}


function getnotification(){

    $request = \Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody());
    $token=$data->token;
    $systemToken=apiToken();
    
    try {
        if($token == $systemToken){
            $db = getDB();
            $sqlhome = "SELECT * FROM notification ORDER BY id DESC";
            $stmthome = $db->prepare($sqlhome);
            $stmthome->execute();
            $NotiData = $stmthome->fetchAll(PDO::FETCH_OBJ);
            $db = null;
            echo '{"NotiData": ' . json_encode($NotiData) . '}';
            }
            else{
                echo '{"Error":"Error"}'; 
        }
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    } 

}


function fetchorder(){

    $request = \Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody());
    $token=$data->token;
    $userid=$data->user_id;
    $systemToken=apiToken();
    
    try {
        if($token == $systemToken){
            $db = getDB();
            $sqlorder = "SELECT orderid, user_id, fname, mobile, city, area, address ,status, total, shipping, paymenttype, payid, coupon, couponprice, lat, lng, dtype, dcode, driverid, dname, dmobile, ordertime FROM orders LEFT JOIN deliveryboy on orders.driverid = deliveryboy.id where orders.user_id = :userid ORDER BY orderid DESC";
            $stmtOrder = $db->prepare($sqlorder);
            $stmtOrder->bindParam("userid",$userid, PDO::PARAM_STR);
            $stmtOrder->execute();
            $OrderData = $stmtOrder->fetchAll(PDO::FETCH_OBJ);
            $db = null;
            echo '{"OrderData": ' . json_encode($OrderData) . '}';
            }
            else{
                echo '{"Error":"Error"}'; 
        }
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    } 

}

function fetchorderdetail(){

    $request = \Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody());
    $token=$data->token;
    $orderid=$data->orderid;
    $systemToken=apiToken();
    
    try {
        if($token == $systemToken){
            $db = getDB();
            $sqlorder = "SELECT * FROM orderslist WHERE orderid = :orderid";
            $stmtOrder = $db->prepare($sqlorder);
            $stmtOrder->bindParam("orderid",$orderid, PDO::PARAM_STR);
            $stmtOrder->execute();
            $OrderDetail = $stmtOrder->fetchAll(PDO::FETCH_OBJ);
            $db = null;
            echo '{"OrderDetail": ' . json_encode($OrderDetail) . '}';
            }
            else{
                echo '{"Error":"Error"}'; 
        }
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    } 

}

function categoryfilter(){

    $request = \Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody());
    $token=$data->token;
    $category=$data->category;
    $systemToken=apiToken();
    
    try {
        if($token == $systemToken){
            $db = getDB();
            $sqlhome = "SELECT * FROM items where category = :category";
            $stmthome = $db->prepare($sqlhome);
            $stmthome->bindParam("category",$category, PDO::PARAM_STR);
            $stmthome->execute();
            $tempData = $stmthome->rowCount();
            $homeData = $stmthome->fetchAll(PDO::FETCH_OBJ);
            $db = null;
            echo '{"CateFilterData": ' . json_encode($homeData) . '}';
            }
            else{
                echo '{"Error":"Error"}'; 
        }
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    } 

}

function offers(){

    $request = \Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody());
    $token=$data->token;
    $systemToken=apiToken();
    $offers = "YES";
    
    try {
        if($token == $systemToken){
            $db = getDB();
            $sqlhome = "SELECT * FROM items where offer = :offers";
            $stmthome = $db->prepare($sqlhome);
            $stmthome->bindParam("offers",$offers, PDO::PARAM_STR);
            $stmthome->execute();
            $tempData = $stmthome->rowCount();
            $homeData = $stmthome->fetchAll(PDO::FETCH_OBJ);
            $db = null;
            echo '{"offersData": ' . json_encode($homeData) . '}';
            }
            else{
                echo '{"Error":"Error"}'; 
        }
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    } 

}

function searchproduct(){

    $request = \Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody());
    $token=$data->token;
    $search=$data->squery;
    $systemToken=apiToken();
    
    try {
        if($token == $systemToken){
            $db = getDB();
            $sqlsearch = "SELECT * FROM items Where name like ?";
            $params = array("%$search%");
            $stmtsearch = $db->prepare($sqlsearch);
            $stmtsearch->execute($params);
            $tempData = $stmtsearch->rowCount();
            $searchData = $stmtsearch->fetchAll(PDO::FETCH_OBJ);
            $db = null;
            echo '{"SearchData": ' . json_encode($searchData) . '}';
            }
            else{
                echo '{"Error":"Error"}'; 
        }
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    } 

}

function placeorder() {
    $request = \Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody());

    $token=$data->token;
    $user_id=$data->user_id;
    $fname=$data->fname;
    $city=$data->city; 
    $area=$data->area; 
    $mobile=$data->mobile;
    $address=$data->address;
    $coupon=$data->coupon;
    $couponprice=$data->couponprice;
    $paytype=$data->ptype;
    $payid=$data->payid;

    $dtype=$data->dtype;
    $lat = $data->lat;
    $lng = $data->lng;

    $total=$data->total;
    $shipping=$data->shipping;

    $orderitems=$data->items;

    $systemToken=apiToken();
    try {
         
        if($systemToken == $token){
            $db = getDB();
            $sqlorder = "INSERT INTO orders(user_id, fname, city, area, address, mobile, paymenttype, payid, total, shipping, coupon, couponprice, dtype, lat, lng)VALUES(:userid, :fname, :city, :area, :address, :mobile, :paymenttype, :payid, :total, :shipping, :coupon, :couponprice, :dtype, :lat, :lng)";
            $stmtorder = $db->prepare($sqlorder);
            $stmtorder->bindParam("fname", $fname,PDO::PARAM_STR);
            $stmtorder->bindParam("userid", $user_id,PDO::PARAM_STR);
            $stmtorder->bindParam("mobile", $mobile,PDO::PARAM_STR);
            $stmtorder->bindParam("city", $city,PDO::PARAM_STR);
            $stmtorder->bindParam("area", $area,PDO::PARAM_STR);
            $stmtorder->bindParam("address", $address,PDO::PARAM_STR);
            $stmtorder->bindParam("paymenttype", $paytype,PDO::PARAM_STR);
            $stmtorder->bindParam("payid", $payid,PDO::PARAM_STR);
            $stmtorder->bindParam("total", $total,PDO::PARAM_STR);
            $stmtorder->bindParam("shipping", $shipping,PDO::PARAM_STR);
            $stmtorder->bindParam("dtype", $dtype,PDO::PARAM_STR);
            $stmtorder->bindParam("lat", $lat,PDO::PARAM_STR);
            $stmtorder->bindParam("lng", $lng,PDO::PARAM_STR);
            $stmtorder->bindParam("coupon", $coupon,PDO::PARAM_STR);
            $stmtorder->bindParam("couponprice", $couponprice,PDO::PARAM_STR);
            $stmtorder->execute();
            $lastid = $db->lastInsertId();

            foreach ($orderitems as $orderitem) {

                $itemname = $orderitem->itemname;
                $itemquantity = $orderitem->itemquantity;
                $itemquantitytype = $orderitem->itemquantitytype;
                $itemprice = $orderitem->itemprice;
                $itemtotal = $orderitem->itemtotal;
                $itemMquantity = $orderitem->Mquantity;

                $sqlitem = "INSERT INTO orderslist (orderid,itemname,itemquantity,itemquantitytype, Mquantity, itemprice,itemtotal) VALUES (:orderid,:itemname,:itemquantity,:itemquantitytype, :Mquantity, :itemprice,:itemtotal)";   
                $stmtitem = $db->prepare($sqlitem);
                $stmtitem->bindParam("orderid", $lastid, PDO::PARAM_STR);
                $stmtitem->bindParam("itemname", $itemname, PDO::PARAM_STR);
                $stmtitem->bindParam("itemquantity",$itemquantity, PDO::PARAM_INT);
                $stmtitem->bindParam("itemquantitytype",$itemquantitytype, PDO::PARAM_STR);
                $stmtitem->bindParam("Mquantity",$itemMquantity, PDO::PARAM_STR);
                $stmtitem->bindParam("itemprice", $itemprice, PDO::PARAM_INT);
                $stmtitem->bindParam("itemtotal", $itemtotal, PDO::PARAM_INT);
                $stmtitem->execute();
          }  
            $db = null;
            echo '{"success":"' . $lastid .'"}';
            
        } else{
            echo '{"error":{"text":"No access"}}';
        }
       
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }
}



function sendmessage() {
    $request = \Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody());

    $token=$data->token;
    $cname=$data->cname;
    $cmobile=$data->cmobile;
    $cmsg=$data->cmsg;

    $systemToken=apiToken();
    try {
         
        if($systemToken == $token){
            $db = getDB();
            $sqlorder = "INSERT INTO message(cname, cmobile, cmsg)VALUES(:cname,:cmobile,:cmessage)";
            $stmtorder = $db->prepare($sqlorder);
            $stmtorder->bindParam("cname", $cname,PDO::PARAM_STR);
            $stmtorder->bindParam("cmobile", $cmobile,PDO::PARAM_STR);
            $stmtorder->bindParam("cmessage", $cmsg,PDO::PARAM_STR);
            $stmtorder->execute();
            $lastid = $db->lastInsertId();

            $db = null;
            echo '{"success":"' . $lastid .'"}';
        } else{
            echo '{"error":{"text":"No access"}}';
        }
       
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }
}


function sendfeedback() {
    $request = \Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody());

    $token=$data->token;
    $fmsg=$data->fmsg;

    $systemToken=apiToken();
    try {
         
        if($systemToken == $token){
            $db = getDB();
            $sqlorder = "INSERT INTO feedback(fmsg)VALUES(:fmessage)";
            $stmtorder = $db->prepare($sqlorder);
            $stmtorder->bindParam("fmessage", $fmsg,PDO::PARAM_STR);
            $stmtorder->execute();
            $lastid = $db->lastInsertId();
            $db = null;
            echo '{"success":"' . $lastid .'"}';
        } else{
            echo '{"error":{"text":"No access"}}';
        }
       
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }
}


function getshipping(){

    $request = \Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody());
    $token=$data->token;
    $systemToken=apiToken();
    $amount=$data->amount;
    
    $shipcost = 0;

    try {
        if($token == $systemToken){
            $db = getDB();
            $sql = "SELECT * FROM shipping";
            $stmt = $db->prepare($sql);
            $stmt->execute();
            $Data = $stmt->fetchAll(PDO::FETCH_OBJ);
            $db = null;

            $db = getDB();
            $sql = "SELECT * FROM coupons";
            $stmt = $db->prepare($sql);
            $stmt->execute();
            $Coupons = $stmt->fetchAll(PDO::FETCH_OBJ);
            $db = null;

            foreach($Data as $data){
                if($data->amount >= $amount){
                    $shipcost = $data->shipcost;
                    break;
                }else{
                    $shipcost = 0;
                }
            }

            echo '{
                "shipCost": ' . $shipcost . ',
                "coupons": '. json_encode($Coupons) .' 
            }';

            }
            else{
                echo '{"Error":"Error"}'; 
        }
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    } 

}


function gettoken(){

    $request = \Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody());

    $systemToken=apiToken();
    echo $systemToken;

}

function getauth() {
    
    $request = \Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody());
    
    try {
        
        $db = getDB();
        $userData ='';
        $sql = "SELECT id,dmobile,dname,dusername FROM deliveryboy WHERE dusername=:username and dpassword=:password ";
        $stmt = $db->prepare($sql);
        $stmt->bindParam("username", $data->username, PDO::PARAM_STR);
        $stmt->bindParam("password", $data->password, PDO::PARAM_STR);
        $stmt->execute();
        $mainCount=$stmt->rowCount();
        $userData = $stmt->fetch(PDO::FETCH_OBJ);
        
        $db = null;
         if($userData){
               $userData = json_encode($userData);
                echo '{"userData": ' .$userData . '}';
            } else {
               echo '{"error":{"text":"Bad request"}}';
            }

           
    }
    catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }
}


function getauthstore() {
    
    $request = \Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody());
    
    try {
        
        $db = getDB();
        $userData ='';
        $sql = "SELECT id,smobile,sname,susername FROM storemanager WHERE susername=:username and spassword=:password ";
        $stmt = $db->prepare($sql);
        $stmt->bindParam("username", $data->username, PDO::PARAM_STR);
        $stmt->bindParam("password", $data->password, PDO::PARAM_STR);
        $stmt->execute();
        $mainCount=$stmt->rowCount();
        $userData = $stmt->fetch(PDO::FETCH_OBJ);
        
        $db = null;
         if($userData){
               $userData = json_encode($userData);
                echo '{"userData": ' .$userData . '}';
            } else {
               echo '{"error":{"text":"Bad request"}}';
            }

           
    }
    catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }
}


function getmyorders(){

    $request = \Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody());
    $userid=$data->id;
    
    try {
        if(true){
            $db = getDB();
            $sqlorder = "SELECT orderid, user_id, fname, mobile, city, area, address ,status, total, shipping, paymenttype, payid, coupon, couponprice, lat, lng, dtype, dcode, driverid, dname, dmobile, ordertime FROM orders LEFT JOIN deliveryboy on orders.driverid = deliveryboy.id where orders.driverid = :userid ORDER BY orderid DESC";
            $stmtOrder = $db->prepare($sqlorder);
            $stmtOrder->bindParam("userid",$userid, PDO::PARAM_STR);
            $stmtOrder->execute();
            $OrderData = $stmtOrder->fetchAll(PDO::FETCH_OBJ);
            $db = null;
            echo '{"OrderData": ' . json_encode($OrderData) . '}';
            }
            else{
                echo '{"Error":"Error"}'; 
        }
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    } 

}


function getmyordersstore(){

    $request = \Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody());
    $userid=$data->id;
    
    try {
        if(true){
            $db = getDB();
            $sqlorder = "SELECT * FROM orders LEFT JOIN deliveryboy on deliveryboy.id = orders.driverid ORDER BY orderid DESC";
            $stmtOrder = $db->prepare($sqlorder);
            $stmtOrder->execute();
            $OrderData = $stmtOrder->fetchAll(PDO::FETCH_OBJ);
            $db = null;
            echo '{"OrderData": ' . json_encode($OrderData) . '}';
            }
            else{
                echo '{"Error":"Error"}'; 
        }
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    } 

}

function getdetails(){

    $request = \Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody());
    $userid=$data->id;
    $orderid=$data->orderid;
    
    try {
        if(true){
            $db = getDB();
            $sqlorder = "SELECT orderid, user_id, fname, mobile, city, area, address ,status, total, shipping, paymenttype, payid, coupon, couponprice, lat, lng, dtype, dcode, driverid, dname, dmobile, ordertime FROM orders LEFT JOIN deliveryboy on orders.driverid = deliveryboy.id where orders.orderid = :orderid ORDER BY orderid DESC";
            $stmtOrder = $db->prepare($sqlorder);
            $stmtOrder->bindParam("orderid",$orderid, PDO::PARAM_STR);
            $stmtOrder->execute();
            $OrderData = $stmtOrder->fetch(PDO::FETCH_OBJ);
            $db = null;

            $db = getDB();
            $sqlorder = "SELECT * FROM orderslist WHERE orderid = :orderid";
            $stmtOrder = $db->prepare($sqlorder);
            $stmtOrder->bindParam("orderid",$orderid, PDO::PARAM_STR);
            $stmtOrder->execute();
            $OrderDetail = $stmtOrder->fetchAll(PDO::FETCH_OBJ);
            $db = null;

            echo '{
                    "OrderData": ' . json_encode($OrderData) . ',
                    "OrderDetail": ' . json_encode($OrderDetail) . '
                    }';
            }
            else{
                echo '{"Error":"Error"}'; 
        }
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    } 

}


function getdetailsorders(){

    $request = \Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody());
    $userid=$data->id;
    $orderid=$data->orderid;
    
    try {
        if(true){
            $db = getDB();
            $sqlorder = "SELECT orderid, user_id, fname, mobile, city, area, address ,status, total, shipping, paymenttype, payid, coupon, couponprice, lat, lng, dtype, dcode, driverid, dname, dmobile, ordertime FROM orders LEFT JOIN deliveryboy on orders.driverid = deliveryboy.id where orders.orderid = :orderid ORDER BY orderid DESC";
            $stmtOrder = $db->prepare($sqlorder);
            $stmtOrder->bindParam("orderid",$orderid, PDO::PARAM_STR);
            $stmtOrder->execute();
            $OrderData = $stmtOrder->fetch(PDO::FETCH_OBJ);
            $db = null;

            $db = getDB();
            $sql = "SELECT dname, id FROM deliveryboy";
            $stmt = $db->prepare($sql);
            $stmt->execute();
            $ddata = $stmt->fetchAll(PDO::FETCH_OBJ);
            $db = null;

            echo '{
                    "OrderData": ' . json_encode($OrderData) . ',
                    "ddata": ' . json_encode($ddata) . '
                    }';
            }
            else{
                echo '{"Error":"Error"}'; 
        }
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    } 

}

function updateorderstatus() {
    $request = \Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody());

    $orderid=$data->orderid;
    $status='Delivered';

    $systemToken=apiToken();
    try {
         
        if(true){
            $db = getDB();
            $sqlorder = "UPDATE orders SET status=:status WHERE orderid=:orderid";
            $stmtorder = $db->prepare($sqlorder);
            $stmtorder->bindParam(":orderid", $orderid,PDO::PARAM_STR);
            $stmtorder->bindParam(":status", $status,PDO::PARAM_STR);
            
            if($stmtorder->execute()){
                echo '{"status":"success"}';
            }else{
                echo '{"error":{"text":"No access"}}';
            }
            $db = null;
           
        } else{
            echo '{"error":{"text":"No access"}}';
        }
       
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }
}


function updateorderstatusstore() {
    $request = \Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody());

    $orderid=$data->orderid;
    $status=$data->status;
    $driver=$data->deliveryboy;
    $dcode = rand(1111,9999);

    $systemToken=apiToken();
    try {
         
        if(true){
            $db = getDB();
            $sqlorder = "UPDATE orders SET status=:status, driverid=:driver, dcode=:dcode WHERE orderid=:orderid";
            $stmtorder = $db->prepare($sqlorder);
            $stmtorder->bindParam(":orderid", $orderid,PDO::PARAM_STR);
            $stmtorder->bindParam(":status", $status,PDO::PARAM_STR);
            $stmtorder->bindParam(":driver", $driver,PDO::PARAM_STR);
            $stmtorder->bindParam(":dcode", $dcode,PDO::PARAM_STR);
            if($stmtorder->execute()){
                echo '{"status":"success"}';
            }else{
                echo '{"error":{"text":"No access"}}';
            }
            $db = null;
           
        } else{
            echo '{"error":{"text":"No access"}}';
        }
       
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }
}



function getarea(){

    $request = \Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody());
    $token=$data->token;
    $systemToken=apiToken();
    
    try {
        if($token == $systemToken){
            $db = getDB();
            $sqlhome = "SELECT * FROM deliveryareas";
            $stmt = $db->prepare($sqlhome);
            $stmt->execute();
            $Data = $stmt->fetchAll(PDO::FETCH_OBJ);
            $db = null;
            echo '{"Data": ' . json_encode($Data) . '}';
            }
            else{
                echo '{"Error":"Error"}'; 
        }
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    } 

}


function getmatch(){

    $request = \Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody());
    $token=$data->token;
    $systemToken=apiToken();
    $id = $data->itemid;
    
    try {
        if($token == $systemToken){
            $db = getDB();

            $sql = "SELECT category FROM items WHERE id=:id";
            $stmt = $db->prepare($sql);
            $stmt->bindParam(":id", $id,PDO::PARAM_STR);
            $stmt->execute();
            $Data = $stmt->fetch(PDO::FETCH_OBJ);

            $sql = "SELECT * FROM items WHERE category=:category";
            $stmt = $db->prepare($sql);
            $stmt->bindParam(":category", $Data->category,PDO::PARAM_STR);
            $stmt->execute();
            $Data = $stmt->fetchAll(PDO::FETCH_OBJ);
            $db = null;
            echo '{"Data": ' . json_encode($Data) . '}';
            }
            else{
                echo '{"Error":"Error"}'; 
        }
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    } 

}

function fetchimage(){

    $request = \Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody());
    $token=$data->token;
    $systemToken=apiToken();
    $id = $data->itemid;
    
    try {
        if($token == $systemToken){
            $db = getDB();

            $sql = "SELECT * FROM itemimages WHERE itemid=:itemid";
            $stmt = $db->prepare($sql);
            $stmt->bindParam(":itemid", $id,PDO::PARAM_STR);
            $stmt->execute();
            $Data = $stmt->fetchAll(PDO::FETCH_OBJ);
            $db = null;
            echo '{"Data": ' . json_encode($Data) . '}';
            }
            else{
                echo '{"Error":"Error"}'; 
        }
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    } 

}function fetchimages(){

    $request = \Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody());
    $token=$data->token;
    $systemToken=apiToken();
    $id = $data->itemid;
    
    try {
        if($token == $systemToken){
            $db = getDB();

            $sql = "SELECT * FROM itemimages WHERE itemid=:itemid";
            $stmt = $db->prepare($sql);
            $stmt->bindParam(":itemid", $id,PDO::PARAM_STR);
            $stmt->execute();
            $Data = $stmt->fetchAll(PDO::FETCH_OBJ);
            $db = null;
            echo '{"Data": ' . json_encode($Data) . '}';
            }
            else{
                echo '{"Error":"Error"}'; 
        }
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    } 

}

?>