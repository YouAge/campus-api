const {hierarchy} = require("../../utils");
const {ajvValid} = require("../../utils/ajv-verify.js");
const {backMsg200} = require("../../utils/backMsg.js");

const {SpecsModel} = require("../../models/specs.model.js");
const {RoleModel} = require('../../models/role.model.js')
const {GoodUserModel} = require('../../models/good_user.model.js')
const {GoodsModel} = require('../../models/goods.model.js')
const {GoodsSkuModel} = require('../../models/goods_sku.model.js')


const specsSchema = {
  type:'object',
  properties: {
    name: {type: 'string',errorMessage:{
        type:'必须是字符串或者数字',
      }},
    value:{type:'array',errorMessage:{type:'是一个数组包裹'}},
  },
  required:['name']
}



async function specsController(ctx,next){
  const data = ctx.request.body || ctx.request.params  || {}
  ajvValid(data,specsSchema)
  // 数据存储
  const node =  await SpecsModel.create({name:data.name,desc:'zhe'})
  //存
  let values = []
  data.value.forEach(item=>values.push({name: item,superId:node.id}))
  await SpecsModel.bulkCreate(values)
  ctx.body = backMsg200({data:node.id})
}


async function showSpecsController(ctx,next){
  const item = await SpecsModel.findAll({
    where:{
      superId:0,
    },
    include:{
      model:SpecsModel,
      as:'value'
    }
  })
  // 处理数据
  ctx.body = backMsg200({data:item,msg:"OK"})
}
module.exports ={
  specsController,
  showSpecsController
}
