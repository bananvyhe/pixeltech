/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.
// import TurbolinksAdapter from 'vue-turbolinks';
// Vue.use(TurbolinksAdapter)
// import Vue from 'vue/dist/vue.esm.js'
import Vue from 'vue'
import axios from 'axios'

import Topsidepanel from '../topsidepanel.vue'
import Reg from '../components/registration.vue'
import Log from '../components/login.vue'
import Head from '../head.vue'
import Headvk from '../headvk.vue'
import Boar from '../boar.vue'
import Request from '../components/request.vue'
import Hat from '../hat.vue'
import VmBackTop from '../back-top.vue'
import Filther from '../components/filther.vue'
import Addpublic from '../components/addpublic.vue'
import Lobby from '../lobby.vue'
import Posts from '../components/forum/posts.vue'
import Callboard from '../components/callboard/callboard.vue'
import Chat from '../chat.vue'
import App from '../app.vue'
import Siteown from '../siteown.vue'
import Port from '../components/port.vue'
import Gamebo from '../components/gamebo.vue'

import '../../../public/theme/index.css'

import { EmojiPickerPlugin } from 'vue-emoji-picker'
Vue.use(EmojiPickerPlugin)




Vue.component('reg', Reg)
Vue.component('log', Log)
Vue.component('request', Request)
Vue.component('filther', Filther)
Vue.component('addpublic', Addpublic)
Vue.component('topsidepanel', Topsidepanel)
 
Vue.component('port', Port)
Vue.component('request', Request)
Vue.component('siteown', Siteown)
Vue.component('gamebo', Gamebo)

import store from 'store'
import createPersistedState from 'vuex-persistedstate'
import VueChatScroll from 'vue-chat-scroll'
Vue.use(VueChatScroll)

import Vuex from 'vuex';

Vue.use(Vuex);

// import colors from 'vuetify/lib/util/colors'

Vue.use(Vuetify, {
	components: {
		// VRadio,
		// VRadioGroup,
		// VTextField,
		// VCol,
		// VRow,
		// VContainer,
		// VForm,
		// VIcon,
		// VSpacer,
		// VToolbarTitle,
		// VAppBarNavIcon,
		// VAppBar,
		// VMain,
		// VApp,
		// VAlert,
		// VCard,
		// VCardActions,
		// VBtn,
		// VListItem,
		// VListItemContent,
		// VListItemTitle,
		// VListItemSubtitle,
		// VListItemAvatar,
	}
}) 

import Vuetify, {
	// VRadio,
	// VRadioGroup,
	// VTextField,
	// VCol,
	// VRow,
	// VContainer,
	// VForm,
	// VIcon,
	// VSpacer,
	// VToolbarTitle,
	// VAppBarNavIcon,
	// VAppBar,
	// VMain,
	// VApp,
	// VAlert,
	// VCard,
	// VCardActions,
	// VBtn,
	// VListItem,
	// VListItemContent,
	// VListItemTitle,
	// VListItemSubtitle,
	// VListItemAvatar,
} from 'vuetify/lib'

const opts = {
 	theme: {
    dark: true,
    themes: {	
      	dark: {
       
 
 
      	//  info: '#2196F3',
      	// accent: '#82B1FF',
      	// success: '#FFC107',
      	// error: '#FF5252',
       //  primary: '#3f51b5',
       //  secondary:'#ffb700',
       //  anchor: '#8c9eff',
       //  depressed: '#FFC107',
       //  warning: '#FFC107',
	      }
    }
  }   	
}
	    
Vue.component("topsidepanel", Topsidepanel);
Vue.component("heado", Head);
Vue.component("posts", Posts);
Vue.component("siteown", Siteown);

document.addEventListener('DOMContentLoaded', () => {

	var app = document.getElementById("app") 
  if (app != null) {
	 new Vue({
  	store,
    el: '#app',
    vuetify: new Vuetify(opts),
    render: h => h(App) 
	  })
	}
	var siteown = document.getElementById("siteown") 
  if (siteown != null) {
	 		 new Vue({
  	store,
    el: '#siteown',
    vuetify: new Vuetify( 
    
    opts),
    render: h => h(Siteown) 
	  })
	}
	var callboard = document.getElementById("callboard") 
  if (callboard != null) {
	  new Vue({
	  	store,
	    el: '#callboard',
	    render: h => h(Callboard) 
	  })
	}		
	var chat = document.getElementById("chat") 
  if (chat != null) {
	  new Vue({
	  	store,
	    el: '#chat',
	    render: h => h(Chat) 
	  })
	}	

	var lobby = document.getElementById("lobby") 
  if (lobby != null) {
	  new Vue({
	  	store,
	    el: '#lobby',
	    render: h => h(Lobby) 
	  })
	} 
	var aas = document.getElementById("VmBackTop") 
  if (aas != null) {
		new Vue({
	    el: aas,
	    render: h => h(VmBackTop)
	  })
	}
	var hat = document.getElementById("hat") 
  if (hat != null) {
	  new Vue({
	  	store,
	    el: '#hat',
	    render: h => h(Hat) 
	  })
	}
	var users = document.getElementById("users") 
  if (users != null) {
	  new Vue({
	  	store,
	    el: '#users',
	    
	  })
	}

	var headvk = document.querySelector('#headvk')
  if (headvk != null) {
	  new Vue({
	  	store,
	    el: headvk,
	    template: "<Headvk/>",
			components: {Headvk} 
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

	var currentrole = document.querySelector('.currentrole')
	if (currentrole != undefined) {
		new Vue({
			store,
	    components: { Currentrole }
	  }).$mount('.currentrole')
	}

				jQuery(function($){
					$(".deleteAction").click( function(){
						var current_item_tr = $(this).parents('div')[0];
						if(confirm("Точно удалить?")){
							$.ajax({
								beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
								url: window.location.href + '/' + $(current_item_tr).attr('data-item_id'),
								type: 'POST',
								data: { _method: 'DELETE'},
								success: function(){
									$(current_item_tr).fadeOut(200);
								}
							});
						};
					});
				});
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

