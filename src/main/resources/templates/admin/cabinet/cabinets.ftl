<#import "../../parts/common.ftl" as c>

<@c.page>



    <div class="main-content" style="background: 0;">

        <!-- content -->
        <div class="container-fluid content-top-gap">

            <div class="data-tables">
                <div class="row">
                    <div class="col-lg-12 mb-4">
                        <div class="card card_border p-4">
                            <h3 class="card__title position-absolute">Cabinets</h3>
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
                                                style="width: 456px;">Cabinet Name
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example" rowspan="1"
                                                colspan="1" aria-label="Joining date: activate to sort column ascending"
                                                style="width: 222px;">Branch name
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example" rowspan="1"
                                                colspan="1" aria-label="Emp. Status: activate to sort column ascending"
                                                style="width: 241px;">Action
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <#list cabinets as cabinet>
                                            <tr role="row" class="odd" style="border-bottom: 2px solid #E7EDF6;">
                                                <td class="sorting_1" style="padding: 8px 10px;"
                                                    text="${cabinet.getId()}">${cabinet.getId()}</td>
                                                <td style="padding: 8px 10px;"
                                                    text="${cabinet.getName()}">${cabinet.getName()}</td>
                                                <td style="padding: 8px 10px;"
                                                    text="${cabinet.branch.getName()}">${cabinet.branch.getName()}</td>
                                                <td style="padding: 8px 10px;"><a
                                                            href="/admin/cabinet/${cabinet.getId()}"
                                                            class="badge badge-success">View</a><a
                                                            href="/admin/cabinet/${cabinet.getId()}/delete"
                                                            class="badge badge-danger">Delete</a></td>
                                            </tr>
                                        </#list>
                                        </tbody>
                                    </table>
                                    <div class="dataTables_paginate paging_simple_numbers" id="example_paginate"
                                         style="margin-top: 1em;">
                                        <#list 1..totalPages as p>
                                            <#if p != currentPage >
                                                <a href="/admin/cabinet/all/pageus/${p}"
                                                   class="paginate_button">${p}</a>
                                            <#else>
                                                <a href="#" class="paginate_button current">${p}</a>
                                            </#if>

                                        </#list>
                                    </div>

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
                        <form action="/admin/cabinet/add" method="post">
                            <div class="login__header text-center mb-lg-5 mb-4">
                                <h3 class="login__title mb-2"> Add Cabinet</h3>
                                <p>Create new Cabinet</p>
                            </div>
                            <label for="exampleInputEmail1" class="input__label">Name</label>
                            <input type="text" class="form-control login_text_field_bg input-style" name="name">
                            <label for="exampleInputEmail1" class="input__label">Branch</label>
                            <select name="branch" class="form-control login_text_field_bg input-style">
                                <#list branches as branche>
                                    <option class="form-control login_text_field_bg input-style"
                                            value="${branche.getName()}"
                                            placeholder="branch">${branche.getName()}</option>
                                </#list>
                            </select>
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button class="btn btn-primary" style="margin-top: 0.3em;" type="submit">Add</button>
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

</@c.page>