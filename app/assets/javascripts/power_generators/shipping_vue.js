// # axios
axios.defaults.headers.common['X-CSRF-Token'] = $('meta[name="csrf-token"]').attr('content');
axios.defaults.headers.common['Accept'] = 'application/json';

var app = new Vue({
  el: "#app",
  
  data: function () {
    
    return {
      
      zip_code: '', product_id: '',
      result: [],
      is_complete: false
      
    }
  },
  
  methods: {
    set_product: function (event, id) {
      var self;
      if (event) {
        event.preventDefault();
      }
      self = this;
      self.product_id = id;
    },
    calculator: function (event) {
      var url_cep, self, options_headers, formContents;
      
      if (event) {
        event.preventDefault();
      }
      self = this;
      this.zip_code = this.zip_code.trim().replace(/[^0-9]/g, '');
      
      options_headers = {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),
        'Authorization': '',
        'csrf-param': 'authenticity_token'
      };
      
      formContents = {
        ajax_params: {
          id: this.product_id, cep: this.zip_code,
        }
      };
      
      url = '/home/shipping.json';
      axios.post(url, formContents).then(function (response) {
        
        if (response.status === 200 && response.data.success == true) {
          self.result = response.data;
          // alert("Dados retornados com sucesso!");
        } else {
          self.result = response.data;
          alert("Algo deu errado!");
        }
        
      }).catch(function (error) {
        alert("Algo deu errado!");
        console.log('fail');
        console.log(JSON.stringify(error));
      });
      
    }
    
  }
});

var element = document.getElementById("app");

