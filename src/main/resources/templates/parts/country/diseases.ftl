<h3>Добавление других болезней</h3>
<div>
    <form name="vaccine-form" method="post" action="admin/country/diseases"
          enctype="multipart/form-data">
        <div class="form-group">
            <select class="custom-select" name="countryId" required
                    title="Выбор страны">
                <#list allCountry as country>
                    <option value="${country.id}">${country.countryName}</option>
                </#list>
            </select>
        </div>
        <div class="form-group">
            <label for="disName">Название болезни</label>
            <textarea name="disName" class="form-control" id="disName"
                      rows="1"></textarea>
        </div>
        <div class="form-group">
            <label for="url">Ссылка </label>
            <textarea name="url" class="form-control" id="url" rows="1"></textarea>
        </div>
        <div class="form-group">
            <label for="prevention">Профилактика</label>
            <textarea name="prevention" class="form-control" id="prevention"
                      rows="6"></textarea>
        </div>
        <div class="form-group">
            <label for="comment">Комментарий</label>
            <textarea name="comment" class="form-control" id="comment"
                      rows="6"></textarea>
        </div>
        <button type="submit" class="btn btn-primary"> Добавить</button>
    </form>
</div>

<div class="row m-3 p-3">
    <div class="block">
        <h3>Другие заболевания</h3>
    </div>
</div>
<div class="table-responsive">
    <table class="table">
        <thead class="thead-light">
        <tr>
            <th scope="col">#</th>
            <th scope="col">Название болезни</th>
            <th scope="col">Delete</th>
        </tr>
        </thead>
        <tbody>
            <#list allCountry as country>
            <tr>
                <td colspan="3">${country.countryName}</td>
            </tr>
            <#if country.otherDiseasesSet??>
                <#list country.otherDiseasesSet as diseases>
                <tr>
                    <th scope="row">${diseases.id}</th>
                    <td>${diseases.disName}</td>
                    <td>
                        <form action="/admin/country/diseases/${diseases.id}"
                              method="post">
                            <input type="hidden" name="countryId"
                                   value="${country.id}">
                            <input type="hidden" name="action" value="delete"/>
                            <button type="submit" class="btn btn-outline-danger">
                                Delete
                            </button>
                        </form>
                    </td>
                </tr>
                </#list>
            </#if>
            </#list>
        </tbody>
    </table>
</div>