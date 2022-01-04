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
    userId: {type: 'number',errorMessage:{type:'必须是数字'}},
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
  return  backMsg200({data:shopUsers})
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
  ctx.body =  backMsg200({data:{user,token},msg:'欢迎回来'})

}






// -------shop user------

const loginSchema = {
  type:'object',
  properties: {
    username: {type: "string",format:'email',},
    password: {type: 'string',minLength:3,errorMessage:{minLength:'长度必须大于3',}},
  },
  required:['username','password']
}

// 用户登入
async function shopUserLoginController(ctx,next){
  const data = ctx.request.body || ctx.request.params  || {}
  ajvValid(data,loginSchema)
  const user = await GoodUserModel.findOne({
    where:{email:data.username,status:true},
  })
  if(!user)return   ctx.body = backMsg400({msg:'用户名不存在'})

  if(!bcrypt.compareSync(data.password,user.password)) return  ctx.body = backMsg400({msg:'账号或密码错误'})
  // 生成token
  const token = jwt.sign({id:user.id,email:user.email,username:user.username}, shopSecret, { expiresIn: expTime })
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
    const user = await GoodUserModel.findOne({where:{id:data.id}})
    ctx.body = backMsg200({data:user,msg:'验证通过'})
  }catch (e) {
    ctx.body = backMsg401({})
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
  adminUserLogin
}
