/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Vue from 'vue/dist/vue.esm.js'
import axios from 'axios'
// import App from '../app.vue'
import Head from '../head.vue'
import Boar from '../boar.vue'


// import Topsection from '../components/topsection.vue'
import TurbolinksAdapter from 'vue-turbolinks'
Vue.use(TurbolinksAdapter)
// Vue.component('topsection', Topsection)

import Reg from '../components/registration.vue'
import Log from '../components/login.vue'
import Currentrole from '../railsvars/currentrole.vue'
Vue.component('currentrole', Currentrole)
Vue.component('reg', Reg)
Vue.component('log', Log)

import store from 'store'
 
import { Button, Dialog, Select, Form, FormItem, Input, Option } from 'element-ui';
Vue.use(Button) 
Vue.use(Dialog)  
Vue.use(Form)  
Vue.use(FormItem)  
Vue.use(Input)  
Vue.use(Select)
Vue.use(Option)
import '../../../public/theme/index.css'

document.addEventListener('turbolinks:load', () => {
  // const el = document.body.appendChild(document.createElement('hello'))
  // const app = new Vue({
  //   el,
  //   render: h => h(App)
  // })
  let token = document.getElementsByName('csrf-token')[0].getAttribute('content')
	axios.defaults.headers.common['X-CSRF-Token'] = token
	axios.defaults.headers.common['Accept'] = 'application/json'
	var head = document.getElementById("head") 
  if (head != null) {
	  new Vue({
	    el: '#head',
	    render: h => h(Head),
	    created() {
		    axios.interceptors.request.use((config) => {
		      config.headers.client = window.localStorage.getItem('client');
		      config.headers['access-token'] = window.localStorage.getItem('access-token');
		      config.headers.uid = window.localStorage.getItem('uid');
		      config.headers['token-type'] = window.localStorage.getItem('token-type');

		      return config;
		    });

		    axios.interceptors.response.use((response) => {
		      // Set user headers only if they are not blank.
		      // If DTA gets a lot of request quickly, it won't return headers for some requests
		      // so you need a way to keep headers in localStorage to gettting set to undefined
		      if (response.headers.client) {
		        localStorage.setItem('access-token', response.headers['access-token']);
		        localStorage.setItem('client', response.headers.client);
		        localStorage.setItem('uid', response.headers.uid);
		        localStorage.setItem('token-type', response.headers['token-type']);
		      }
		      // You have to return the response here or you won't have access to it
		      // later
		      return response;
		    });
		  },
		  beforeMount() {
		    // const API_URL = 'http://localhost:3000/api/';
		    // const VALIDATE_URL = `${API_URL}auth/validate_token`;

		    // // check if the user has a valid token and populate user store info
		    // axios.get(VALIDATE_URL)
		    //   .then((response) => {
		    //     Store.login(response.data.data);
		    //   })
		  },
	  })
	}

	var boards = document.querySelector('#boards')
	if (boards != undefined) {
		const app = new Vue({
			el: boards,
			store,
			data: {
				lists: JSON.parse(boards.dataset.lists)
			},
			template: "<Boar :original_lists='lists' />",
			components: { Boar  } 
		})
	}

	// new Vue({
	// 	el: '[data-behavior="vue1"]' 
	// })
	var currentrole = document.querySelector('.currentrole')
	if (currentrole != undefined) {
		new Vue({
			store,
	    components: { Currentrole }
	  }).$mount('.currentrole')
	}
	// var topsection = document.querySelector('.topsection')
	// if (topsection != undefined) {
	// 	new Vue({
	// 		store,
	//     components: { Topsection }
	//   }).$mount('.topsection')
	// }
	// var reg = document.querySelector('#reg')
	// if (reg != undefined) {
	// 	new Vue({
	// 		el: '#reg',
	// 		render: h => h(Reg)
	// 	})
	// }
})


// The above code uses Vue without the compiler, which means you cannot
// use Vue to target elements in your existing html templates. You would
// need to always use single file components.
// To be able to target elements in your existing html/erb templates,
// comment out the above code and uncomment the below
// Add <%= javascript_pack_tag 'hello_vue' %> to your layout
// Then add this markup to your html template:
//
// <div id='hello'>
//   {{message}}
//   <app></app>
// </div>


// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: {
//       message: "Can you say hello?"
//     },
//     components: { App }
//   })
// })
//
//
//
// If the using turbolinks, install 'vue-turbolinks':
//
// yarn add 'vue-turbolinks'
//
// Then uncomment the code block below:
//
// import TurbolinksAdapter from 'vue-turbolinks'
// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// Vue.use(TurbolinksAdapter)
//
// document.addEventListener('turbolinks:load', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: {
//       message: "Can you say hello?"
//     },
//     components: { App }
//   })
// })
//delete destroy withowt refresh page rails
jQuery(function($){
	$(".deleteAction").click( function(){
		var current_item_tr = $(this).parents('tr')[0];
		if(confirm("Точно удалить?")){
			$.ajax({
				beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
				url: document.location.pathname + '/' + $(current_item_tr).attr('data-item_id'),
				type: 'POST',
				data: { _method: 'DELETE'},
				success: function(){
					$(current_item_tr).fadeOut(200);
				}
			});
		};
	});
});
