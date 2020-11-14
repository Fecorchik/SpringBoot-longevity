<#import "../../parts/common.ftl" as c>

<@c.page>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <h1>Сайт поликлиники</h1>
            </div>
        </div>

        <div class="row justify-content-center">
            <#list cabinets as cabinet>
            <div class="col-12">
                    <p>${cabinet}</p>
            </div>
                <div class="col-12">
                    <a class="btn btn-primary" href="/admin/cabinet/${cabinet.getId()}">Посмотреть</a>
                    <a class="btn btn-danger" href="/admin/cabinet/${cabinet.getId()}/delete">Удалить</a>
                </div>
                <br><br>
            </#list>

        </div>
    </div>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <form action="/admin/cabinet/add" method="post">
                    <input type="text" name="name">
                    <select name="branch">
                        <#list branches as branche>
                            <option value="${branche.getName()}">${branche.getName()}</option>
                        </#list>
                    </select>
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <button class="btn btn-primary" type="submit">Создасть</button>
                </form>
            </div>
        </div>
    </div>
</@c.page>