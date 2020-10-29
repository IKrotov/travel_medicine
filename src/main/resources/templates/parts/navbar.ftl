<#include "security.ftl">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="/">СНК "Медицина путешествий"</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item>">
                <a class="nav-item nav-link" href="/country">Страны<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-item nav-link" href="#">Новости</a>
            </li>
            <li class="nav-item">
                <a class="nav-item nav-link" href="#">Вопрос ответ</a>
            </li>
            <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-item nav-link" href="/admin">Панель администратора</a>
                </li>
            </#if>
        </ul>
        <div class="navbar-text mr-3">${name}</div>
        <#if known>
         <form action="/logout" method="post">
            <button class="btn btn-outline-danger my-2 my-sm-0 inline" type="submit">Log out</button>
         </form>
        <#else>
             <button class="btn btn-outline-success my-2 my-sm-0 inline" type="button" href="#myModal" data-toggle="modal">Sign In</button>
        </#if>

    </div>
</nav>

<!-- Modal HTML -->
<div id="myModal" class="modal fade">
    <div class="modal-dialog modal-login">
        <div class="modal-content">
            <div class="modal-header">
                <img class="avatar" src="/img/logo.jpg">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <form action="/login" method="post">
                    <div class="form-group">
                        <input type="text" name="username" class="form-control" placeholder="Username">
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" class="form-control" placeholder="Password">
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btn btn-primary btn-block btn-lg" value="Login">
                    </div>
                </form>
                <div class="hint-text"><a href="/registration">Зарегистрироваться</a></div>
                <div class="hint-text small"><a href="#">Forgot Your Password?</a></div>
            </div>
        </div>
    </div>
</div>