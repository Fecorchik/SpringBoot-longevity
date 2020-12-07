<#import "../parts/common.ftl" as c>

<@c.page>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <h1>Сайт поликлиники</h1>
            </div>
        </div>
    </div>


    <div class="container">
        <form action="/admin/empl/${employee.getId()}/update" method="post">
            <div class="row">
                <div class="col-12">ID: ${employee.getId()}</div>
            </div>
            <div class="row">
                <div class="col-12">UserName: ${employee.getUsername()}</div>
            </div>

            <div class="row">
                <div class="col-12">
                    <select name="role">
                        <#list roles as role>
                            <option value="${role.name()}"
                                    <#if role.name() == employeeRoleName >selected</#if>>${role.getRole()}</option>
                        </#list>
                    </select>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <select name="profession">
                        <option value="zero">none</option>
                        <#list professions as profession>
                            <option value="${profession.getId()}" <#if profession.getName() == employeeProfessionName> selected</#if> > ${profession.getName()}</option>
                        </#list>
                    </select>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-primary btn-style mt-4">Update</button>
                </div>
            </div>
        </form>
    </div>

</@c.page>