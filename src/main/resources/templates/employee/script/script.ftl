<#import "../../parts/common.ftl" as c>

<@c.page>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <h1>Настройка сценария</h1>
            </div>
        </div>
    </div>


    <form action="/employee/script/${script.getId()}/update" method="post">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12">
                    <input type="text" name="name" placeholder="Имя сценария" value="${script.getName()}">
                    <select name="group">
                        <#list groups as group>
                            <option value="${group.getId()}" <#if script.getScriptGroup().getName() == group.getName()>selected</#if> >${group.getName()}</option>
                        </#list>
                    </select>
                </div>
            </div>

            <div class="formService">
                <#list script.getServices() as serviceBysctipt>
                <div class="row justify-content-center service-${serviceBysctipt?index +1}">
                    <div class="col-md-10">
                        <p>
                            <select name="service-${serviceBysctipt?index +1}" class="service-input">
                                <#list services as service>
                                    <option class="serviceOption" value="${service.getId()}" <#if serviceBysctipt.getName() == service.getName()>selected</#if> >Имя:${service.getName()}, Цена:${service.getPrice()}</option>
                                </#list>
                            </select>
                        </p>
                    </div>
                    <div class="col-2">
                        <#if serviceBysctipt?index != 0>
                            <a class="btn btn-danger" onclick="deleteService('service-${serviceBysctipt?index +1}');">Удалить</a>
                        </#if>
                    </div>
                </div>
                </#list>
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
                    <button class="btn btn-primary" type="submit">Обновить</button>
                </div>
            </div>
        </div>
    </form>
    <script src="/static/service.js" type="text/javascript"></script>
</@c.page>