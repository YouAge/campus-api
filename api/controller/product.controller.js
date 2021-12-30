/**
 *@ github： https://github.com/YouAge
 *@ 文件介绍:
 */


const {GoodsSkuModel} = require("../../models/goods_sku.model.js");
const {GoodsModel} = require("../../models/goods.model.js");
const {backMsg200} = require("../../utils/backMsg.js");
const {ajvValid} = require("../../utils/ajv-verify.js");


const schema = {
  type:'object',
  properties: {
    name: {type: 'string',errorMessage:{
        type:'必须是字符串或者数字',
      }},
    value:{type:'array',errorMessage:{type:'是一个数组包裹'}},
    status: {type:'boolean',default: false},
    cateId:{type:'array'},
    picture:{type:'array',errorMessage:{type:'图片是一个地址'}},
    desc:{type:'string'}, // 描述
    //商品sku  商品多种属性规格， 价格 图片
    sku:{type:'array'},
    specs:{type:'array'},
    particulars:{type:'string',errorMessage:{type:'说明是一个html string'}},

  },
  required:['name','picture','sku',]
}

const demoDate = {
  name:'商品一',
  status:true,
  cateId:1,
  picture:'fds',
  desc:'sdhafhls',
  details:'sdfdsaf',
  skus:[{
    goodsId:10,
    name:'sdf',
    picture : "saf",
    price : 0.0,
    oldPrice : 0.0,
    inventory : 122,
    desc: 'dsds',
    specs: [
      {key:'颜色',value:'红色'},
      {key:'尺码',value:32}
    ]
  }]
}


async function productPostController(ctx, next){
  const data = ctx.request.body || ctx.request.params  || {}
  ajvValid(data,schema)

  // const goodsData = {name:data.name,status: data.status,desc: data.desc,
  //   crate:data.crate[data.crate.length-1],picture: data.picture,particulars: data.particulars}
  // await GoodsSkuModel.create(sku)
  await GoodsModel.create(data,
    {
    include:[{
      model:GoodsSkuModel,
      as:'skus'
    }]}
  )
  ctx.body = backMsg200({msg:'添加商品成功'})
}

async function productGetController(ctx,next){
  const t = await GoodsModel.findAll({
     include:{
       model:GoodsSkuModel,
       as:'skus'
     }
   })
  console.log(t)
  ctx.body = t
}


module.exports ={
  productPostController,
  productGetController
}
