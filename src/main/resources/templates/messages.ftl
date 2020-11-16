<#import "parts/common.ftl" as c>

<@c.page>

<div class="container">
     <#list messages as message>
        <div class="row justify-content-md-center m-3">
            <div class="card" style="width: 75%;">
                <img class="card-img-top" src="/img/${message.fileName}">
                <div class="card-body">
                    <h5 class="card-title">${message.header}</h5>
                    <p class="card-text">${message.text}</p>

                    <a href="/messages/${message.id}" class="card-link">Открыть новость</a>
                </div>
            </div>
        </div>
     </#list>
</div>

</@c.page>