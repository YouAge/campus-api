const jwt = require('jsonwebtoken')
const {expTime} = require("../../config");
const {shopSecret} = require("../../config");
const bcrypt = require('bcryptjs')
const {adminSecret} = require("../../config");
const {AdminUserModel} = require("../../models/admin_user.model");
const {backMsg400} = require("../../utils/backMsg.js");
const {backMsg401} = require("../../utils/backMsg.js");
const {AddressModel} = require("../../models/address.model.js");
const {backMsg200} = require("../../utils/backMsg.js");
const {GoodUserModel} = require("../../models/good_user.model.js");
const {ajvValid} = require("../../utils/ajv-verify.js");
const schema = {
  type:'object',
  properties: {
    // userId: {type: 'number',errorMessage:{type:'必须是数字'}},
    pageSize: {type: 'number',default: 100,errorMessage:{type:'必须是字符串或者数字',}},
    pageIndex:{type:'number',default: 1,errorMessage:{type:'是一个数组包裹'}},
  },
  // required:['cateId']
}

async function shopUserPageController(ctx,next){
  const data = ctx.query
  ajvValid(data,schema)
 const shopUsers =  await GoodUserModel.findAndCountAll({
   include:{
     model:AddressModel,
     as:"address"
   },
    limit:data.pageSize,
    offset:  (data.pageIndex - 1) * data.pageSize,
  })
  ctx.body = backMsg200({data:shopUsers})
}
const updateSchema = {
  type:'object',
  properties: {
    // userId: {type: 'number',errorMessage:{type:'必须是数字'}},
    // pageSize: {type: 'number',default: 100,errorMessage:{type:'必须是字符串或者数字',}},
    // pageIndex:{type:'number',default: 1,errorMessage:{type:'是一个数组包裹'}},
    type:{type:'number',enum:[1,2,3,4,5]}
  },
  required:['type']
}
async function updateUserPageController(ctx,next){
  const data = ctx.query
  ajvValid(data,schema)
  if(data.type ===1){
    await GoodUserModel.update({status:data.status},{where:{id:data.id}})
    return  ctx.body = backMsg200({})
  }
  ctx.body = backMsg200({})
}



const loginAdminSchema = {
  type:'object',
  properties: {
    username: {type: "string"},
    password: {type: 'string',minLength:3,errorMessage:{minLength:'长度必须大于3',}},
  },
  required:['username','password']
}
// 管理员账号登入
async function adminUserLogin(ctx,next){
  const data = ctx.request.body || ctx.request.params  || {}
  ajvValid(data,loginAdminSchema)
  const user = await AdminUserModel.findOne({
    where:{username:data.username,status:true},
  })
  if(!user)return   ctx.body = backMsg400({msg:'用户名不存在'})

  if(!bcrypt.compareSync(data.password,user.password)) return  ctx.body = backMsg400({msg:'账号或密码错误'})
  // 生成token
  const token = jwt.sign({id:user.id,email:user.email,username:user.username}, adminSecret, { expiresIn: expTime })
  user.password = ''
  ctx.body =  backMsg200({data:{user,token},msg:'欢迎回来'})

}

async function adminUserInfo(ctx,next){
  const token = ctx.request.headers.amintoken || ''
  try {
    const data = jwt.verify(token,adminSecret)
    const user = await AdminUserModel.findOne({where:{id:data.id},attributes: { exclude: ['password'] }})
    ctx.body = backMsg200({data:user,msg:'验证通过'})
  }catch (e) {
    ctx.body = backMsg401({})
  }
}


const addAdminSchema = {
  type:'object',
  properties: {
    username: {type: "string"},
    password: {type: 'string',minLength:3,errorMessage:{minLength:'长度必须大于3',}},
  },
  required:['username','password']
}
async function addAdminUser(ctx,next){
  const data = ctx.request.body || ctx.request.params  || {}
  console.log(data)
  ajvValid(data,addAdminSchema)
  const user = await AdminUserModel.findOne({
    where:{username:data.username},
  })
  if(user)return   ctx.body = backMsg400({msg:'用户名以存在'})
  await AdminUserModel.create(data)
  ctx.body = backMsg200({msg:'添加成功'})
}

async function getAdminUser(ctx,next){
  const data = ctx.query
  ajvValid(data,schema)
  const shopUsers =  await AdminUserModel.findAndCountAll({
    where:{},
    // limit:data.pageSize,
    // offset:  (data.pageIndex - 1) * data.pageSize,
  })
  ctx.body = backMsg200({data:shopUsers})
}
async function delAdminUser(ctx,next){
  const id = ctx.query.id
  await AdminUserModel.destroy({where:{id}})
  ctx.body = backMsg200({})}


// -------shop user------

const loginSchema = {
  type:'object',
  properties: {
    username: {type: "string",},
    password: {type: 'string'},
    code:{type:'string',},
    isIphone:{type:'boolean'}
  },
  required:['username']
}

