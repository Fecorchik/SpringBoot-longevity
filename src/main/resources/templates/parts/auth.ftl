<#macro auth path isRegisterForm>
    <section>

        <!-- content -->
        <div class="">
            <!-- login form -->
            <section class="login-form py-md-5 py-3">
                <div class="card card_border p-md-4">
                    <div class="card-body">
                        <!-- form -->
                        <form action="${path}" method="post">
                            <div class="login__header text-center mb-lg-5 mb-4">
                                <#if isRegisterForm>
                                    <h3 class="login__title mb-2"> Logup</h3>
                                    <p>Create your account here, and continue</p>
                                <#else>
                                    <h3 class="login__title mb-2">Login</h3>
                                    <p>Welcome back, login and continue</p>
                                </#if>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1" class="input__label">Login</label>
                                <input type="text" name="username" class="form-control login_text_field_bg input-style"
                                       id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="User Name"
                                       required autofocus="">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1" class="input__label">Password</label>
                                <input type="password" name="password"
                                       class="form-control login_text_field_bg input-style" id="exampleInputPassword1"
                                       placeholder="Password" required>
                            </div>

                            <#if isRegisterForm>

                                <div class="form-group">
                                    <label for="exampleInputPaasword2" class="input__label">Password Repeat</label>
                                    <input type="password" name="password2"
                                           class="form-control login_text_field_bg input-style"
                                           id="exampleInputPaasword2" aria-describedby="emailHelp"
                                           placeholder="Password Repeat" required autofocus="">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputFIO" class="input__label">FullName</label>
                                    <input type="text" name="fullName"
                                           class="form-control login_text_field_bg input-style" id="exampleInputFIO"
                                           aria-describedby="emailHelp" placeholder="FullName" required autofocus="">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail" class="input__label">Email</label>
                                    <input type="email" name="email"
                                           class="form-control login_text_field_bg input-style" id="exampleInputEmail"
                                           aria-describedby="emailHelp" placeholder="Email" required autofocus="">
                                </div>

                            </#if>

                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <#if isRegisterForm>
                                <div class="d-flex align-items-center flex-wrap justify-content-between">
                                    <button type="submit" class="btn btn-primary btn-style mt-4">Create account</button>
                                    <p class="signup mt-4">Already have an account? <a href="/login" class="signuplink">Sign
                                            in</a></p>
                                </div>
                            <#else>
                                <div class="d-flex align-items-center flex-wrap justify-content-between">
                                    <button type="submit" class="btn btn-primary btn-style mt-4">Login Now</button>
                                    <p class="signup mt-4">New user? <a href="/registration/client" class="signuplink">Sign
                                            up</a></p>
                                </div>
                            </#if>

                        </form>
                        <!-- //form -->
                    </div>
                </div>
            </section>

        </div>
        <!-- //content -->

    </section>

    <footer class="dashboard">
        <p>&copy 2020 All Rights Reserved | Design by IV</p>
    </footer>
    <!--footer section end-->
    <!-- move top -->
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


</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-danger" type="submit">Выйти</button>
    </form>
</#macro>