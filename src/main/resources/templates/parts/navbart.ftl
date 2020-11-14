<#include "secutiry.ftl">
<#import "auth.ftl" as a>

<div class="container">
    <div class="row">
        <div class="col-12">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-3">
                <a class="navbar-brand" href="/">Task</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        <a class="nav-link active" href="/">Главная <span class="sr-only">(current)</span></a>
                        <a class="nav-link" href="<#if currentUserId != -1>/tasks/${currentUserId}</#if>">Мои задачи</a>
                    </div>
                    <div class="navbar-text mr-3">
                        <#if user??>${name}</#if>
                    </div>

                    <#if user??>
                        <@a.logout />
                    <#else>
                            <a href="/login" class="btn btn-primary">Авторизация</a>
                            <a href="/registration/client" class="btn btn-primary ml-2">Регистрация пользователя</a>
                            <a href="/registration/employee" class="btn btn-primary ml-2">Регистрация сотрудника</a>
                    </#if>

<#--                    <#if isAdmin>-->
<#--                        <a href="/admin" class="btn btn-warning ml-3">Админ-панель</a>-->
<#--                    </#if>-->
                </div>
            </nav>
        </div>
    </div>
</div>