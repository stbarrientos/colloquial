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
    this.resultsElement.html(data);
  }

};

colloquial.searchController = {
  
  renderView: function(data){
    colloquial.searchView.showResults(data);
  },

  sendSearchRequest: function(json){
    var self = this;
    $.ajax({
      url: "/api/search",
      method: "POST",
      dataType: "html",
      data: json,
      success: function(data){
        console.log(data);
        self.renderView(data);
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

