<#import "../../parts/common.ftl" as c>

<@c.page>



    <div class="main-content" style="background: 0;">

        <!-- content -->
        <div class="container-fluid content-top-gap" style="margin: 0; ">

            <!-- content -->
            <div class="">
                <!-- login form -->
                <section class="login-form py-md-12 py-3" style="max-width: 50em;">
                    <div class="card card_border p-md-4">
                        <div class="card-body">
                            <!-- form -->
                            <form action="/employee/script/${script.getId()}/update" method="post">
                                <div class="login__header text-center mb-lg-5 mb-4">
                                    <h3 class="login__title mb-2">Group</h3>
                                    <p>Update, and continue</p>

                                </div>

                                <div class="container">
                                    <div class="row justify-content-center">
                                        <div class="col-12">
                                            <input type="text" name="name"
                                                   class="form-control login_text_field_bg input-style"
                                                   placeholder="Имя сценария" value="${script.getName()}">
                                            <select name="group" class="form-control login_text_field_bg input-style">
                                                <#list groups as group>
                                                    <option value="${group.getId()}"
                                                            <#if script.getScriptGroup().getName() == group.getName()>selected</#if> >${group.getName()}</option>
                                                </#list>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="formService">
                                        <#list script.getServices() as serviceBysctipt>
                                            <div class="row justify-content-center service-${serviceBysctipt?index +1}">
                                                <div class="col-md-10">
                                                    <p>
                                                        <select name="service-${serviceBysctipt?index +1}"
                                                                class="service-input form-control login_text_field_bg input-style">
                                                            <#list services as service>
                                                                <option class="serviceOption" value="${service.getId()}"
                                                                        <#if serviceBysctipt.getName() == service.getName()>selected</#if> >
                                                                    Имя:${service.getName()},
                                                                    Цена:${service.getPrice()}</option>
                                                            </#list>
                                                        </select>
                                                    </p>
                                                </div>
                                                <div class="col-2">
                                                    <#if serviceBysctipt?index != 0>
                                                        <a class="btn btn-danger"
                                                           onclick="deleteService('service-${serviceBysctipt?index +1}');">Удалить</a>
                                                    </#if>
                                                </div>
                                            </div>
                                        </#list>
                                        <div class="pointService"></div>
                                    </div>


                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="row justify-content-center">
                                                <div class="col-md-12">
                                                    <p>
                                                    <div class="add-service btn btn-primary" style="width: 100%;">Add
                                                        service
                                                    </div>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="row justify-content-center">
                                                <div class="col-md-12">
                                                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                                    <button class="btn btn-primary" style="width: 100%;" type="submit">
                                                        Update
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </form>
                            <!-- //form -->
                        </div>
                    </div>
                </section>

            </div>
            <!-- //content -->

        </div>
    </div>






<#--
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <h1>Настройка сценария</h1>
        </div>
    </div>
</div>


<form action="/employee/script/${script.getId()}/update" method="post">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <input type="text" name="name" placeholder="Имя сценария" value="${script.getName()}">
                <select name="group">
                    <#list groups as group>
                        <option value="${group.getId()}" <#if script.getScriptGroup().getName() == group.getName()>selected</#if> >${group.getName()}</option>
                    </#list>
                </select>
            </div>
        </div>

        <div class="formService">
            <#list script.getServices() as serviceBysctipt>
            <div class="row justify-content-center service-${serviceBysctipt?index +1}">
                <div class="col-md-10">
                    <p>
                        <select name="service-${serviceBysctipt?index +1}" class="service-input">
                            <#list services as service>
                                <option class="serviceOption" value="${service.getId()}" <#if serviceBysctipt.getName() == service.getName()>selected</#if> >Имя:${service.getName()}, Цена:${service.getPrice()}</option>
                            </#list>
                        </select>
                    </p>
                </div>
                <div class="col-2">
                    <#if serviceBysctipt?index != 0>
                        <a class="btn btn-danger" onclick="deleteService('service-${serviceBysctipt?index +1}');">Удалить</a>
                    </#if>
                </div>
            </div>
            </#list>
            <div class="pointService"></div>
        </div>


        <div class="row justify-content-center">
            <div class="col-md-12">
                <p><div class="add-service btn btn-primary">Добавить услугу</div></p>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-md-12">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button class="btn btn-primary" type="submit">Обновить</button>
            </div>
        </div>
    </div>
</form>



-->


    <script src="/static/service.js" type="text/javascript"></script>

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