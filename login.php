<?php
  error_reporting(0);
    ob_start();
    session_start();
    $koneksi = new mysqli("localhost","root","","siakad2");

    if($_SESSION['admin'] || $_SESSION['mahasiswa'] || $_SESSION['dosen']){
        header("location:index.php");
    }else{
?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <img src="assets/img/univa.jpg" class="user-image img-responsive"/>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	   <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/img/univa.jpg">
   
    <title>UNIVERSITAS ALIFAH PADANG</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

</head>
<body>
    <div class="container">
        <div class="row text-center ">
            <div class="col-md-12">
                <br /><br />
                <h2> Halaman Login</h2>


            </div>
        </div>
         <div class="row ">

                  <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                        <strong>  Masukan Username dan Password </strong>
                            </div>
                            <div class="panel-body">
                                <form role="form" method="POST">
                                       <br />
                                     <div class="form-group input-group">
                                            <span class="input-group-addon"><i class="fa fa-tag"  ></i></span>
                                            <input class="form-control" placeholder="Username" name="username"  autofocus>
                                        </div>
                                            <div class="form-group input-group">
                                            <span class="input-group-addon"><i class="fa fa-lock"  ></i></span>
                                           <input class="form-control" placeholder="Password" name="pass" type="password" value="">
                                        </div>


                                    <input  type="submit" name="login" class="btn btn-lg btn-success btn-block" value="Login"/>
                                    </form>


                        <?php



                            $username = $_POST['username'];
                            $pass = $_POST['pass'];

                            $login = $_POST['login'];

                            if($login){

                                $sql = $koneksi->query("select * from tb_user where user_id='$username' and pass='$pass' ");
                                $ketemu = $sql->num_rows;
                                $data = $sql->fetch_assoc();


                                if($ketemu >=1){

                                    session_start();

                                    $_SESSION['username'] = $data ['user_id'];
                                    $_SESSION[pass] = $data [pass];
                                    $_SESSION[level] = $data [level];


                                    if($data['level'] == "admin"){
                                        $_SESSION['admin'] = $data[id];
                                        header("location:index.php");

                                    }else if($data['level']== "mahasiswa"){
                                        $_SESSION['mahasiswa'] = $data[id];
                                        header("location:index.php");

                                    }else if($data['level']== "dosen"){
                                        $_SESSION['dosen'] = $data[id];
                                        header("location:index.php");

                                    }
                                } else{
                                            ?>
                                                <script type="text/javascript">
                                                    alert("Login Gagal Username dan Password Salah.. Silahkan Ulangi Lagi");
                                                </script>
                                            <?php
                                        }

                            }

                        ?>

                            </div>

                        </div>
                    </div>


        </div>
    </div>


     <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>

</body>
</html>

 <!-- partial:partials/_footer.html -->
     <footer class="footer text-center">
         <h6 style="color: blue;">@ Copyright Davit Ariyanto</h6>
					</li   
     </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
     </div> 
<?php
    }
?>
