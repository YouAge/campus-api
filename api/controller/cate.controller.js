const {GoodsTagModel} = require("../../models/goods_tag.model.js");
const {backMsg200} = require("../../utils/backMsg.js");
const {CateModel} = require("../../models/cate.model.js");
const {ajvValid} = require("../../utils/ajv-verify.js");


const specsSchema = {
  type:'object',
  properties: {
    name: {type: 'string',errorMessage:{type:'必须是字符串或者数字',}},
    superId:{type:'number',default:0},
    picture:{type:'string',errorMessage:{type:'图片地址必须要'}},
    tagId:{type:'number',default:0},
    desc:{type:'string'},
    layer:{type:'number',default:0},
    status:{type:'boolean',default: false},
  },
  required:['name','picture']
}

async function catePostController(ctx, next){
  const data = ctx.request.body || ctx.request.params  || {}
  ajvValid(data,specsSchema)
  // 查询是否存在，
  // 数据存储
  // console.log(data)
  const node =  await CateModel.create(data)
  ctx.body = backMsg200({data:node.id})
}

async function cateUpdateController(ctx,next){
  const data = ctx.request.body || ctx.request.params  || {}
  const id = data.id
  delete data.id
  await CateModel.update(
    {...data},{where:{id}})
  ctx.body = backMsg200({})
}

async function cateGetController(ctx, next) {
  const item = await CateModel.findAll(
    {where: {superId: 0}, include: {model: CateModel, as: 'children'}}
  )
  // 处理数据
  ctx.body = backMsg200({data: item, msg: "OK"})
}

async function cateDelController(ctx,next){
  const id = ctx.query.id
  await CateModel.destroy({where:{id}})
  ctx.body = backMsg200({})
}



//tags
async function tagGetController(ctx, next) {
  const item = await GoodsTagModel.findAll({})
  // 处理数据
  ctx.body = backMsg200({data: item, msg: "OK"})
}

async function tagAddPostController(ctx, next) {
  const data = ctx.request.body || ctx.request.params || {}
  const node = await GoodsTagModel.create(data)
  // 处理数据
  ctx.body = backMsg200({data: node.id})
}

async function tagDelController(ctx,next){
  const id = ctx.query.id

  await GoodsTagModel.destroy({where:{id}})
  ctx.body = backMsg200({})
}





module.exports = {
  catePostController,
  cateGetController,
  tagGetController,
  tagAddPostController,
  tagDelController,
  cateDelController,
  cateUpdateController
}
