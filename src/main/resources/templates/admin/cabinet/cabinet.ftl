<#import "../../parts/common.ftl" as c>

<@c.page>


    <div class="main-content" style="background: 0;">

        <!-- content -->
        <div class="container-fluid content-top-gap" style="margin: 0; ">

            <!-- content -->
            <div class="">
                <!-- login form -->
                <section class="login-form py-md-5 py-3">
                    <div class="card card_border p-md-4">
                        <div class="card-body">
                            <!-- form -->
                            <form action="/admin/cabinet/${cabinet.getId()}/update" method="post">
                                <div class="login__header text-center mb-lg-5 mb-4">
                                    <h3 class="login__title mb-2">Cabinet</h3>
                                    <p>Update, and continue</p>

                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="input__label">Name</label>
                                    <input type="text" name="nameCabinet"
                                           class="form-control login_text_field_bg input-style" id="exampleInputEmail1"
                                           aria-describedby="emailHelp" value="${cabinet.getName()}" placeholder="Name"
                                           readonly autofocus="">
                                </div>
                                <div class="form-group">
                                    <select name="nameBranch" class="form-control login_text_field_bg input-style">
                                        <#list branches as branch>
                                            <option class="form-control login_text_field_bg input-style"
                                                    value="${branch.getName()}"
                                                    <#if cabinet.getBranch().getName() == branch.getName()>selected</#if>
                                            >${branch.getName()}</option>
                                        </#list>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <#list cabinet.getCabinetEmployee() as cabInfo>
                                        <div class="row justify-content-center">
                                            <div class="col-5"><p> ${cabInfo.getDay().getDay()}</p></div>
                                            <div class="col-5">
                                                <select name="${cabInfo.getDay()}"
                                                        class="form-control login_text_field_bg input-style">
                                                    <option class="form-control login_text_field_bg input-style"
                                                            value="empty" selected>Никого
                                                    </option>
                                                    <#list employees as employee>
                                                        <option class="form-control login_text_field_bg input-style"
                                                                value="${employee.getUsername()}"
                                                                <#if cabInfo.getEmployee().getUsername()?exists>
                                                                    <#if employee.getUsername() == cabInfo.getEmployee().getUsername()>selected</#if>
                                                                </#if>
                                                        >${employee.getUsername()}</option>
                                                    </#list>
                                                </select>
                                            </div>
                                        </div>
                                    </#list>
                                </div>

                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <div class="d-flex align-items-center flex-wrap justify-content-between">
                                    <button type="submit" class="btn btn-primary btn-style mt-4">Update</button>
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