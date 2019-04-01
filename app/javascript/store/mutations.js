// export const loginUser = (state)  => {
//       state.token = true;
//     } 
// export const expsend = (state,  exp ) => {
// 	state.exp = exp
// }
// export const expsend2 = (state,  exp2 ) => {
// 	state.exp2 = exp2
// }
export const tokensend = (state,  token ) => {
	state.token = token 
	 
}
export const gamesend = (state,  game ) => {
	state.gamebo = game 
	 
}
export const refreshsend = (state,  token ) => {
	state.refreshToken = token 
	 
}
export const rolensend = (state,  role ) => {
	state.role = role
}
// export const username = (state,  username ) => {
// 	state.username = username
// }