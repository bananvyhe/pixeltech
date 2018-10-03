import Vue from 'vue/dist/vue.esm.js'
import Vuex from 'vuex';
Vue.use(Vuex);
console.log("vuex")

import state from './state'
import * as getters from './getters'
import * as mutations from './mutations'
import * as actions from './actions'
import createPersistedState from 'vuex-persistedstate' 

export default new Vuex.Store({

	state,
	getters,
	mutations,
	actions,
	plugins: [createPersistedState()],
})