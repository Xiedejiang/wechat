import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/components/user/Login';  //登录路由组件
import Register from '@/components/user/Register';  //注册路由组件
import Index from '@/components/chat/Index';  //聊天路由主组件
import ChatList from '@/components/chat/ChatList';
import Friends from '@/components/chat/Friends';
import Moments from '@/components/chat/Moments';
import Me from '@/components/chat/Me';
import Addfriends from '@/components/chat/Addfriends';
import NotFound from '@/components/NotFound';
import SendFriendMsg from '@/components/chat/SendFriendMsg';
import Chat from '../components/chat/Chat.vue';
import More from '../components/chat/More.vue';
import Mydetail from '../components/chat/Mydetail.vue';
import ChangeAvatar from '../components/chat/ChangeAvatar.vue';
import ChangeNick from '../components/chat/ChangeNick.vue';
import Focuspyq from '../components/chat/Focuspyq.vue';
import FriendDel from '../components/chat/FriendDel.vue';
import Sendpyq from '../components/chat/Sendpyq.vue';

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      component:Index,
      children:[  //子路由
        {
          path:"chatlist",
          component:ChatList,
        },
        {
          path:"",
          component:ChatList
        },
        {
          path:"friends",
          component:Friends
        },
        {
          path:"moments",
          component:Moments
        },
        {
          path:"me",
          component:Me
        },
        {
          path:"addfriends",
          component:Addfriends
        },
        {
          path:"sendfriendmsg/:uid",
          component:SendFriendMsg,
          props:true
        }
      ]
    },  //默认进入聊天界面
    {
      path: '/login',
      name: 'Login',
      component:Login
    },
    {
      path: '/register',
      name: 'Register',
      component:Register
    },
    {
      path:"*",
      component:NotFound
    },  //404
    {
      path:"/chat/:fobj",
      name:"Chat",
      component:Chat
    },
    {
      path:"/chat/More",
      name:"More",
      component:More
    },
    {
      path:"/mydetail",
      name:"Mydetail",
      component:Mydetail
    },
    {
      path:"/changeAvatar",
      name:"ChangeAvatar",
      component:ChangeAvatar
    },
    {
      path:"/changeNick",
      name:"ChangeNick",
      component:ChangeNick
    },
    {
      path:"/focuspyq",
      name:"Focuspyq",
      component:Focuspyq
    },
    {
      path:"/frienddel/:fid",
      name:"FriendDel",
      component:FriendDel
    },
    {
      path:"/sendpyq",
      name:"Sendpyq",
      component:Sendpyq
    },
  ]
})
