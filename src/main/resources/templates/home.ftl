<#import "parts/common.ftl" as c>
<@c.page>

<#--<!DOCTYPE html>-->
<#--<html xmlns="http://www.w3.org/1999/xhtml">-->
<#--&lt;#&ndash;xmlns:th="http://www.thymeleaf.org" xmlns:sec="https://www.thymeleaf.org/thymeleaf-extras-springsecurity3"&ndash;&gt;-->
<#--<head>-->
    <#--<title>СНК "Медицина Путешествий"</title>-->

    <#--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">-->
    <#--<link rel="stylesheet" href="/static/home.css">-->
<#--</head>-->

<#--<body>-->

<h1>Welcome! (тут картинка-банер с логотипом / фоточки)</h1>

<#--<p>Click <a th:href="@{/greeting}">here</a> to see a greeting.</p>-->



<#--<div>-->
    <#--<sec:authorize access="isAuthenticated()">-->
        <#--<h4><a href="/logout">Выйти</a></h4>-->
    <#--</sec:authorize>-->

    <#--<div sec:authorize="hasRole('ROLE_ADMIN')">-->
        <#--<h4><a href="/admin">Пользователи (только админ)</a></h4>-->
    <#--</div>-->
<#--</div>-->

<div class="container pb-5">
    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="row">
                    <div class="col">
                        <img class="d-block w-100" src="/img/carusel1.jpg" style="height: 300px" alt="Первый слайд">
                    </div>
                    <div class="col">
                        <img class="d-block w-100" src="/img/carusel2.jpg" style="height: 300px" alt="Первый слайд">
                    </div>
                    <div class="col">
                        <img class="d-block w-100" src="/img/carusel3.jpg" style="height: 300px" alt="Первый слайд">
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="row">
                    <div class="col">
                        <img class="d-block w-100" src="/img/carusel4.jpg" style="height: 300px" alt="Первый слайд">
                    </div>
                    <div class="col">
                        <img class="d-block w-100" src="/img/carusel5.jpg" style="height: 300px" alt="Первый слайд">
                    </div>
                    <div class="col">
                        <img class="d-block w-100" src="/img/carusel6.jpg" style="height: 300px" alt="Первый слайд">
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="row">
                    <div class="col">
                        <img class="d-block w-100" src="/img/carusel7.jpg" style="height: 300px" alt="Первый слайд">
                    </div>
                    <div class="col">
                        <img class="d-block w-100" src="/img/carusel8.jpg" style="height: 300px" alt="Первый слайд">
                    </div>
                    <div class="col">
                        <img class="d-block w-100" src="/img/carusel9.jpg" style="height: 300px" alt="Первый слайд">
                    </div>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>


<div class="container text-center mb-3">
    <div class="row">
        <div class="col">
            <div class="card mb-3 div-link">
                <div class="card-body">
                    <h3 class="card-title" >Путешественникам</h3>
                    <a href="/country" class="stretched-link"></a>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card mb-3 div-link">
                <div class="card-body">
                    <h3 class="card-title" >Клиницистам</h3>
                    <a href="/country" class="stretched-link"></a>
                </div>
            </div>
        </div>
    </div>

</div>

<h1 class="text-center mb-5">Новости</h1>
<div class="container">
    <div class="row">
    <#list messages as message>
        <div class="col-md-4">
            <div class="card mb-4">
                <div class="img-preview" style="background-image:url(/img/${message.fileName});">
                </div>
                <div class="card-body">
                    <h5 class="card-title">${message.header}</h5>
                    <p class="card-text">${message.text} </p>
                    <a href="#" class="card-link">Открыть новость</a>
                </div>
            </div>
        </div>
    </#list>

    </div>
</div>

</@c.page>