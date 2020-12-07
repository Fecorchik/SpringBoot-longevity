<#import "../../parts/common.ftl" as c>

<@c.page>






    <div class="main-content" style="background: 0;">

        <!-- content -->
        <div class="container-fluid content-top-gap">

            <div class="data-tables">
                <div class="row">
                    <div class="col-lg-12 mb-4">
                        <div class="card card_border p-4">
                            <h3 class="card__title position-absolute">Scenario</h3>


                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-2">Search by groups</div>
                                    <div class="col-10">
                                        <form action="/employee/script/all" method="get">
                                            <select name="filter" class="login_text_field_bg input-style"
                                                    style="width: 50%;">
                                                <option value="" selected>Пусто</option>
                                                <#list groups as group>
                                                    <option value="${group.getName()}">${group.getName()}</option>
                                                </#list>
                                            </select>
                                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                            <button class="btn btn-primary" type="submit">Search</button>
                                        </form>
                                    </div>
                                </div>
                            </div>


                            <div class="table-responsive">
                                <div id="example_wrapper_2" class="dataTables_wrapper no-footer">
                                    <div class="dataTables_length" id="example_length_1"><label></label></div>
                                    <table id="example_1" class="display dataTable no-footer" style="width: 100%;"
                                           role="grid" aria-describedby="example_info">
                                        <thead>
                                        <tr role="row" style="background-color: var(--light-bg-color);">
                                            <th class="sorting_asc" tabindex="0" aria-controls="example" rowspan="1"
                                                colspan="1" aria-sort="ascending"
                                                aria-label="Emp. Name: activate to sort column descending"
                                                style="width: 296px;">Id
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example" rowspan="1"
                                                colspan="1" aria-label="Designation: activate to sort column ascending"
                                                style="width: 456px;">Name
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example" rowspan="1"
                                                colspan="1" aria-label="Joining date: activate to sort column ascending"
                                                style="width: 222px;">Services
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example" rowspan="1"
                                                colspan="1" aria-label="Emp. Status: activate to sort column ascending"
                                                style="width: 241px;">Group
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example" rowspan="1"
                                                colspan="1" aria-label="Emp. Status: activate to sort column ascending"
                                                style="width: 241px;">Action
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <#list scripts as script>
                                            <tr role="row" class="odd" style="border-bottom: 2px solid #E7EDF6;">
                                                <td class="sorting_1" style="padding: 8px 10px;"
                                                    text="${script.getId()}">${script.getId()}</td>
                                                <td style="padding: 8px 10px;"
                                                    text="${script.getName()}">${script.getName()}</td>
                                                <td style="padding: 8px 10px;">
                                                    <#list script.getServices() as service>
                                                        <input type="text"
                                                               class="form-control login_text_field_bg input-style"
                                                               name="${service.getName()}"
                                                               value="${service.getName()} Price: ${service.getPrice()}"
                                                               readonly>
                                                    </#list>
                                                </td>
                                                <td style="padding: 8px 10px;">
                                                    <#--
                                                    <#list script.getScriptGroup() as group>
                                                        <input type="text" name="${group.getName()}" value="${group.getName()}" readonly>
                                                    </#list>
                                                    -->
                                                </td>
                                                <td style="padding: 8px 10px;"><a
                                                            href="/employee/script/${script.getId()}"
                                                            class="badge badge-success">View</a><a
                                                            href="/employee/script/${script.getId()}/delete"
                                                            class="badge badge-danger">Delete</a></td>
                                            </tr>
                                        </#list>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- //content -->
            <div class="col-md-12">

                <div class="card card_border p-md-4">
                    <div class="card-body">
                        <form action="/employee/script/add" method="post">
                            <div class="login__header text-center mb-lg-5 mb-4">
                                <h3 class="login__title mb-2"> Add scenario</h3>
                                <p>Create new scenario</p>
                            </div>
                            <input type="text" class="form-control login_text_field_bg input-style" name="name"
                                   placeholder="Scenario Name">

                            <select class="form-control login_text_field_bg input-style" name="group">
                                <#list groups as group>
                                    <option value="${group.getId()}">${group.getName()}</option>
                                </#list>
                            </select>

                            <div class="formService">
                                <div class="row justify-content-center service-1">
                                    <div class="col-md-12">
                                        <p>
                                            <select class="form-control login_text_field_bg input-style"
                                                    name="service-1" class="service-input">
                                                <#list services as service>
                                                    <option class="serviceOption" value="${service.getId()}">
                                                        Имя:${service.getName()}, Цена:${service.getPrice()}</option>
                                                </#list>
                                            </select>
                                        </p>
                                    </div>
                                    <div class="col-2">
                                        <#--                    <a href="" class="btn btn-danger" onclick="deleteService('service-1');">Удалить</a>-->
                                    </div>
                                </div>

                                <div class="pointService"></div>
                            </div>

                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button class="btn btn-primary" type="submit" style="width: 100%; margin-top: 0.5em;">Add
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

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






    <!--



    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <h1>Список сценариев</h1>
            </div>
        </div>
    </div>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-2">Поиск по группам</div>
                <div class="col-10">
                    <form action="/employee/script/all" method="get">
                        <select name="filter" class="service-input">
                            <option value="" selected>Пусто</option>
                            <#list groups as group>
                                <option value="${group.getName()}">${group.getName()}</option>
                            </#list>
                        </select>
                        <input type="hidden" name="_csrf" value="${_csrf.token}" />
                        <button class="btn btn-primary" type="submit">Поиск</button>
                    </form>
                </div>
            </div>
        </div>
    <div class="container">
        <div class="row justify-content-center">
            <#list scripts as script>
                <div class="col-12">
                    <p>${script}</p>
                </div>
                <div class="col-md-12">
                    <a class="btn btn-primary" href="/employee/script/${script.getId()}">Посмотреть</a>
                    <a class="btn btn-danger" href="/employee/script/${script.getId()}/delete">Удалить</a>
                </div>
                <br><br>
            </#list>
        </div>
    </div>


    <form action="/employee/script/add" method="post">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12">
                    <input type="text" name="name" placeholder="Имя сценария">

                    <select name="group">
                        <#list groups as group>
                            <option value="${group.getId()}">${group.getName()}</option>
                        </#list>
                    </select>
                </div>
            </div>

            <div class="formService">
                <div class="row justify-content-center service-1">
                    <div class="col-md-10">
                        <p>
                            <select name="service-1" class="service-input">
                                <#list services as service>
                                    <option class="serviceOption" value="${service.getId()}">Имя:${service.getName()}, Цена:${service.getPrice()}</option>
                                </#list>
                            </select>
                        </p>
                    </div>
                    <div class="col-2">
                        <#--                    <a href="" class="btn btn-danger" onclick="deleteService('service-1');">Удалить</a>-->
                    </div>
                </div>

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
                    <button class="btn btn-primary" type="submit">Создасть</button>
                </div>
            </div>
        </div>
    </form>



    -->




    <script src="/static/service.js" type="text/javascript"></script>
</@c.page>