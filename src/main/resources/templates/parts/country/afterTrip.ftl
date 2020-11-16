<h3>Раздел после путешествия</h3>
    <div>
        <form name="after-trip-form" method="post" action="admin/country/afterTrip"
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
                <label for="afterTripText"></label>
                <textarea name="afterTripText" class="form-control" id="afterTripText"
                          rows="8"></textarea>
            </div>
            <button type="submit" class="btn btn-primary"> Добавить</button>
        </form>
    </div>