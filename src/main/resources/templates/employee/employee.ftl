<#import "../parts/common.ftl" as c>

<@c.page>



    <div class="container">
        <div class="card card_border p-1 mb-4" style="margin-top: 3em;">
            <!-- card heading -->
            <div class="cards__heading">
                <h3>Employee Panel</h3>
            </div>
        </div>

        <div class="statistics">
            <div class="row">
                <div class="col-xl-12 pr-xl-2">
                    <div class="row">
                        <div class="col-sm-6 pr-sm-2 statistics-grid">
                            <div class="card card_border border-primary-top p-4">
                                <a href="/employee/script_group/all">
                                    <i class="lnr lnr-cloud-download"> </i>
                                    <h3 class="text-primary number">Scenario groups</h3>
                                    <p class="stat-text"></p>
                                </a>
                            </div>
                        </div>
                        <div class="col-sm-6 pl-sm-2 statistics-grid">
                            <div class="card card_border border-primary-top p-4">
                                <a href="/employee/script/all">
                                    <i class="lnr lnr-cloud-download"> </i>
                                    <h3 class="text-secondary number">Scenario</h3>
                                    <p class="stat-text"></p>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-12 pl-xl-2">
                    <div class="row">
                        <div class="col-sm-6 pr-sm-2 statistics-grid">
                            <div class="card card_border border-primary-top p-4">
                                <a href="/employee/custom_script/all">
                                    <i class="lnr lnr-cloud-download"> </i>
                                    <h3 class="text-success number">Custom scenario</h3>
                                    <p class="stat-text"></p>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!--

            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <h1>Сотрудник</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="row">
                            <div class="col">
                                <p><a href="/employee/script_group/all" class="btn btn-primary">Группы сценариев</a></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <p><a href="/employee/script/all" class="btn btn-primary">Сценарии</a></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <p><a href="/employee/custom_script/all" class="btn btn-primary">Кастомный сценарий</a></p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>


        -->


        <footer class="dashboard">
            <p>&copy 2020 All Rights Reserved | Design by IV</p>
        </footer>


        <button onclick="topFunction()" id="movetop" class="bg-primary" title="Go to top">
            <span class="fa fa-angle-up"></span>
        </button>
        <script>
            // When the user scrolls down 20px from the top of the document, show the button
            window.onscroll = function () {
                scrollFunction()
            };

            function scrollFunction() {
                if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                    document.getElementById("movetop").style.display = "block";
                } else {
                    document.getElementById("movetop").style.display = "none";
                }
            }

            // When the user clicks on the button, scroll to the top of the document
            function topFunction() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }
        </script>
        <!-- /move top -->


        <script src="/static/js/jquery-3.3.1.min.js"></script>
        <script src="/static/js/jquery-1.10.2.min.js"></script>

        <script src="/static/js/jquery.nicescroll.js"></script>
        <script src="/static/js/scripts.js"></script>

        <!-- close script -->
        <script>
            var closebtns = document.getElementsByClassName("close-grid");
            var i;

            for (i = 0; i < closebtns.length; i++) {
                closebtns[i].addEventListener("click", function () {
                    this.parentElement.style.display = 'none';
                });
            }
        </script>
        <!-- //close script -->

        <!-- disable body scroll when navbar is in active -->
        <script>
            $(function () {
                $('.sidebar-menu-collapsed').click(function () {
                    $('body').toggleClass('noscroll');
                })
            });
        </script>
        <!-- disable body scroll when navbar is in active -->

        <!-- loading-gif Js -->
        <script src="/static/js/modernizr.js"></script>
        <script>
            $(window).load(function () {
                // Animate loader off screen
                $(".se-pre-con").fadeOut("slow");
            });
        </script>
        <!--// loading-gif Js -->

        <!-- Bootstrap Core JavaScript -->
        <script src="/static/js/bootstrap.min.js"></script>

</@c.page>