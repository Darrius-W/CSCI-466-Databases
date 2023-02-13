<html><head><title>x</title></head><body><pre>
<?php
error_reporting(E_ALL);

include('secrets.php');
include('library.php');

//connecting to database
try { // if something goes wrong, an exception is thrown
  $dsn = "mysql:host=courses;dbname=z1900146";
  $pdo = new PDO($dsn, $username, $password);

  //sets error alert type
  $pdo->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);

  //Calling supplier table
  $S_tab = $pdo->query("SELECT * FROM S;");
  $P_tab = $pdo->query("SELECT * FROM P;");
  //echo gettype($S_tab);

  $rows = $S_tab->fetchall(PDO::FETCH_ASSOC);

draw_table($rows);
$rows = $P_tab->fetchall(PDO::FETCH_ASSOC);
draw_table($rows);


//drop down menu
echo "<form action='http://students.cs.niu.edu/~z035690/submission.php' method='GET'>";
//echo "<form action='http://students.cs.niu.edu/~z1900146/z1900146_Assign8.php' method='GET'>";
//echo "<form>";
echo "<select name='select' id='select'>";

foreach($rows as $row){
  foreach($row as $key => $item){
    if($key == "PNAME"){
    echo "<option name='part' value='$item'>$item";
    echo "</option>";
    }
  }
}
echo "</select>";
//echo "<input type='submit' name='Submit'/>";

$prepared = $pdo->prepare('SELECT P FROM P WHERE PNAME = :PNAME');
$prepared->bindParam(':PNAME', $item);
//$prepared->execute(array($item));
$prepared->execute();
$part = $prepared->fetchAll();

/*$sql = "SELECT * FROM P WHERE PNAME = :PNAME;";
$prepared = $pdo->prepare($sql, array(PDO::ATTR_CURSOR => PDO::CURSOR_DWDONLY));
$success = $prepared->excute(array(':PNAME' => $item));*/
echo "<input type='submit' name='Submit'/>";

echo "</form>";

}

}
catch(PDOexception $e) { // handle that exception
  echo "Connection to database failed: " . $e->getMessage();
}

?>
</pre></body></html>
////////////////////////////////////////////////////////////////////////////
<html><head><title>x</title></head><body><pre>
<?php
error_reporting(E_ALL);

//include('secrets.php');
$username= 'z1900146';
$password= '1997Apr21';
include('library.php');

//connecting to database
try { // if something goes wrong, an exception is thrown
  $dsn = "mysql:host=courses;dbname=z1900146";
  $pdo = new PDO($dsn, $username, $password);

  //sets error alert type
  $pdo->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);

  //Calling supplier table
  $rs = $pdo->query("SELECT * FROM S;");
  $rows = $rs->fetchall(PDO::FETCH_ASSOC);
  draw_table($rows);
  $rs = $pdo->query("SELECT * FROM P;");
  $rows = $rs->fetchall(PDO::FETCH_ASSOC);
  draw_table($rows);
  //echo gettype($S_tab);


//drop down menu
//echo "<form action='http://students.cs.niu.edu/~z035690/submission.php' metho$
//echo "<form action='http://students.cs.niu.edu/~z1900146/z1900146_Assign8.php$
echo "<form method= 'GET'>";
echo "<select id='part' name='part'>";

echo "<option value=''>Choose one...</option>\n
     <option value='1'>Nut</option>\n
     <option value='2'>Bolt</option>\n
     <option value='3'>Screw</option>\n
     <option value='4'>Screw</option>\n
     <option value='5'>Cam</option>\n
     <option value='6'>Cog</option>\n";
/*foreach($rows as $row){
  foreach($row as $key => $item){
    if($key == "PNAME"){
    echo "<option value='$item'>$item</option>";
    }
  }
}*/
echo "</select>";
echo "<input type='submit' name='Submit'/>";
echo "</form>";
//echo "<input type='submit' name='Submit'/>";

$rs = $pdo->prepare("SELECT * FROM S,P,SP WHERE SP.P = ?;");
//$prepared->execute(array($item));
$rs = $pdo->prepare("SELECT * FROM S,P,SP WHERE SP.P = ?;");
//$prepared->execute(array($item));
$rs->execute(array('?'-> $_GET['$item']));
$rows = $rs->fetchAll(PDO::FETCH_ASSOC);
draw_table($rows);
/*$sql = "SELECT * FROM P WHERE PNAME = :PNAME;";
$prepared = $pdo->prepare($sql, array(PDO::ATTR_CURSOR => PDO::CURSOR_DWDONLY));
$success = $prepared->excute(array(':PNAME' => $item));*/

}
catch(PDOexception $e) { // handle that exception
  echo "Connection to database failed: " . $e->getMessage();
}

?>
</pre></body></html>