// 用户登入
async function shopUserLoginController(ctx,next){
  const data = ctx.request.body || ctx.request.params  || {}
  ajvValid(data,loginSchema)
  let user = null
  if(!data.isIphone){
     user = await GoodUserModel.findOne({
      where:{email:data.username,status:true},
    })
    if(!user)return   ctx.body = backMsg400({msg:'用户名不存在'})
    if(!bcrypt.compareSync(data.password,user.password)) return  ctx.body = backMsg400({msg:'账号或密码错误'})
  }else {
    user = await GoodUserModel.findOne({
      where:{iphone:data.username,},
    })
    if(!user){
      await GoodUserModel.create({username:'带修改',iphone:data.username,password:'',status:true})
      user = await GoodUserModel.findOne({
        where:{iphone:data.username,status:true},
      })
    }else {
      if(!user.status){
        return   ctx.body = backMsg400({msg:'用户名已经被限制'})
      }
    }

  }
  // 生成token
  const token = jwt.sign({id:user.id,email:user.email,username:user.username}, shopSecret, { expiresIn: expTime })
  user.password = ''
  ctx.body =  backMsg200({data:{user,token},msg:'欢迎回来'})
}

const registerSchema = {
  type:'object',
  properties: {
    username: {type: 'string'},
    password: {type: 'string',minLength:3,errorMessage:{minLength:'长度必须大于3',}},
    email: {type: "string",format:'email', },
    iphone: {type: 'string',maxLength:11 ,errorMessage:{minLength:'长度11',}},
    sex: {type: 'string',},
    status: {type: 'boolean',default:true},
  },
  required:['email','password']
}

// 用户注册
async function shopUserRegisterController(ctx,next){
  const data = ctx.request.body || ctx.request.params  || {}
  ajvValid(data,registerSchema)
  const [user,created] = await GoodUserModel.findOrCreate({
    where:{email:data.email},
    defaults:data // 不存在就创建
  })
  if(!created)return  ctx.body =  backMsg400({msg:"您创建的邮箱已经存在了"})
  const token = jwt.sign({id:user.id,email:user.email,username:user.username}, shopSecret, { expiresIn: expTime })
  ctx.body =  backMsg200({data:{user,token},msg:'欢迎您加入我们'})
}

// 根据token 获取用户信息
async function shopUserGetInfoController(ctx,next){
  const token = ctx.request.headers.authtoken || ''
  try {
    const data = jwt.verify(token,shopSecret)
    const user = await GoodUserModel.findOne({where:{id:data.id}}) //,attributes: { exclude: ['password'] }
    if(user.password){
      user.setDataValue('password',true)
    }
    ctx.body = backMsg200({data:user,msg:'验证通过'})
  }catch (e) {
    ctx.body = backMsg401({})
  }
}
async function updateShopUserInfo(ctx,next){
  const userId = ctx.state.users.id
  const data = ctx.request.body || ctx.request.params  || {}
  if(data.type === 1){
    await GoodUserModel.update({password:data.passwrod},{where:{id:userId}})
    ctx.body = backMsg200({msg:'修改密码成功'})
  }else if(data.type ===2 ){
    await GoodUserModel.update({iphone:data.iphone,desc:data.desc,
        email:data.email,username:data.username,sex:data.sex},
      {where:{id:userId}})
    ctx.body = backMsg200({msg:'信息更新成功'})
  }else {
    ctx.body = backMsg400({msg:'请正常操作0 '})
  }

}


// ---用户地址 --
const addressSchema ={
  properties: {
    name: {type: "string",},
    iPhone: {type: 'string',minLength:11,errorMessage:{minLength:'长度必须大于等于11',}},
    address: {type: 'string',},
    fullLocation: {type: 'string',},
    postalCode: {type: 'string',default:'0000'},
    isDefault:{type: 'boolean',default:false},
    id:{type: "number",}
  },
  required:['name','iPhone','address','fullLocation']
}

async function addUserAddressController(ctx,next){
  const userId = ctx.state.users.id
  const data = ctx.request.body || ctx.request.params  || {}
  ajvValid(data,addressSchema)
  const f =  await AddressModel.create({userId,...data})
  ctx.body =  backMsg200({data:f.id,msg:"新增地址成功"})
}
async function delUserAddressController(ctx,next){
  const userId = ctx.state.users.id
  const data = ctx.request.body || ctx.request.params  || {}
  if(data.ids && Array.isArray(data.ids)){
    for (let id of ids){
      await AddressModel.destroy({where:{id,userId}})
    }
    ctx.body = backMsg200({msg:"ok"})
  }
  ctx.body = backMsg400({msg:"参数格式错误"})

}

async function updateUserAddressController(ctx,next){
  const userId = ctx.state.users.id
  const data = ctx.request.body || ctx.request.params  || {}
  ajvValid(data,addressSchema)
  if(data.isDefault){
    // 设置默认， 其他的
    await AddressModel.update({isDefault:false},{where:{userId}})
  }else {
    await AddressModel.update({...data},{where:{id:data.id,userId}})
  }
  ctx.body =  backMsg200({msg:"更新成功"})
}
async function showUserAddressController(ctx,next){
  const userId = ctx.state.users.id
  const data = await AddressModel.findAll({where:{userId}})
  ctx.body = backMsg200({data,msg:"ok"})
}


module.exports ={
  shopUserPageController,
  shopUserGetInfoController,
  shopUserRegisterController,
  shopUserLoginController,
  addUserAddressController,
  delUserAddressController,
  updateUserAddressController,
  showUserAddressController,
  adminUserLogin,
  updateUserPageController,
  adminUserInfo,
  updateShopUserInfo,
  addAdminUser,
  getAdminUser,
  delAdminUser
}
