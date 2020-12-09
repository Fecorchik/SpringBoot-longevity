<#import "../../parts/common.ftl" as c>

<@c.page>

    <div class="container">
        <div class="row">
            <div class="col-12">
                <#list professions as profession>
                    <div class="row">
                        <div class="col-2">
                            <p>${profession.getId()}</p>
                        </div>
                        <div class="col-8">
                            <p>${profession.getName()}</p>
                        </div>
                        <div class="col-1">
                            <a href="/admin/profession/${profession.getId()}">Просмотр</a>
                        </div>
                        <div class="col-1">
                            <a href="/admin/profession/${profession.getId()}/delete">Удалить</a>
                        </div>
                    </div>
                </#list>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-12">
                <form action="/admin/profession/add" method="post">

                    <div class="row">
                        <div class="col-12">
                            <input type="text" name="name">
                        </div>
                    </div>

                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-primary btn-style mt-4">Create</button>
                </form>
            </div>
        </div>
    </div>

</@c.page>