<h3>Список источников</h3>
    <div>
        <form name="ref-list-form" method="post" action="admin/country/refList"
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
                <label for="listOfReferencesText"></label>
                <textarea name="listOfReferencesText" class="form-control" id="listOfReferencesText"
                          rows="8"></textarea>
            </div>
            <button type="submit" class="btn btn-primary"> Добавить</button>
        </form>
    </div>