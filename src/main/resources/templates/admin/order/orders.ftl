<#import "../../parts/common.ftl" as c>

<@c.page>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <h1>Заказы</h1>
            </div>
        </div>

        <div class="row justify-content-center">
            <#list orders as order>
                <div class="col-12">
                    <p>${order}</p>
                </div>
                <div class="col-md-12">
                    <a class="btn btn-primary" href="/admin/order/${order.getId()}">Посмотреть</a>
                    <a class="btn btn-danger" href="/admin/order/${order.getId()}/delete">Удалить</a>
                </div>
                <br><br>
            </#list>
        </div>
    </div>


    <form action="/admin/order/add" method="post">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12">
                    <select name="client">
                        <#list clients as client>
                            <option value="${client.getId()}">${client.getUsername()}</option>
                        </#list>
                    </select>
                    <select name="status">
                        <#list statuses as status>
                            <option value="${status.name()}"
                                    <#if status.name() == "NOT_PAID">selected</#if>>${status.getStatus()}</option>
                        </#list>
                    </select>
                </div>
            </div>

            <div class="formService">
            <div class="row justify-content-center service-1">
                <div class="col-md-10">
                    <p>
                        <select name="service-1">
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
</@c.page>