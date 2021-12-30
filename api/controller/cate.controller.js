const {backMsg200} = require("../../utils/backMsg.js");
const {CateModel} = require("../../models/cate.model.js");
const {ajvValid} = require("../../utils/ajv-verify.js");


const specsSchema = {
  type:'object',
  properties: {
    name: {type: 'string',errorMessage:{type:'必须是字符串或者数字',}},
    superId:{type:'number',default:0},
    picture:{type:'string',errorMessage:{type:'图片地址必须要'}},
    desc:{type:'string'},
    layer:{type:'number',default:0},
    status:{type:'boolean',default: false},
  },
  required:['name','picture']
}

async function catePostController(ctx,next){
  const data = ctx.request.body || ctx.request.params  || {}
  ajvValid(data,specsSchema)
  // 查询是否存在，
  // 数据存储
  // console.log(data)
  const node =  await CateModel.create(data)
  ctx.body = backMsg200({data:node.id})
}

async function cateGetController(ctx,next){
  const item = await CateModel.findAll(
    {where:{superId:0},include:{model:CateModel,as:'children'}}
  )
  // 处理数据
  console.log(item)
  ctx.body = backMsg200({data:item,msg:"OK"})
}



module.exports = {
  catePostController,
  cateGetController
}
