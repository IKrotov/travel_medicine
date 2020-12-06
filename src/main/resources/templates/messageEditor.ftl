<#import "parts/common.ftl" as c>

<@c.page>

<h3>Редактор Новости</h3>
<div>
    <form name="message-form" method="post" action="/admin/editMsg/${message.id}" enctype="multipart/form-data">

        <div class="form-group">
            <label for="continent">Континент</label>
            <select class="custom-select" name="continent" id="continent" required>
                <#list continents as continent>
                    <option value="${continent}" selected="${message.continent}">${continent}</option>
                </#list>
            </select>
        </div>

        <div class="form-group">
            <label for="countryName">Страна</label>
            <textarea name="countryName" class="form-control" id="countryName" rows="1">${message.countryName}</textarea>
        </div>

        <div class="form-group">
            <label for="date">Дата новости</label>
            <input type="date" id="start" name="date"
                   value="${message.date}">
        </div>

        <div class="form-group">
            <label for="header">Заголовок новости</label>
            <textarea name="header" class="form-control" id="header" rows="1">${message.header}</textarea>
        </div>
        <div class="form-group">
            <label for="text">Текст новости</label>
            <textarea name="text" class="form-control" id="text" rows="6">${message.text}</textarea>
        </div>
        <div class="form-group">
            <label for="file">Прикрепить картинку для новости</label>
            <input type="file" name="file" class="form-control-file" id="file">
        </div>
        <button type="submit" class="btn btn-primary"> Отредактировать </button>
    </form>
</div>
</@c.page>