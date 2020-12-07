<#include "secutiry.ftl">
<#import "auth.ftl" as a>




<div class="sidebar-menu sticky-sidebar-menu">

    <div class="logo">
        <h1><a href="/">Menu</a></h1>
    </div>


    <div class="logo-icon text-center">
        <a href="/" title="logo"><img src="/static/images/logo.png" alt="logo-icon"> </a>
    </div>

    <div class="sidebar-menu-inner">

        <ul class="nav nav-pills nav-stacked custom-nav">
            <li class="active"><a href="/">
                    <i class="fa fa-tachometer"></i><span> Home</span></a></li>

            <#if user??>
                <#if isAdmin == true>
                    <li class="active"><a href="/admin"><i class="lnr lnr-cog"></i><span>Admin</span></a>
                        <ul class="sub-menu-list">
                            <li><a href="/admin/empl/all">Employees</a></li>
                            <li><a href="/admin/branch/all">Branches</a></li>
                            <li><a href="/admin/cabinet/all">Сabinets</a></li>
                            <li><a href="/admin/service/all">Services</a></li>
                            <li><a href="/admin/order/all">Orders</a></li>
                            <li><a href="/registration/employee">Employee registration</a></li>
                        </ul>
                    </li>
                </#if>

                <#if isEmployee == true>
                    <li class="active"><a href="/employee"><i class="fa fa-th"></i><span>Employee</span></a>
                        <ul class="sub-menu-list">
                            <li><a href="/employee/script_group/all">Groups</a></li>
                            <li><a href="/employee/script/all">Scenario</a></li>
                            <li><a href="/employee/custom_script/all">Custom Scenario</a></li>
                        </ul>
                    </li>
                </#if>

            <#else>
                <li class="active"><a href="/"><i class="fa fa-user"></i>
                        <span>Users<i class="lnr lnr-chevron-right"></i></span></a>
                    <ul class="sub-menu-list">
                        <li><a href="/login">Login</a></li>
                        <li><a href="/registration/client">User registration</a></li>
                    </ul>
                </li>
            </#if>

        </ul>

        <a class="toggle-btn">
            <i class="fa fa-angle-double-left menu-collapsed__left"><span>Collapse Sidebar</span></i>
            <i class="fa fa-angle-double-right menu-collapsed__right"></i>
        </a>

    </div>
</div>


<#if user??>
<#--<div class="header sticky-header">-->
    <div class="header">
    <div class="menu-right">
        <div class="navbar user-panel-top">
            <div class="user-dropdown-details d-flex">
                <div class="profile_details">
                    <ul>
                        <li class="dropdown profile_details_drop">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="dropdownMenu3"
                               aria-haspopup="true" aria-expanded="false">
                                <div class="profile_img">
                                    <img src="/static/images/profileimg.jpg" class="rounded-circle" alt="">
                                    <div class="user-active">
                                        <span></span>
                                    </div>
                                </div>
                            </a>
                            <ul class="dropdown-menu drp-mnu" aria-labelledby="dropdownMenu3">
                                <li class="user-info">
                                    <h5 class="user-name">${name}</h5>
                                    <div class="user-name" style="color: #4cae4c">Role: ${roleName}</div>

                                    <span class="status ml-2">Available</span>
                                </li>
                                <li class="logout" style="margin-top: 10px"><@a.logout ><i
                                            class="fa fa-power-off"></i>Logout</@a.logout></li>
                            </ul>
                        </li>
                    </ul>
                </div>
        </div>
    </div>
</div>
</#if>