<#import "parts/common.ftl" as c>

<@c.page>

<div class="container">

    <h2 class="title text-center">Новости</h2>

    <form name="message-form" class="form-inline" method="get" action="/messages" enctype="multipart/form-data">
        <div class="form-group">
            <input type="text" name="filter" class="form-control" value="${filter!}" placeholder="Название страны">
            <button type="submit" class="btn btn-primary ml-2">Найти</button>
        </div>
    </form>

     <#list messages as message>
        <div class="row justify-content-md-center m-3">
            <div class="card" style="width: 75%;">
                <img class="card-img-top" src="${message.file.url}">
                <div class="card-body">
                    <h5 class="card-title">${message.header}</h5>
                    <p class="card-text">${message.text}</p>
                    <p><span>${message.countryName}</span></p>

                    <a href="/messages/${message.id}" class="card-link">Открыть новость</a>
                </div>
            </div>
        </div>
     </#list>
</div>

</@c.page>