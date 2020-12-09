<#import "../../parts/common.ftl" as c>

<@c.page>

    <div class="container">
        <div class="row">
            <div class="col-12">
                <form action="add" method="post">
                    <div class="row">
                        <div class="col-12"><p>Id: ${profession.getId()}</p></div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <input type="text" value="${profession.getName()}">
                        </div>
                    </div>

                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-primary btn-style mt-4">Update</button>
                </form>

            </div>
        </div>
    </div>

</@c.page>