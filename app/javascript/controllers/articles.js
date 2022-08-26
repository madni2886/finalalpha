$(document).on('turbolinks:load',function (){
    let articles = new Bloodhound({
        datumTokenizer: Bloodhound.tokenizers.whitespace,
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        remote: {
            url: '/articles/autocomplete?query=%QUERY',
            wildcard: '%QUERY'

        }

    });
    $(#articles_search).typeahead(null,{

    });
});