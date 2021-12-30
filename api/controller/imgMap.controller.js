const path = require("path");
const pathExists = require("path-exists");
const fs = require("fs");
const {backMsg400} = require("../../utils/backMsg.js");
const {backMsg200} = require("../../utils/backMsg.js");
const {ImgMapMode} = require("../../models/imgMap.mode.js");
const {ajvValid} = require("../../utils/ajv-verify.js");
const schema = {
  type:'object',
  properties: {
    name: {type: 'string',errorMessage:{type:'必须是字符串或者数字',}},
    superId:{type:'number',default:0},
    value:{type:'string',errorMessage:{type:'图片地址必须要'}},
    desc:{type:'string'},
    layer:{type:'number',default:0},
    status:{type:'boolean',default: true},
  },
  required:['name','value']
}
async function imgPostController(ctx, next){
  const data = ctx.request.body || ctx.request.params  || {}
  ajvValid(data,schema)
  // 查询是否存在，
  // 数据存储
  // console.log(data)
 const s = await ImgMapMode.findOne({where:{
    name:data.name,superId:0
    }})
  if(!s){
    const node =  await ImgMapMode.create(data)
    ctx.body = backMsg200({data:node.id})
  }
  ctx.body = backMsg200({msg:'已存在',})
}

async function imgGetController(ctx,next){
  const item = await ImgMapMode.findAll(
    {where:{superId:0},include:{model:ImgMapMode,as:'children'}}
  )
  // 处理数据
  ctx.body = backMsg200({data:item,msg:"OK"})
}

async function imgMapGetController(ctx,next){
  const paths = ctx.request.body.paths || ctx.params.paths || ''
  let filePath = path.join(process.cwd(),'public/img',paths+'/')
  if(!await pathExists(filePath)){
    return  ctx.body = backMsg200({data:[],msg:"不存在该栏目哦"})
  }
  let filesName = []
  // 获取目录下所有的 文件， 返回
  const files = fs.readdirSync(filePath)
  files.forEach(function (item, index) {
    let stat = fs.lstatSync(filePath + item)
    if(!stat.isDirectory()){
      const f = ('/show/public/img/'+paths+'/'+item).replace(/\/\//,'/')
      filesName.push(process.env.WWW + f)
    }
  })
  ctx.body = backMsg200({data:filesName})
}

module.exports ={
  imgPostController,
  imgGetController,
  imgMapGetController
}
