var colloquial = {};

colloquial.searchModel = {


  init: function(){
  },

  formatValues: function(values){
    var values_dup = {};
    values_dup["article_title"] = values["title"];
    return values_dup;
  },

  digestResponse: function(json){
    var values_dup = {};
    values_dup["title"] = json["article_title"];
    values_dup["url"] = json["url"];
    return json;
  }

};

colloquial.searchView = {

  fields: {},
  values: {},
  resultsElement: undefined,

  initForm: function(searchFields){
    this.fields = searchFields;
  },

  getFormValues: function(){
    var keys = Object.keys(this.fields);
    for (var i = 0; i < keys.length; i++){
      this.values[keys[i]] = $(this.fields[keys[i]]).val();
    };
    return this.values;
  },

  showResults: function(data){
     console.table(data);
     data = data["result"];
     var htmlString = "";
     for(var i = 0; i < data.length; i++){
       htmlString += "<div class='row'>"
       htmlString += "<div class='col-md-12'>"; 
       htmlString += "<div class='row'>";
       htmlString += "<div class='col-md-10 col-md-offset-1 article'>";
       htmlString += "<h3><a href='" + data[i]["url"] + "'>" + data[i]["title"] + "</a></h3>";

       htmlString += "</div>";
       htmlString += "</div>";
       htmlString += "</div>";
       htmlString += "</div>";
     };

     this.resultsElement.html(htmlString);
  }

};

colloquial.searchController = {
  
  renderView: function(json){
    colloquial.searchView.showResults(json);
  },

  sendSearchRequest: function(json){
    var self = this;
    $.ajax({
      url: "/api/search",
      method: "POST",
      dataType: "json",
      data: json,
      success: function(data){
        var digestedResponse = colloquial.searchModel.digestResponse(data); 
        self.renderView(digestedResponse);
      }
    });
  }
};

$(document).ready(function(){
  
  $(".search-form").on("submit", function(event){
    event.preventDefault();
    var json = colloquial.searchModel.formatValues( colloquial.searchView.getFormValues() );
    colloquial.searchController.sendSearchRequest(json);
  });

  colloquial.searchView.initForm({
    "title": $("#article_title")
  });

  colloquial.searchView.resultsElement = $("#search_results");

});

// Dimitri Assignment
// List all the steps the colloquial mvc takes after you click submit
// Give a brief comment description of what each function does and it's return data (void if null)
// Extend the mvc to evety input in the search form (dropdowns included)

