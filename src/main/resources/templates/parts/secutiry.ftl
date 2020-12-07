<#assign
    know = Session.SPRING_SECURITY_CONTEXT??
>

<#if know>
    <#assign
        user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
        name = user.getUsername()
    isAdmin = user.isAdmin()
    isEmployee = user.isEmployee()
    roleName = user.roleName()
        currentUserId = user.getId()
    >
<#else>
    <#assign
        name = "unknow"
    <#--    isAdmin = false -->
        currentUserId = -1
    >
</#if>