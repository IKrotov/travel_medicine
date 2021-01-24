<#import "parts/common.ftl" as c>

<@c.page>

<div class="container">

    <h2 class="title text-center">Новости</h2>

    <div class="row m-3">
        <div class="col">
            <h5 class="header">Африка</h5>
            <img class="card-img" src="/static/img/560px-Africa_(orthographic_projection).svg.png">

            <form method="get" action="/messages/continent/AFRICA">
                <input type="submit" content="Найти">
            </form>

        </div>
        <div class="col">
            <h5 class="header">Европа</h5>
            <img class="card-img" src="/static/img/1200px-Europe_orthographic_Caucasus_Urals_boundary.svg.png">

            <form method="get" action="/messages/continent/EUROPE">
                <input type="submit" content="Найти">
            </form>

        </div>
        <div class="col">
            <h5 class="header">Америка</h5>
            <img class="card-img" src="/static/img/Americas_(orthographic_projection).svg.png">

            <form method="get" action="/messages/continent/AMERICA">
                <input type="submit" content="Найти">
            </form>

        </div>
        <div class="col">
            <h5 class="header">Азия</h5>
            <img class="card-img" src="/static/img/Asia_(orthographic_projection).svg">

            <form method="get" action="/messages/continent/ASIA">
                <input type="submit" content="Найти">
            </form>
        </div>

        <div class="col">
            <h5 class="header">Австралия</h5>
            <img class="card-img" src="/static/img/Australia_(orthographic_projection).svg.png">

            <form method="get" action="/messages/continent/AUSTRALIA">
                <input type="submit" content="Найти">
            </form>
        </div>
    </div>

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