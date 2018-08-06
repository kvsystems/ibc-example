<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Title -->
    <title><?=$lang['main_title']?></title>

    <!-- Favicon -->
    <link rel="icon" href="/image/?file=core-img|favicon.ico">

    <!-- Core Stylesheet -->
    <link href="/style/?file=style.css" rel="stylesheet">

    <!-- Responsive CSS -->
    <link href="/style/?file=responsive.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">

</head>

<body>
    <!-- Preloader Start -->
    <div id="preloader">
        <div class="colorlib-load"></div>
    </div>

    <!-- ***** Header Area Start ***** -->
    <header class="header_area animated">
        <div class="container-fluid">
            <div class="row align-items-center">
                <!-- Menu Area Start -->
                <div class="col-12 col-lg-10">
                    <div class="menu_area">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <!-- Logo -->
                            <a class="navbar-brand" href="#"></a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ca-navbar" aria-controls="ca-navbar" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                            <!-- Menu Area -->
                            <div class="collapse navbar-collapse" id="ca-navbar">
                                <ul class="navbar-nav ml-auto" id="nav">
                                    <li class="nav-item active"><a class="nav-link" href="#home">Главная</a></li>
                                    <li class="nav-item"><a class="nav-link" href="#about">Популярные рабы</a></li>
                                </ul>
                                <div class="sing-up-button d-lg-none">
                                    <a href="<?=$slave_hunter_uri?>"><?=$lang['dream_slave_button']?></a>
                                </div>								
                            </div>
                        </nav>
                    </div>
                </div>
                <!-- Signup btn -->
                <div class="col-12 col-lg-2">
                    <div class="sing-up-button d-none d-lg-block">
                        <a href="<?=$slave_hunter_uri?>"><?=$lang['dream_slave_button']?></a>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- ***** Header Area End ***** -->

    <!-- ***** Wellcome Area Start ***** -->
    <section class="wellcome_area clearfix" id="home">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12 col-md">
                    <div class="wellcome-heading">
                        <h2><?=$lang['center_title']?></h2>
                        <h3><?=$lang['corporation']?></h3>
                        <p><?=$lang['motto']?></p>
                    </div>
                    <div class="get-start-area">
                    </div>
                </div>
            </div>
        </div>
        <!-- Welcome thumb -->
        <div class="welcome-thumb wow fadeInDown" data-wow-delay="0.5s">
            <img src="img/bg-img/welcome-img.png" alt="">
        </div>
    </section>
    <!-- ***** Wellcome Area End ***** -->

    <!-- ***** Special Area Start ***** -->
    <section class="special-area bg-white section_padding_100" id="about">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Section Heading Area -->
                    <div class="section-heading text-center">
                        <h2><?=$lang['dream_slave_title']?></h2>
                        <div class="line-shape"></div>
                    </div>
                </div>
            </div>

            <div class="row">

                <? if( $slaves ) { foreach( $slaves as $slave ) { ?>

                    <div class="col-12 col-md-4">
                        <div class="single-special text-center wow fadeInUp" data-wow-delay="0.2s">
                            <div class="single-icon">
                                <i class="fas fa-user"></i>
                            </div>
                            <h4><?=$slave['nickname']?></h4>
                            <p><?=$slave['cost']?></p>
                            <a href="<?=$slave_rent_uri?><?=$slave['slave_id']?>"><?=$lang['buy_button']?></a>
                        </div>
                    </div>

                <? }} ?>

            </div>
        </div>
        <!-- Special Description Area -->
    </section>
    <!-- ***** Special Area End ***** -->

    <!-- ***** Footer Area Start ***** -->
    <footer class="footer-social-icon text-center section_padding_70 clearfix m-0">
        <!-- footer logo -->
        <div class="footer-text">
            <h2><?=$lang['main_title']?></h2>
        </div>
        <!-- social icon-->
        <div class="footer-social-icon">
            <!--<a href="#"><i class="fab fa-facebook-square"></i></a>
            <a href="#"><i class="fab fa-google"></i></a>-->
            <!--<a href="https://vk.com/kv_sys" target="_blank"><i class="fab fa-vk"></i></a>-->
            <!--<a href="#"><i class="fab fa-instagram"></i></a>-->
        </div>
       <!-- <div class="footer-menu">
            <nav>
                <ul>
                    <li><a href="#">О нас</a></li>
                    <li><a href="#">Terms &amp; Conditions</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Контакты</a></li>
                </ul>
            </nav>
        </div>-->
        <!-- Foooter Text-->
        <div class="copyright-text">
            <!-- ***** Removing this text is now allowed! This template is licensed under CC BY 3.0 ***** -->
            <p><?=$lang['copyright']?></p>
        </div>
    </footer>
    <!-- ***** Footer Area Start ***** -->

    <!-- Jquery-2.2.4 JS -->
    <script src="/script/?file=jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="/script/?file=popper.min.js"></script>
    <!-- Bootstrap-4 Beta JS -->
    <script src="/script/?file=bootstrap.min.js"></script>
    <!-- All Plugins JS -->
    <script src="/script/?file=plugins.js"></script>
    <!-- Slick Slider Js-->
    <script src="/script/?file=slick.min.js"></script>
    <!-- Footer Reveal JS -->
    <script src="/script/?file=footer-reveal.min.js"></script>
    <!-- Active JS -->
    <script src="/script/?file=active.js"></script>
</body>

</html>
