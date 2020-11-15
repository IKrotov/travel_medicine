<#import "parts/common.ftl" as c>

<@c.page>

    <#list messages as message>

    <div class="card" style="width: 50%;">
        <img class="card-img-top" src="/img/${message.fileName}">
        <div class="card-body">
            <p class="card-text">${message.text}</p>
        </div>
    </div>

    </#list>

</@c.page>