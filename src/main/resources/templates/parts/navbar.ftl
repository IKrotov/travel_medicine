<#include "security.ftl">

<nav class="navbar navbar-expand-lg navbar-light bg-light" id="navigation">
    <a class="navbar-brand" href="/">
        <img src="/static/img/double_logo.png" alt="logo" style="max-height: 200px; max-width: 200px" class="d-inline-block align-center">
        Медицина путешествий
    </a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item>">
                <a class="nav-item nav-link text-primary" href="#">О нас<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-item nav-link text-primary" href="/messages">Новости</a>
            </li>
            <li class="nav-item">
                <a class="nav-item nav-link text-primary" href="#">Вопрос ответ</a>
            </li>
            <#if user??>
                <li class="nav-item">
                    <a class="nav-item nav-link text-primary" href="/profile">Профиль</a>
                </li>
            </#if>
            <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-item nav-link text-primary" href="/admin">Панель администратора</a>
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
                <img class="avatar" src="/static/img/snk_logo.png" alt="avatar">
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