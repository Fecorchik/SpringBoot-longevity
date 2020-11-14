<#import "../../parts/common.ftl" as c>

<@c.page>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <h1>Сайт поликлиники</h1>
            </div>
        </div>

        <form action="/admin/cabinet/${cabinet.getId()}/update" method="post">
            <div class="row justify-content-center">
                <div class="col-2">
                    <p>Id = ${cabinet.getId()}</p>
                </div>
                <div class="col-5">
                    <input type="text" name="nameCabinet" value="${cabinet.getName()}">
                </div>
                <div class="col-5">
                    <select name="nameBranch">
                        <#list branches as branch>
                            <option value="${branch.getName()}"
                            <#if cabinet.getBranch().getName() == branch.getName()>selected</#if>
                            >${branch.getName()}</option>
                        </#list>
                    </select>
                </div>
            </div>

            <#list cabinet.getCabinetEmployee() as cabInfo>
                <div class="row justify-content-center">
                    <div class="row-2"><p>id: ${cabInfo.getId()}</p></div>
                    <div class="col-5"><p>День недели: ${cabInfo.getDay().getDay()}</p></div>
                    <div class="col-5">
                        <select name="${cabInfo.getDay()}">
                            <option value="empty" selected>Никого</option>
                            <#list employees as employee>
                                <option value="${employee.getUsername()}"
                                        <#if cabInfo.getEmployee().getUsername()?exists>
                                            <#if employee.getUsername() == cabInfo.getEmployee().getUsername()>selected</#if>
                                        </#if>
                                >${employee.getUsername()}</option>
                            </#list>
                        </select>
                    </div>
                </div>
            </#list>

            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div class="col-12">
                <button class="btn btn-primary" type="submit">Обновить</button>
            </div>
        </form>

    </div>
</@c.page>