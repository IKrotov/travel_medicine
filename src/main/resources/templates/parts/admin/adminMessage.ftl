
<h3>Добавление новостей</h3>
<div>
    <form name="message-form" method="post" action="/admin/addMessage" enctype="multipart/form-data">


        <div class="form-group">
            <label for="countryName">Страна</label>
            <textarea name="countryName" class="form-control" id="countryName" rows="1"></textarea>
        </div>

        <div class="form-group">
            <label for="date">Дата новости</label>
            <input type="date" id="start" name="date"
                   value="2020-11-30">
        </div>

        <div class="form-group">
            <label for="header">Заголовок новости</label>
            <textarea name="header" class="form-control ${(headerError??)?string('is-invalid', '')}"
                      id="header" rows="1"> <#if inputMessage??> "${inputMessage.header}"</#if></textarea>
            <#if headerError??>
                <div class="invalid-feedback">
                    ${headerError}
                </div>
            </#if>
        </div>
        <div class="form-group">
            <label for="text">Текст новости</label>
            <textarea name="text" class="form-control" id="text" rows="6"></textarea>
        </div>
        <div class="form-group">
            <label for="file">Прикрепить картинку для новости</label>
            <input type="file" name="file" class="form-control-file" id="file">
        </div>
        <button type="submit" class="btn btn-primary"> Опубликовать </button>
    </form>
</div>

<div class="row m-3 p-3">
    <div class="block">
        <h3>Загруженные новости</h3>
    </div>
</div>
<div class="table-responsive">
    <table class="table">
        <thead class="thead-light">
        <tr>
            <th scope="col">#</th>
            <th scope="col">Заголовок новости</th>
            <th scope="col">Delete</th>
        </tr>
        </thead>
        <tbody>
    <#list messages as message>
    <tr>
        <th scope="row">${message.id}</th>
        <td>${message.header}</td>
        <td>
            <form action="/admin/deleteMsg" method="post">
                <input type="hidden" name="messageId" value="${message.id}"/>
                <input type="hidden" name="action" value="delete"/>
                <button type="submit" class="btn btn-outline-danger">Delete</button>
            </form>
        </td>
    </tr>
    </#list>
        </tbody>
    </table>
</div>
