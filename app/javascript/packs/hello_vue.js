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

// import App from '../app.vue'
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
// import CommentVotes from '../components/commentvotes.vue'
// import Inv from '../components/inventory.vue'
// import Topsection from '../components/topsection.vue'
// Vue.component('topsection', Topsection)
// import Currentrole from '../railsvars/currentrole.vue'
// Vue.component('currentrole', Currentrole)
import '../../../public/theme/index.css'
// import Vembed from 'vue-embed';
import { EmojiPickerPlugin } from 'vue-emoji-picker'
Vue.use(EmojiPickerPlugin)

// import VTooltip from 'v-tooltip'
// Vue.use(VTooltip) 
// import * as VueWindow from '@hscmap/vue-window'

// Vue.use(VueWindow)
// import VTooltip from 'v-tooltip'

// Vue.use(VTooltip)


Vue.component('reg', Reg)
Vue.component('log', Log)
Vue.component('request', Request)
Vue.component('filther', Filther)
Vue.component('addpublic', Addpublic)
Vue.component('topsidepanel', Topsidepanel)
 
Vue.component('port', Port)
Vue.component('request', Request)
Vue.component('siteown', Siteown)
// Vue.component('inv', Inv)
// Vue.component('vembed', vembed)
// Vue.component('v-embed', {
// 	// name: 'v-embed',
// 	data: function() {
//     return {
//      options: {
//         plugins: [{
//           name: 'emoji',
//           options: {
 
//           }
//         }]
//       },      
//     }
//   },	
// 	template:  '<v-embed :options="options"></v-embed>'
// })




// Vue.component("temperature", {
//   template: "#temperature-template",
//   data: function() {
//     return {temp: '123', location: null};
//   },
//   created: function() {
//     // this.fetchData();
//   },
//   methods: {
//   	reload: function() {
//   		location.reload(true);
//   		// window.location.href = window.location.href;
//   	},
//   	deleteuser: function(id ) {
//   		axios.delete('/users/'+id, {
//   		// 	headers: {
//   		// 		'Authorization': "bearer " + this.$store.getters.token 
// 				// } 
//   		})
//   		.then(response => {
//   			var ids = String(id)
//   			var dd = ".userstring.del"+ids 
//   			console.log(dd)
//   			$(dd).fadeOut(200);
// 		    // location.reload(true);
// 		  })
//   	}

//   }
// });
import store from 'store'
import createPersistedState from 'vuex-persistedstate'
import VueChatScroll from 'vue-chat-scroll'
Vue.use(VueChatScroll)
// Vue.use(require('@hscmap/vue-window'))
// import * as VueWindow from '@hscmap/vue-window'
// Vue.use(VueWindow)
import Vuex from 'vuex';

Vue.use(Vuex);
// import {DatePicker, TimePicker, Tag, Divider, TabPane, Tabs, Container, Main, InputNumber, Collapse, CollapseItem, ButtonGroup, Tooltip, Alert, Badge, RadioGroup, Radio, Transfer, Card, Slider, Icon, Popover, Notification, Progress, Button, Switch, Dialog, Select, Form, FormItem, Input, Option, Message, Checkbox, Carousel, CarouselItem, Loading} from 'element-ui';
// // Vue.prototype.$message = Message; 

// Vue.prototype.$ELEMENT = { size: 'small', zIndex: 3000 }; 
// // Vue.use(Message);
// Vue.use(DatePicker);
// Vue.use(TimePicker);
// Vue.use(Tag);
// Vue.use(Divider);
// Vue.use(TabPane);
// Vue.use(Tabs);
// Vue.use(Main);
// Vue.use(Container);
// Vue.use(InputNumber);
// Vue.use(Collapse);
// Vue.use(CollapseItem);
// Vue.use(ButtonGroup);
// Vue.use(Tooltip);
// Vue.use(Alert);
// Vue.use(Badge);
// Vue.use(RadioGroup);
// Vue.use(Radio);
// Vue.use(Transfer);
// Vue.use(Card);
// Vue.use(Slider)
// Vue.use(Icon)
// Vue.use(Popover)
// Vue.use(Progress) 
// Vue.use(Button) 
// Vue.use(Dialog)  
// Vue.use(Form)  
// Vue.use(FormItem)  
// Vue.use(Input)  
// Vue.use(Select)
// Vue.use(Option)
// Vue.use(Checkbox)
// Vue.use(Switch)
// Vue.use(Carousel)
// Vue.use(CarouselItem)
// Vue.use(Loading.directive);
// Vue.prototype.$notify = Notification;
// Vue.prototype.$message = Message;
import lang from 'element-ui/lib/locale/lang/ru-RU'
import locale from 'element-ui/lib/locale'
import colors from 'vuetify/lib/util/colors'


 // import  VuetifyPreset  from 'vuetify/types/services/presets'
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
	},
}) 


 // import 'vuetify/dist/vuetify.min.css'
 locale.use(lang)
// import 'vuetify/dist/vuetify.min.css'
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
 
// 			options: {
//       customProperties: true,
//     },
// 	// customVariables: ['~/app/scss/variables.scss'],
	
// 	 theme: {

// 		    dark: {

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
      },
    },
  },
      
// 		    // 	// background: '#3B4DAC',
		 

		    	
		    }
		    
 
		 
// 		  },
// }

Vue.component("topsidepanel", Topsidepanel);
Vue.component("heado", Head);
Vue.component("posts", Posts);
Vue.component("siteown", Siteown);
 // const vuetify = new Vuetify({
 
 // })
document.addEventListener('DOMContentLoaded', () => {
		//pusher implementation

  //---   
  // const el = document.body.appendChild(document.createElement('hello'))
  // const app = new Vue({
  //   el,
  //   render: h => h(App)
  // })
 //  let token = document.getElementsByName('csrf-token')[0].getAttribute('content')
	// axios.defaults.headers.common['X-CSRF-Token'] = token
	// axios.defaults.headers.common['Accept'] = 'application/json'
	// var users = document.getElementById("users") 
 //  if (users != null) {
	// 	new Vue({
	// 	store,
	// 	  el: "#users" 
	// 	})
	// }
	// var commentvotes = document.getElementById("commentvotes") 
 //  if (commentvotes != null) {
	//   new Vue({
	//     el: '#commentvotes',
	//     render: h => h(CommentV+otes) 
	//   })
	// } 

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
	// var topsidepanel = document.getElementById("topsidepanel") 
 //  if (topsidepanel != null) {
	//   new Vue({
 
	//   	store,
	//     el: '#topsidepanel',

	//     render: h => h(Topsidepanel) 
	//   })
	// }	
	// var posts = document.getElementById("posts") 
 //  if (posts != null) {
	//   new Vue({
	//   	store,
	//     el: '#posts',
	//     render: h => h(Posts) 
	//   })
	// } 
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
	// var head = document.getElementById("head") 
 //  if (head != null) {
	//   new Vue({
	//   	store,
	//     el: '#head',
	//     render: h => h(Head) 
	//   })
	// }
	var headvk = document.querySelector('#headvk')
  if (headvk != null) {
	  new Vue({
	  	store,
	    el: headvk,
	    template: "<Headvk/>",
			components: {Headvk} 
	  })
	}
	// var log = document.getElementById("log") 
 //  if (log != null) {
	//   new Vue({
	//   	store,
	//     el: log,
	//     render: h => h(Log) 
	//   })
	// }
	// var reg = document.getElementById("reg") 
 //  if (reg != null) {
	//   new Vue({
	//   	store,
	//     el: '#reg',
	//     render: h => h(Reg) 
	//   })
	// }
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

