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
                                        <form action="/employee/custom_script/all" method="get">
                                            <select name="filter" class="service-input login_text_field_bg input-style">
                                                <option value="" selected>Search</option>
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
                                                    <input type="text"
                                                           class="form-control login_text_field_bg input-style"
                                                           name="${script.getScriptGroup().getName()}"
                                                           value="${script.getScriptGroup().getName()}" readonly>
                                                </td>
                                                <td style="padding: 8px 10px;"><a
                                                            href="/employee/custom_script/template/${script.getId()}"
                                                            class="badge badge-success">View</a></td>
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


            <div class="data-tables">
                <div class="row">
                    <div class="col-lg-12 mb-4">
                        <div class="card card_border p-4">
                            <h3 class="card__title position-absolute">Custom scenario</h3>


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
                                                style="width: 456px;">Client
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example" rowspan="1"
                                                colspan="1" aria-label="Joining date: activate to sort column ascending"
                                                style="width: 222px;">Services
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example" rowspan="1"
                                                colspan="1" aria-label="Joining date: activate to sort column ascending"
                                                style="width: 222px;">Comments
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example" rowspan="1"
                                                colspan="1" aria-label="Emp. Status: activate to sort column ascending"
                                                style="width: 241px;">Action
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <#list customScripts as customScript>
                                            <tr role="row" class="odd" style="border-bottom: 2px solid #E7EDF6;">
                                                <td class="sorting_1" style="padding: 8px 10px;"
                                                    text="${customScript.getId()}">${customScript.getId()}</td>
                                                <td style="padding: 8px 10px;"
                                                    text="${customScript.getClient().getUsername()}">${customScript.getClient().getUsername()}</td>
                                                <td style="padding: 8px 10px;">
                                                    <#list customScript.getServices() as service>
                                                        <input type="text"
                                                               class="form-control login_text_field_bg input-style"
                                                               name="${service.getName()}"
                                                               value="${service.getName()} Price: ${service.getPrice()}"
                                                               readonly>
                                                    </#list>
                                                </td>
                                                <td style="padding: 8px 10px;">
                                                    <#list customScript.getNote() as note>
                                                        <input type="text"
                                                               class="form-control login_text_field_bg input-style"
                                                               name="${note.note}" value="${note.note}" readonly>
                                                    </#list>
                                                </td>
                                                <td style="padding: 8px 10px;"><a
                                                            href="/employee/custom_script/${customScript.getId()}"
                                                            class="badge badge-success">View</a><a
                                                            class="badge badge-danger"
                                                            href="/employee/custom_script/${customScript.getId()}/delete">Delete</a>
                                                </td>
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


            <#--
                       <div class="container">
                           <div class="row">
                               <div class="col-12">
                                   <hr>
                               </div>
                           </div>
                           <#list customScripts as customScript>
                               <div class="row">
                                   <div class="col-12 justify-content-center">
                                       <p>${customScript}</p>
                                   </div>
                                   <div class="col-6">
                                       <p><a class="btn btn-primary" href="/employee/custom_script/${customScript.getId()}">Посмотреть</a></p>
                                   </div>
                                   <div class="col-6">
                                       <p><a class="btn btn-danger" href="/employee/custom_script/${customScript.getId()}/delete">Удалить</a></p>
                                   </div>
                               </div>
                           </#list>
                       </div>

           -->


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






<#--



    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <h1>Выбрать заготовку</h1>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-2">Поиск по группам</div>
            <div class="col-10">
                <form action="/employee/custom_script/all" method="get">
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
                    <a class="btn btn-primary" href="/employee/custom_script/template/${script.getId()}">Выбрать</a>
                </div>
                <br><br>
            </#list>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <hr>
            </div>
        </div>
        <#list customScripts as customScript>
        <div class="row">
            <div class="col-12 justify-content-center">
                <p>${customScript}</p>
            </div>
            <div class="col-6">
                <p><a class="btn btn-primary" href="/employee/custom_script/${customScript.getId()}">Посмотреть</a></p>
            </div>
            <div class="col-6">
                <p><a class="btn btn-danger" href="/employee/custom_script/${customScript.getId()}/delete">Удалить</a></p>
            </div>
        </div>
        </#list>
    </div>


-->

</@c.page>