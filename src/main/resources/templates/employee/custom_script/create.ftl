<#import "../../parts/common.ftl" as c>

<@c.page>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <h2>Create Custom scenario</h2>
            </div>
        </div>
    </div>

    <style>
        .content .left {
            float: left;
            width: 20%;
            border: 1px solid #0066CC;
            margin: 3px;
        }

        .content .center {
            float: left;
            border: 1px solid #FF0000;
            margin: 3px;
            width: 57%
        }

        .content .right {
            float: right;
            width: 20%;
            border: 1px solid #FF0000;
            margin: 3px
        }

        .mo {
            height: auto;
            border: 1px solid #CCC;
            margin: 3px;
            background: #FFF
        }

        .mo h1 {
            background: #ECF9FF;
            height: 18px;
            padding: 3px;
            cursor: move
        }

        .closediv {
            cursor: default;
        }

        .minusspan {
            cursor: default;
        }

        .mo .nr {
            height: auto;
            border: 1px solid #F3F3F3;
            margin: 2px
        }

        h1 {
            margin: 0px;
            padding: 0px;
            text-align: left;
            font-size: 12px
        }

        .dragging {
            FILTER: progid: DXImageTransform . Microsoft . Alpha(opacity = 60);
            opacity: 0.6;
            moz-opacity: 0.6
        }
    </style>


    <form action="/employee/custom_script/add" method="post">
        <div class="container" style="border-bottom: 20px">
            <div class="row justify-content-center">
                <div class="col-12">
                    <select name="client" style="width: 10em;" class="login_text_field_bg input-style">
                        <#list clients as client>
                            <option value="${client.getId()}">${client.getUsername()}</option>
                        </#list>
                    </select>
                </div>
            </div>
        </div>

        <div class="container" style="border-bottom: 20px">
            <div class="formServiceCustom" id=dom0>
                <#list script.getServices() as service>
                    <div class="mo" id=m${service?index+1}><h1 class="card"></h1>
                        <div class="nr service-${service?index+1} ">
                            <div class="card-body">
                                <div class="col-12">
                                    <select name="service-${service?index+1}"
                                            class="service-input-custom form-control login_text_field_bg input-style">
                                        <#list services as serviceList>
                                            <option class="serviceOption form-control login_text_field_bg input-style"
                                                    value="${serviceList.getId()}"
                                                    <#if service.getName() == serviceList.getName()>selected</#if> >
                                                Имя:${serviceList.getName()}, Цена:${serviceList.getPrice()}</option>
                                        </#list>
                                    </select>
                                </div>
                                <div class="col-12">
                                    <input type="text" class="form-control login_text_field_bg input-style"
                                           name="service-${service?index+1}-text" placeholder="Записка">
                                </div>
                                <div class="col-12">
                                    <a class="btn btn-danger" onclick="removeRow(this)"
                                       style='cursor: default;'>Delete</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </#list>
                <div class="pointServiceCustom"></div>
            </div>

            <div class="row">
                <div class="col-md-6">
                <div class="row justify-content-center">
                    <div class="col-md-12">
                        <p>
                        <div class="add-service-custom btn btn-primary" style="width: 100%;">Add service</div>
                        </p>
                    </div>
                </div>
            </div>

                <div class="col-md-6">
                    <div class="row justify-content-center">
                <div class="col-md-12">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button class="btn btn-primary" style="width: 100%;" type="submit">Create</button>
                </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </form>
    <script src="/static/service.js" type="text/javascript"></script>
    <script src="/static/serviceCustom.js" type="text/javascript"></script>
    <script src="/static/dragdrop.js" type="text/javascript"></script>

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