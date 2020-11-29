<#import "parts/common.ftl" as c>

<@c.page>


<#--<!DOCTYPE html>-->
<#--<html lang="en" xmlns:th="http://www.thymeleaf.org">-->
<#--<head>-->
    <#--<meta charset="UTF-8">-->
    <#--<title>Выбор страны</title>-->
    <#--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">-->
<#--</head>-->


<style>
    .img-preview {
        background: no-repeat center;
        background-size: cover;
        width: 100%;
        height: 150px;
    }

    .div-link:hover{
        background-color: lightgray;
    }
</style>


<h1 class="text-center mb-5">Страны</h1>

<div class="container">
    <div class="row">
        <#list allCountry as country>
            <div class="col-md-3">
                <div class="card mb-3 div-link">
                    <#--<div class="img-preview" style="background-image:url(/img/${country.flagFileName});">-->
                        <div class="img-preview" style="background-image:url(${country.flag.url});">
                    </div>
                    <div class="card-body">
                        <h2 class="card-title">${country.countryName}</h2>
                        <a href="/country/${country.id}" class="stretched-link"></a>
                    </div>
                </div>
            </div>
        </#list>

    </div>
</div>

</@c.page>