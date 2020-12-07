<#import "../../parts/common.ftl" as c>

<@c.page>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <h1>Кастомный сценарий</h1>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <p>ID: ${customScript.getId()}</p>
            </div>
            <div class="col-12">
                <p>Клиент: ${customScript.getId()}</p>
                <div class="row">
                    <div class="col-12">
                        <p>Имя: ${customScript.getClient().getUsername()}</p>
                    </div>
                    <#--
                    <div class="col-12">
                        <p>Фамилия: ${customScript.getClient().getLastName()}</p>
                    </div>
                    <div class="col-12">
                        <p>Отчество: ${customScript.getClient().getPatronymic()}</p>
                    </div>
                    -->
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <h3>Выбранные сервисы</h3>
            </div>
        </div>

        <#list 0..count-1 as i>
            <div class="row card">
                <div class="card-body">
                    <div class="col-12">
                        <p>Название услуги: ${customScript.getServices()[i].getName()}, Цена: ${customScript.getServices()[i].getPrice()}</p>
                    </div>
                    <div class="col-12">
                        <p>Записка: <#if customScript.getNote()[i].getNote() == "empty">Нет записи<#else>${customScript.getNote()[i].getNote()}</#if></p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12"><hr></div>
            </div>
        </#list>
    </div>

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